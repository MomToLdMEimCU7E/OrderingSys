package com.example.demo.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.Sequence;
import org.apache.ibatis.annotations.Select;

public interface SequenceMapper extends BaseMapper<Sequence> {
    @Select("select * from sequence where market_id = #{marketId} and uid = #{uid} and meeting_id = #{meetingId}")
    Sequence getSequenceByMarketAndUidAndMeeting(Integer marketId, Integer uid, Integer meetingId);
}
