package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.Vo.UidMoneyVo;
import com.example.demo.entity.UserMarket;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMarketMapper extends BaseMapper<UserMarket> {
    @Select("select DISTINCT uid, money from user_market where market_id = #{marketId} and meeting_id = #{meetingId}")
    List<UidMoneyVo> getUidAndMoney(Integer marketId, Integer meetingId);

    @Select("select * from user_market where uid = #{uid} and meeting_id = #{meetingId}")
    List<UserMarket> getUserMarketByUidAndMeetingId(Integer uid, Integer meetingId);

    @Select("select market_id from user_market where uid = #{uid} and meeting_id = #{meetingId}")
    List<Integer> getSelectedMarket(Integer uid, Integer meetingId);

    @Select("select sum(money) from user_market where uid = #{uid} and meeting_id = #{meetingId} and market_id in (select market_id from market where market_location = #{location})")
    String getMarketSum(Integer uid, Integer meetingId, String location);

    @Select("select sum(money) from user_market where uid = #{uid} and meeting_id = #{meetingId}")
    String getYearSum(Integer uid, Integer meetingId);

    @Select("select money from user_market where uid = #{uid} and meeting_id = #{meetingId} and market_id = #{marketId}")
    String getCurrentMarketAdFee(Integer uid, Integer meetingId, Integer marketId);
}
