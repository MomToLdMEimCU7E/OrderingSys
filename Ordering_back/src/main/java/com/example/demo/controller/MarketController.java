package com.example.demo.controller;

import com.example.demo.Vo.AdvertiseFeeVo;
import com.example.demo.common.Result;
import com.example.demo.service.IMarketService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/market")
public class MarketController {
    @Resource
    IMarketService iMarketService;

    @GetMapping("/getMarketByYear")//获取指定年份的所有市场
    @ResponseBody
    public Result<?> getMarketByYear(@RequestParam String year){
        return Result.success(iMarketService.getMarketByYear(year));
    }

    @PostMapping("/saveAdvertiseFee")//用户投广告费
    @ResponseBody
    public Result<?> saveAdvertiseFee(@RequestBody List<AdvertiseFeeVo> advertiseFeeVoList){
        return Result.success(iMarketService.saveAdvertiseFee(advertiseFeeVoList));
    }

    @PostMapping("/createMeeting")//教师创建一个订货会
    @ResponseBody
    public Result<?> createMeeting(@RequestParam Integer teacherUid, @RequestParam Integer groupId, @RequestParam String meetingName){
        return Result.success(iMarketService.createMeeting(teacherUid, groupId, meetingName));
    }

    @GetMapping("/getMeetingList")//获取订货会的列表
    @ResponseBody
    public Result<?> getMeetingList(@RequestParam Integer teacherUid){
        return Result.success(iMarketService.getMeetingList(teacherUid));
    }

    @GetMapping("/getMeetingDetail")//查看订货会详情
    @ResponseBody
    public Result<?> getMeetingDetail(@RequestParam Integer meetingId){
        return Result.success(iMarketService.getMeetingDetail(meetingId));
    }

    @GetMapping("/getUserMarket")//获取用户投过广告费的市场表格
    @ResponseBody
    public Result<?> getUserMarket(@RequestParam Integer uid, @RequestParam Integer meetingId){
        return Result.success(iMarketService.getUserMarket(uid, meetingId));
    }
}
