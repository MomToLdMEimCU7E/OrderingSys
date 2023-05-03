package com.example.demo.service.Impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.demo.Vo.*;
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
    @Resource
    MeetingMapper meetingMapper;
    @Resource
    MarketMapper marketMapper;
    @Resource
    SequenceMapper sequenceMapper;

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
        List<GroupClass> groupList = groupClassMapper.getTeacherGroups(teacherUid);
        List<GroupListVo> groupListVoList = new ArrayList<>();
        for (int i = 0; i < groupList.size(); i++) {
            String[] groupArray = groupList.get(i).getGroupName().split("-");
            GroupListVo groupListVo = new GroupListVo(groupList.get(i).getGroupId(),groupList.get(i).getTeacherUid(),groupArray[0],groupArray[1],groupArray[2],groupList.get(i).getYear(),groupList.get(i).getLastMeetingId());
            groupListVoList.add(groupListVo);
        }

        return Result.success(groupListVoList);
    }

    @Override
    public Result<?> historyQuery(String year, String market, String username, Integer groupId, String product) {
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
        if(!StringUtils.isEmpty(product)){
            for (int i = 0; i < historyOrdersVoList.size(); i++) {
                if (!historyOrdersVoList.get(i).getProduct().equals(product)){
                    historyOrdersVoList.remove(i    );
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

    @Override
    public Result<?> joinClass(Integer uid, Integer groupId) {
        GroupClass groupClass = groupClassMapper.selectOne(Wrappers.<GroupClass>lambdaQuery().eq(GroupClass::getGroupId, groupId));
        if (groupClass.equals(null) || !groupClass.getYear().equals("0")) {
            return Result.error("01", "加入失败");
        } else {
            User user = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUid, uid));
            user.setGroupId(groupId);
            return Result.success();
        }

    }

    @Override
    public Result<?> updateUser(User user) {
        return Result.success(userMapper.updateById(user));
    }

    @Override
    public Result<?> deleteUser(Integer uid) {
        return Result.success(userMapper.deleteById(uid));
    }

    @Override
    public Result<?> getClassDetail(Integer groupId) {
        return Result.success(userMapper.getGroupDetail(groupId));
    }

    @Override
    public Result<?> getUserSelectStatus(Integer meetingId) {
        List<SelectStatusListVo> selectStatusListVoList = new ArrayList<>();

        List<UserInfoVo> userInfoVoList = userMapper.getUserInfo(meetingMapper.getGroupId(meetingId));

        for (int i = 0; i < userInfoVoList.size(); i++) {
            selectStatusListVoList.add(new SelectStatusListVo(userInfoVoList.get(i).getUid(),userInfoVoList.get(i).getUsername(),""));
            // marketNameVo = marketMapper.getMarketName(sequenceMapper.getKeyStatusMarketId(userInfoVoList.get(i).getUid(), meetingId, "选择中"));
            MarketNameVo marketNameVo = marketMapper.getMarketName(sequenceMapper.getKeyStatusMarketId(userInfoVoList.get(i).getUid(), meetingId, "选择中"));
            if (marketNameVo != null){
                selectStatusListVoList.get(i).setMarket(marketNameVo.getMarketLocation() + marketNameVo.getMarketProduct());
            }
        }

        return Result.success(selectStatusListVoList);
    }
}

