package com.example.demo.service.Impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.demo.Vo.AdvertiseStatusVo;
import com.example.demo.Vo.HistoryOrdersVo;
import com.example.demo.Vo.UserInfoVo;
import com.example.demo.common.Result;
import com.example.demo.entity.*;
import com.example.demo.mapper.*;
import com.example.demo.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;

@Service
public class UserService implements IUserService {
    @Resource
    UserMapper userMapper;
    @Resource
    GroupClassMapper groupClassMapper;
    @Resource
    UserOrderMapper userOrderMapper;
    @Resource
    OrderMapper orderMapper;
    @Resource
    UserMarketMapper userMarketMapper;

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
        return Result.success(res.getRole());
    }

    @Override
    public Result<?> createGroup(Integer teacherUid, String groupName) {
        GroupClass groupClass = new GroupClass(teacherUid, groupName, "0");

        return Result.success(groupClassMapper.insert(groupClass));
    }

    @Override
    public Result<?> getGroupList(Integer teacherUid) {
        return Result.success(groupClassMapper.getTeacherGroups(teacherUid));
    }

    @Override
    public Result<?> historyQuery(String year, String market, String username, Integer groupId) {
        List<UserOrder> userOrderList = new ArrayList<>();
        List<HistoryOrdersVo> historyOrdersVoList = new ArrayList<>();

        if (!StringUtils.isEmpty(username)){
            String sql = "%" + username + "%";
            userOrderList = userOrderMapper.getGroupOrdersByName(groupId, sql);
        }else {
            userOrderList = userOrderMapper.getGroupOrders(groupId);
        }

        for (int i = 0; i < userOrderList.size(); i++) {
            Orders orders = orderMapper.getOrderById(userOrderList.get(i).getOrderId());
            String username11 = userMapper.getUsername(userOrderList.get(i).getUid());
            historyOrdersVoList.add(new HistoryOrdersVo(orders.getOrderId(),orders.getTime(),orders.getProduct(),orders.getMarket(),orders.getAmount(),orders.getPrice(),orders.getTotal(),username11));
        }

        if(!StringUtils.isEmpty(year)){
            for (int i = 0; i < historyOrdersVoList.size(); i++) {
                if (!historyOrdersVoList.get(i).getTime().equals(year)){
                    historyOrdersVoList.remove(i);
                }
            }
        }
        if(!StringUtils.isEmpty(market)){
            for (int i = 0; i < historyOrdersVoList.size(); i++) {
                if (!historyOrdersVoList.get(i).getMarket().equals(market)){
                    historyOrdersVoList.remove(i);
                }
            }
        }

        return Result.success(historyOrdersVoList);
    }

    @Override
    public Result<?> advertiseManege(Integer meetingId) {
        List<UserInfoVo> userInfoVoList = userMapper.getMeetingUser(meetingId);
        List<AdvertiseStatusVo> advertiseStatusVoList = new ArrayList<>();
        for (int i = 0; i < userInfoVoList.size(); i++) {
            String status = "是";
            List<UserMarket> userMarketList = userMarketMapper.getUserMarketByUidAndMeetingId(userInfoVoList.get(i).getUid(), meetingId);
            if (userMarketList == null){
                status = "否";
            }
            advertiseStatusVoList.add(new AdvertiseStatusVo(userInfoVoList.get(i).getUid(), userInfoVoList.get(i).getUsername(), status));
        }
        return Result.success(advertiseStatusVoList);
    }
}

