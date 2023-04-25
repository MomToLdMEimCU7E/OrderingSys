package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.Meeting;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MeetingMapper extends BaseMapper<Meeting> {
    @Select("select MAX(time) from meeting where group_id = #{groupId}")
    String getGroupMeetingYear(Integer groupId);

    @Select("select group_Id from meeting where meeting_id = #{meetingId}")
    Integer getGroupId(Integer meetingId);

    @Select("select time from meeting where meeting_id = #{meetingId}")
    String getTime(Integer meetingId);

    @Select("select * from meeting where teacher_uid = #{teacherUid}")
    List<Meeting> getMeetingList(Integer teacherUid);

    @Select("select * from meeting where group_id = ( SELECT group_id from user where uid = #{uid})")
    List<Meeting> stuGetMeetingList(Integer uid);
}
