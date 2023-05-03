package com.example.demo.service;

import com.example.demo.Vo.AdvertiseFeeVo;
import com.example.demo.common.Result;

import java.util.List;

public interface IMarketService {
    Result<?> getMarketByYear(String year); //获取对应年份的市场
    Result<?> saveAdvertiseFee(List<AdvertiseFeeVo> advertiseFeeVoList);//用户投广告费
    Result<?> createMeeting(Integer teacherUid, Integer groupId, String meetingName);
    Result<?> getMeetingList(Integer teacherUid);
    Result<?> stuGetMeetingList(Integer uid);
    Result<?> getMeetingDetail(Integer meetingId);//暂时detail里面只包含该订货会的用户信息
    Result<?> getUserMarket(Integer uid, Integer meetingId);//获取用户投过广告费的市场表格
}
