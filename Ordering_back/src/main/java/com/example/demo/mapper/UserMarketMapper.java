package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.Vo.UidMoneyVo;
import com.example.demo.entity.UserMarket;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMarketMapper extends BaseMapper<UserMarket> {
    @Select("select uid, money from user_market where market_id = #{marketId} and meeting_id = #{meetingId}")
    List<UidMoneyVo> getUidAndMoney(Integer marketId, Integer meetingId);
}
