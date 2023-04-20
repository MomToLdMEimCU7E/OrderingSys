package com.example.demo.controller;

import com.example.demo.common.Result;
import com.example.demo.service.IUserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    IUserService iUserService;

    @PostMapping("/register")
    @ResponseBody
    public Result<?> register(@RequestParam String username, @RequestParam String password, @RequestParam Integer groupId){
        return Result.success(iUserService.register(username, password, groupId));
    }

    @PostMapping("/login")
    @ResponseBody
    public Result<?> login(@RequestParam String username, @RequestParam String password){
        return Result.success(iUserService.login(username, password));
    }

    @GetMapping("/getTeacherGroups")//获取教师管理的各个行政班
    @ResponseBody
    public Result<?> getTeacherGroups(@RequestParam Integer teacherUid){
        return Result.success(iUserService.getGroupList(teacherUid));
    }

    @PostMapping("/createGroup")
    @ResponseBody
    public Result<?> createGroup(@RequestParam Integer teacherUid, @RequestParam String groupName){
        return Result.success(iUserService.createGroup(teacherUid,groupName));
    }

    @GetMapping("/historyQuery")
    @ResponseBody
    public Result<?> historyQuery(@RequestParam String year, String market, String username, Integer groupId){
        return Result.success(iUserService.historyQuery(year, market, username, groupId));
    }

    @GetMapping("/advertiseStatus")
    @ResponseBody
    public Result<?> advertiseStatus(@RequestParam Integer meetingId){
        return Result.success(iUserService.advertiseManege(meetingId));
    }
}
