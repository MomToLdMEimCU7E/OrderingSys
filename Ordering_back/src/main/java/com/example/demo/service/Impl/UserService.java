package com.example.demo.service.Impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.demo.common.Result;
import com.example.demo.entity.User;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserService implements IUserService {
    @Resource
    UserMapper userMapper;

    @Override
    public Result<?> register(String username, String password, Integer groupId) {
        User user = new User();
        if(userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUsername, username)) != null){
            return Result.error("01","用户已存在");
        } else {
            user.setUsername(username);
            user.setPassword(password);
            user.setGroupId(groupId);
            user.setRole("学生");

            userMapper.insert(user);
            return Result.success();
        }
    }

    @Override
    public Result<?> login(String username, String password) {
        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUsername, username).eq(User::getPassword, password));
        if (res == null){
            return Result.error("02", "用户名或密码错误");
        }
        return Result.success();
    }

    @Override
    public Result<?> createGroup(Integer teacherUid, String groupName) {
        return null;
    }

    @Override
    public Result<?> getGroupList(Integer teacherUid) {
        return null;
    }
}

