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
}
