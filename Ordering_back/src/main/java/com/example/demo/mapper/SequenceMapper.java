package com.example.demo.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.Sequence;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface SequenceMapper extends BaseMapper<Sequence> {
    @Select("select * from sequence where market_id = #{marketId} and uid = #{uid} and meeting_id = #{meetingId}")
    Sequence getSequenceByMarketAndUidAndMeeting(Integer marketId, Integer uid, Integer meetingId);
    @Update("upate sequence set is_finished = '选择中' where uid = #{uid} and marked_id = #{markedId} and meeting_id = #{meetingId}")
    Integer startSelect(Integer uid, Integer markedId, Integer meetingId);
    @Select("select is_finished from sequence where market_id = #{marketId} and uid = #{uid} and meeting_id = #{meetingId}")
    String getSelectStatus(Integer marketId, Integer uid, Integer meetingId);
}
