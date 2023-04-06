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

    @GetMapping("/getMarketByYear")
    @ResponseBody
    public Result<?> getMarketByYear(@RequestParam String year){
        return Result.success(iMarketService.getMarketByYear(year));
    }

    @PostMapping("/saveAdvertiseFee")
    @ResponseBody
    public Result<?> saveAdvertiseFee(@RequestBody List<AdvertiseFeeVo> advertiseFeeVoList){
        return Result.success(iMarketService.saveAdvertiseFee(advertiseFeeVoList));
    }

    @PostMapping("/createMeeting")
    @ResponseBody
    public Result<?> createMeeting(@RequestParam Integer teacherUid, @RequestParam Integer groupId, @RequestParam String meetingName){
        return Result.success(iMarketService.createMeeting(teacherUid, groupId, meetingName));
    }

}
