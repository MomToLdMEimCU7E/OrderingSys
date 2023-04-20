package com.example.demo.service;

import com.example.demo.common.Result;

public interface IUserService {
    Result<?> register(String username, String password, Integer groupId);
    Result<?> login(String username, String password);
    Result<?> createGroup(Integer teacherUid, String groupName);
    Result<?> getGroupList(Integer teacherUid);
    Result<?> historyQuery(String year, String market, String username, Integer groupId);
    Result<?> advertiseManege(Integer meetingId);
    //Result<?> ordersManege();
}
