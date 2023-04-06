package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.MarketAfter;
import org.apache.ibatis.annotations.Select;

public interface MarketAfterMapper extends BaseMapper<MarketAfter> {
    @Select("select boss_uid from market_after where meeting_id = #{meetingId} and market_id = #{marketId}")
    Integer getBossUid(Integer meetingId, Integer marketId);
}
