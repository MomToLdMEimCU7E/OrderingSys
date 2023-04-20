package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.Vo.UserInfoVo;
import com.example.demo.entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {
    @Select("select uid, username from user where group_id = #{groupId}")
    List<UserInfoVo> getUserInfo(Integer groupId);
}
