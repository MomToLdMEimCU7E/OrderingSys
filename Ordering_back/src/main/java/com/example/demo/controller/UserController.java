package com.example.demo.controller;

import com.example.demo.common.Result;
import com.example.demo.entity.User;
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
    public Result<?> createGroup(@RequestParam Integer teacherUid, @RequestParam String yearOfTerm, @RequestParam String term, @RequestParam String week){
        String groupName = yearOfTerm + "-" + term + "-" + week;
        return Result.success(iUserService.createGroup(teacherUid,groupName));
    }

    @GetMapping("/historyQuery")//历史查询
    @ResponseBody
    public Result<?> historyQuery(@RequestParam(defaultValue = "") String year,
                                  @RequestParam(defaultValue = "") String market,
                                  @RequestParam(defaultValue = "") String username,
                                  @RequestParam Integer groupId,
                                  @RequestParam(defaultValue = "") String product){
        return Result.success(iUserService.historyQuery(year, market, username, groupId, product));
    }

    @GetMapping("/advertiseStatus")//查看投放广告状态
    @ResponseBody
    public Result<?> advertiseStatus(@RequestParam Integer meetingId){
        return Result.success(iUserService.advertiseManege(meetingId));
    }

    @PostMapping("/joinClass")
    @ResponseBody
    public Result<?> joinClass(@RequestParam Integer uid, @RequestParam Integer groupId){
        return Result.success(iUserService.joinClass(uid, groupId));
    }

    @PutMapping("/updateUser")
    @ResponseBody
    public Result<?> updateUser(@RequestBody User user){
        return Result.success(iUserService.updateUser(user));
    }

    @DeleteMapping("/deleteUser")
    @ResponseBody
    public Result<?> deleteUser(@RequestParam Integer uid){
        return Result.success(iUserService.deleteUser(uid));
    }

    @GetMapping("/getClassDetail")
    @ResponseBody
    public Result<?> getClassDetail(@RequestParam Integer groupId){
        return Result.success(iUserService.getClassDetail(groupId));
    }

    @GetMapping("/getUserSelectStatus")
    @ResponseBody
    public Result<?> getUserSelectStatus(@RequestParam Integer meetingId){
        return Result.success(iUserService.getUserSelectStatus(meetingId));
    }
}
