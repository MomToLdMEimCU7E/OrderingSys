package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.Meeting;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

    @Select("select * from meeting where group_id = #{groupId}")
    List<Meeting> getMeetingListByGroup(Integer groupId);

    @Select("select * from meeting where group_id = ( SELECT group_id from user where uid = #{uid})")
    List<Meeting> stuGetMeetingList(Integer uid);

    @Update("update meeting set status = '投放广告中' where meeting_id = #{id}")
    Integer startMeeting(Integer id);

    @Update("update meeting set status = '选单中' where meeting_id = #{id}")
    Integer startOrder(Integer id);

    @Update("update meeting set status = '已结束' where meeting_id = #{id}")
    Integer finishMeeting(Integer id);

    @Select("select status from meeting where meeting_id = #{id}")
    String getStatus(Integer id);
}
