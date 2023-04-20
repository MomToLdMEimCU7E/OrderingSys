package com.example.demo.service.Impl;

import com.example.demo.Vo.SelectOrderVo;
import com.example.demo.Vo.SelectStatusVo;
import com.example.demo.Vo.UidMoneyVo;
import com.example.demo.common.Result;
import com.example.demo.entity.*;
import com.example.demo.mapper.*;
import com.example.demo.service.IOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

@Service
public class OrderService implements IOrderService {
    @Resource
    OrderMapper orderMapper;
    @Resource
    UserOrderMapper userOrderMapper;
    @Resource
    UserMarketMapper userMarketMapper;
    @Resource
    MeetingMapper meetingMapper;
    @Resource
    GroupClassMapper groupClassMapper;
    @Resource
    SequenceMapper sequenceMapper;
    @Resource
    MarketMapper marketMapper;
    @Resource
    MarketAfterMapper marketAfterMapper;

    @Override
    public Result<?> getAllOrder() {
        return Result.success(orderMapper.getAll());
    }

    @Override
    public Result<?> generateSequence(Integer meetingId) {
        Integer groupId = meetingMapper.getGroupId(meetingId);
        Integer last = groupClassMapper.getLastMeetingId(groupId);//获取上一次订货会的id，用来查找市场老大

        List<Integer> marketIdList = marketMapper.getMarketIdByYear("%" + meetingMapper.getTime(meetingId) + "%");
        //获得该meetingId中开放的市场

        marketIdList.forEach(marketId -> {
            List<UidMoneyVo> uidMoneyVoList = userMarketMapper.getUidAndMoney(marketId, meetingId);

            Collections.sort(uidMoneyVoList, Comparator.comparingInt(UidMoneyVo::getIntMoney));
            Collections.reverse(uidMoneyVoList);//按照money从大到小对uid进行排序

            AtomicBoolean isBossAdvertise = new AtomicBoolean(false);//判断上期市场老大这期是否在这个市场投广告费

            Integer bossUid = marketAfterMapper.getBossUid(last, marketId);
            AtomicInteger rank = new AtomicInteger();

            uidMoneyVoList.forEach(uidMoneyVo -> {
                if(uidMoneyVo.getUid().equals(bossUid)){
                    isBossAdvertise.set(true);
                }
            });
            if(uidMoneyVoList.size() > 0){
                if(bossUid == null || uidMoneyVoList.get(0).getUid().equals(bossUid) || !isBossAdvertise.get()) {
                    rank.set(1);//该市场没有市场老大或者上期市场老大这次还是第一名或者市场老大这次没有投广告费，广告费第一名排序1
                    uidMoneyVoList.forEach(uidMoneyVo -> {
                        Sequence sequence = new Sequence();
                        sequence.setMarketId(marketId);
                        sequence.setSequence(rank.get());
                        sequence.setUid(uidMoneyVo.getUid());
                        sequence.setMeetingId(meetingId);
                        sequence.setIsFinished("0");
                        rank.incrementAndGet();//等效于rank++
                        sequenceMapper.insert(sequence);
                    });
                } else {
                    Sequence sequenceBoss = new Sequence();
                    sequenceBoss.setMarketId(marketId);
                    sequenceBoss.setSequence(1);
                    sequenceBoss.setUid(bossUid);
                    sequenceBoss.setMeetingId(meetingId);
                    sequenceBoss.setIsFinished("0");
                    sequenceMapper.insert(sequenceBoss);

                    rank.set(2);//rank1让给上期的市场老大，这次的排序剩下的从第二开始
                    uidMoneyVoList.forEach(uidMoneyVo -> {
                        if(!uidMoneyVo.getUid().equals(bossUid)) {//接下来对非bossUid的uid进行排序
                            Sequence sequence = new Sequence();
                            sequence.setMarketId(marketId);
                            sequence.setSequence(rank.get());
                            sequence.setUid(uidMoneyVo.getUid());
                            sequence.setMeetingId(meetingId);
                            sequence.setIsFinished("0");
                            rank.incrementAndGet();//等效于rank++
                            sequenceMapper.insert(sequence);
                        }
                    });
                }
                MarketAfter marketAfter = new MarketAfter(meetingId, marketId, uidMoneyVoList.get(0).getUid());

                marketAfterMapper.insert(marketAfter);//存放市场老大数据
            }
        });
        GroupClass groupClass = groupClassMapper.selectById(groupId);
        groupClass.setLastMeetingId(meetingId);
        groupClassMapper.updateById(groupClass);//更新对应Group的lastMeetingId

        return Result.success();


    }

    @Override
    public Result<?> getOrderByYear(String year) {
        return Result.success(orderMapper.getOrdersByYear(year));
    }

    @Override
    public Result<?> selectOrder(List<SelectOrderVo> selectOrderVoList) {

        if(selectOrderVoList.size() > 0) {
            Integer marketId = selectOrderVoList.get(0).getMarketId();
            Integer uid = selectOrderVoList.get(0).getUid();
            Integer meetingId = selectOrderVoList.get(0).getMeetingId();

            selectOrderVoList.forEach(selectOrderVo -> {
                UserOrder userOrder = new UserOrder();
                userOrder.setOrderId(selectOrderVo.getOrderId());
                userOrder.setMeetingId(selectOrderVo.getMeetingId());
                userOrder.setTime(selectOrderVo.getTime());
                userOrder.setUid(selectOrderVo.getUid());
                userOrderMapper.insert(userOrder);
            });

            Sequence sequence = sequenceMapper.getSequenceByMarketAndUidAndMeeting(marketId, uid, meetingId);
            sequence.setIsFinished("已完成");
            sequenceMapper.updateById(sequence);//对应的用户的市场的选择状态设置为完成

        }

        return Result.success();
    }

    @Override
    public Result<?> getOrderAvailable(Integer meetingId, Integer marketId, Integer uid) {
        String meetingTime = meetingMapper.getTime(meetingId);
        List<Market> marketList = marketMapper.getMarketByYear("%" + meetingTime + "%");

        Market market = new Market();
        for (int i = 0; i < marketList.size(); i++) {
            if (marketList.get(i).getMarketId().equals(marketId)){
                market = marketList.get(i);
            }
        }
        //找出和传入marketId对应的那个market的数据

        List<Orders> ordersList = orderMapper.getOrdersByAvailable(meetingTime, market.getMarketProduct(), market.getMarketLocation());
        //获取对应marketId以及year的应有的订单

        List<String> userOrderIdList = userOrderMapper.getOrderIdList(meetingId);//获取给订货会上已经被选择了的订单

        for (int i = 0; i < userOrderIdList.size(); i++) {
            for (int j = 0; j < ordersList.size(); j++) {
                if (ordersList.get(j).getOrderId().equals(userOrderIdList.get(i))) {
                    ordersList.remove(j);//去除orderList中orderId已经被选择了的
                    break;
                }
            }
        }
        sequenceMapper.startSelect(uid, marketId, meetingId);

        return Result.success(ordersList);
    }

    @Override
    public Result<?> getSelectedOrder(Integer uid, Integer meetingId) {
        List<String> ordersIdList = userOrderMapper.getOrderIdListByUid(uid, meetingId);

        List<Orders> ordersList = new ArrayList<>();

        for (int i = 0; i < ordersIdList.size(); i++) {
            ordersList.add(orderMapper.getOrderById(ordersIdList.get(i)));
        }

        return Result.success(ordersList);
    }

    @Override
    public Result<?> getSelectStatus(Integer uid, Integer meetingId) {
        List<Integer> marketIds = userMarketMapper.getSelectedMarket(uid, meetingId);
        List<SelectStatusVo> selectStatusVos = new ArrayList<>();
        for (int i = 0; i < marketIds.size(); i++) {
            SelectStatusVo selectStatusVo = new SelectStatusVo(marketIds.get(i), sequenceMapper.getSelectStatus(marketIds.get(i), uid, meetingId));
            selectStatusVos.add(selectStatusVo);
        }

        return Result.success(selectStatusVos);
    }
}
