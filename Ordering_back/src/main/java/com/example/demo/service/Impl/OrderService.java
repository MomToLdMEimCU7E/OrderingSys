package com.example.demo.service.Impl;

import com.example.demo.Vo.MarketRankVo;
import com.example.demo.Vo.SelectOrderVo;
import com.example.demo.Vo.UidMoneyVo;
import com.example.demo.common.Result;
import com.example.demo.entity.GroupClass;
import com.example.demo.entity.MarketAfter;
import com.example.demo.entity.Sequence;
import com.example.demo.entity.UserOrder;
import com.example.demo.mapper.*;
import com.example.demo.service.IOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

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

        List<Integer> marketIdList = marketMapper.getMarketIdByYear("%" + meetingMapper.getTime(meetingId).toString() + "%");
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
        selectOrderVoList.forEach(selectOrderVo -> {
            UserOrder userOrder = new UserOrder();
            userOrder.setOrderId(selectOrderVo.getOrderId());
            userOrder.setMeetingId(selectOrderVo.getMeetingId());
            userOrder.setTime(selectOrderVo.getTime());
            userOrder.setUid(selectOrderVo.getUid());
            userOrderMapper.insert(userOrder);
        });

        

        return Result.success();
    }
}
