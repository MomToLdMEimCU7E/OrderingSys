package com.example.demo.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.Sequence;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface SequenceMapper extends BaseMapper<Sequence> {
    @Select("select * from sequence where market_id = #{marketId} and uid = #{uid} and meeting_id = #{meetingId}")
    Sequence getSequenceByMarketAndUidAndMeeting(Integer marketId, Integer uid, Integer meetingId);
    @Update("update sequence set is_finished = '已完成' where uid = #{uid} and market_id = #{marketId} and meeting_id = #{meetingId}")
    Integer finishSelect(Integer uid, Integer marketId, Integer meetingId);
    @Update("update sequence set is_finished = '选择中' where uid = #{uid} and market_id = #{marketId} and meeting_id = #{meetingId}")
    Integer startSelect(Integer uid, Integer marketId, Integer meetingId);
    @Select("select is_finished from sequence where market_id = #{marketId} and uid = #{uid} and meeting_id = #{meetingId}")
    String getSelectStatus(Integer marketId, Integer uid, Integer meetingId);
    @Select("select market_id from sequence where uid = #{uid} and meeting_id = #{meetingId} and is_finished = #{key}")
    List<Integer> getKeyStatusMarketId(Integer uid, Integer meetingId, String key);
}
