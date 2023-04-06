package com.example.demo.service;

import com.example.demo.Vo.AdvertiseFeeVo;
import com.example.demo.common.Result;

import java.util.List;

public interface IMarketService {
    Result<?> getMarketByYear(String year); //获取对应年份的市场
    Result<?> saveAdvertiseFee(List<AdvertiseFeeVo> advertiseFeeVoList);
    Result<?> createMeeting(Integer teacherUid, Integer groupId, String meetingName);

}
