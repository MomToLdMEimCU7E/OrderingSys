package com.example.demo.service;

import com.example.demo.common.Result;
import com.example.demo.entity.User;

public interface IUserService {
    Result<?> register(String username, Integer groupId);
    Result<?> login(String username, String password);
    Result<?> createGroup(Integer teacherUid, String groupName);
    Result<?> getGroupList(Integer teacherUid);
    Result<?> historyQuery(String year, String market, String username, Integer groupId, String product);
    Result<?> advertiseManege(Integer meetingId);
    //Result<?> ordersManege();
    Result<?> joinClass(Integer uid, Integer groupId);
    Result<?> updateUser(User user);
    Result<?> deleteUser(Integer uid);
    Result<?> getClassDetail(Integer groupId);
    Result<?> getUserSelectStatus(Integer meetingId);
    Result<?> deleteClass(Integer groupId, Integer uid);//传入uid是为了检测该用户是否为教师，groupid是否为他的班级
    Result<?> getUserFee(Integer uid, Integer meetingId);//查看已投放广告费小组的广告费
    Result<?> getBossList(Integer meetingId);
}
