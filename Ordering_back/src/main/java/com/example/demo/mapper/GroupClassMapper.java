package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.GroupClass;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GroupClassMapper extends BaseMapper<GroupClass>{
    @Select("select last_meeting_id from group_class where group_id = #{groupId}")
    Integer getLastMeetingId(Integer groupId);
    @Select("select * from group_class where teacher_uid = #{uid}")
    List<GroupClass> getTeacherGroups(Integer uid);
}
