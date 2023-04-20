package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.Vo.UserInfoVo;
import com.example.demo.entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {
    @Select("select uid, username from user where group_id = #{groupId}")
    List<UserInfoVo> getUserInfo(Integer groupId);

    @Select("select username from user where uid = #{uid}")
    String getUsername(Integer uid);

    @Select("select * from `user` where group_id = (select group_id from meeting where meeting_id = #{meetingId})")
    List<UserInfoVo> getMeetingUser(Integer meetingId);
}
