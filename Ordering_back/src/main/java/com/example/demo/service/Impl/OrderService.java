package com.example.demo.service.Impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.demo.Vo.OrderVo;
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

    static String[] marketType = {"本地", "区域", "国内", "亚洲", "国际"};
    static String[] productType = {"P1", "P2", "P3", "P4"};

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

            Collections.sort(uidMoneyVoList, Comparator.comparingDouble(UidMoneyVo::getDoubleMoney));
            Collections.reverse(uidMoneyVoList);//按照money从大到小对uid进行排序

            //对list中投了相同广告费的用户进行排序
            int i = 0;
            while (i < uidMoneyVoList.size()){
                int j = uidMoneyVoList.size() - 1;
                while (j >= i){
                    if (uidMoneyVoList.get(j).getMoney().equals(uidMoneyVoList.get(i).getMoney())){
//                        List<UidMoneyVo> temp = new ArrayList<>();
                        List<UidMoneyVo> moneyMarketList = new ArrayList<>();//本年度该市场投放的广告费

                        for (int k = i; k <= j; k++) {
//                            temp.add(uidMoneyVoList.get(k));
                            Double moneyMarket = Double.parseDouble(userMarketMapper.getMarketSum(uidMoneyVoList.get(k).getUid(), meetingId, marketMapper.getLocation(marketId)));
                            moneyMarketList.add(new UidMoneyVo(uidMoneyVoList.get(k).getUid(), moneyMarket.toString()));
                        }
                        Collections.sort(moneyMarketList, Comparator.comparingDouble(UidMoneyVo::getDoubleMoney));
                        Collections.reverse(moneyMarketList);

//                        for (int k = 0; k < temp.size(); k++) {
//                            temp.get(k).setUid(moneyMarketList.get(k).getUid());
//                            temp.get(k).setMoney(moneyMarketList.get(k).getMoney());
//                        }

                        int ii = 0;
                        while (ii < moneyMarketList.size()){
                            int jj = moneyMarketList.size() - 1;
                            while (jj >= ii){
                                if (moneyMarketList.get(jj).getMoney().equals(moneyMarketList.get(ii).getMoney())){
                                    List<UidMoneyVo> moneyYearList = new ArrayList<>();
                                    for (int kk = ii; kk <= jj; kk++) {
                                        Double moneyYear = Double.parseDouble(userMarketMapper.getYearSum(moneyMarketList.get(kk).getUid(), meetingId));
                                        moneyYearList.add(new UidMoneyVo(moneyMarketList.get(kk).getUid(), moneyYear.toString()));
                                    }
                                    Collections.sort(moneyYearList, Comparator.comparingDouble(UidMoneyVo::getDoubleMoney));
                                    Collections.reverse(moneyYearList);

                                    int ll = 0;
                                    for (int kk = ii; kk <= jj; kk++){
                                        Integer uid = moneyYearList.get(ll).getUid();
                                        String money = moneyMarketList.get(kk).getMoney();
                                        moneyMarketList.set(kk, new UidMoneyVo(uid, money));
                                        ll++;
                                    }

                                    ii = jj;
                                }
                                jj--;
                            }
                            ii++;
                        }

                        int l = 0;
                        for (int k = i; k <= j; k++) {
                            Integer uid = moneyMarketList.get(l).getUid();
                            String money = uidMoneyVoList.get(k).getMoney();
                            uidMoneyVoList.set(k, new UidMoneyVo(uid, money));
                            l++;
                        }

                    i = j;
                    }

                    j--;
                }
                i++;
            }

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
                        if(rank.get() == 1){
                            sequence.setIsFinished("待选择");
                        }else {
                            sequence.setIsFinished("排队中");
                        }
                        rank.incrementAndGet();//等效于rank++
                        sequenceMapper.insert(sequence);
                    });
                } else {
                    Sequence sequenceBoss = new Sequence();
                    sequenceBoss.setMarketId(marketId);
                    sequenceBoss.setSequence(1);
                    sequenceBoss.setUid(bossUid);
                    sequenceBoss.setMeetingId(meetingId);
                    sequenceBoss.setIsFinished("待选择");
                    sequenceMapper.insert(sequenceBoss);

                    rank.set(2);//rank1让给上期的市场老大，这次的排序剩下的从第二开始
                    uidMoneyVoList.forEach(uidMoneyVo -> {
                        if(!uidMoneyVo.getUid().equals(bossUid)) {//接下来对非bossUid的uid进行排序
                            Sequence sequence = new Sequence();
                            sequence.setMarketId(marketId);
                            sequence.setSequence(rank.get());
                            sequence.setUid(uidMoneyVo.getUid());
                            sequence.setMeetingId(meetingId);
                            sequence.setIsFinished("排队中");
                            rank.incrementAndGet();//等效于rank++
                            sequenceMapper.insert(sequence);
                        }
                    });
                }

                if (uidMoneyVoList.size() > 1){
                    if (!uidMoneyVoList.get(0).getMoney().equals(uidMoneyVoList.get(1).getMoney())){
                        MarketAfter marketAfter = new MarketAfter(meetingId, marketId, uidMoneyVoList.get(0).getUid());

                        marketAfterMapper.insert(marketAfter);//存放市场老大数据
                        //若排第一的用户有大于等于2位，则无市场老大
                    }
                }

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
    public Result<?> selectOrder(Integer uid, Integer meetingId, Integer marketId, List<Orders> ordersList) {


        if(ordersList.size() > 0) {

            List<Orders> orderVoList = ordersList;
            orderVoList.forEach(orderVo -> {
                UserOrder userOrder = new UserOrder();
                userOrder.setOrderId(orderVo.getOrderId());
                userOrder.setMeetingId(meetingId);
                userOrder.setTime(orderVo.getTime());
                userOrder.setUid(uid);
                userOrderMapper.insert(userOrder);
            });

        }

        Sequence sequence = sequenceMapper.getSequenceByMarketAndUidAndMeeting(marketId, uid, meetingId);
        sequence.setIsFinished("已完成");
        sequenceMapper.updateById(sequence);//对应的用户的市场的选择状态设置为完成

        Integer rankNext = sequence.getSequence() + 1;
        Sequence next = sequenceMapper.selectOne(Wrappers.<Sequence>lambdaQuery().eq(Sequence::getMarketId, marketId).eq(Sequence::getMeetingId, meetingId).eq(Sequence::getSequence, rankNext));
        if (next != null){
            next.setIsFinished("待选择");//使排名下一位的用户开始选择
            sequenceMapper.updateById(next);
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
        Integer marketId = 1;
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 4; j++) {
                SelectStatusVo selectStatusVo = new SelectStatusVo(marketId, productType[j], marketType[i]);
                for (int k = 0; k < marketIds.size(); k++) {
                    if (marketIds.get(k).equals(marketId)){
                        selectStatusVo.setStatus(sequenceMapper.getSelectStatus(marketId, uid, meetingId));
                    }
                }
                selectStatusVos.add(selectStatusVo);
                marketId++;
            }
        }


        return Result.success(selectStatusVos);
    }

    @Override
    public Result<?> getCurrentMarketAdFee(Integer uid, Integer meetingId, Integer marketId) {
        return Result.success(Integer.parseInt(userMarketMapper.getCurrentMarketAdFee(uid,meetingId,marketId)));
    }
}
