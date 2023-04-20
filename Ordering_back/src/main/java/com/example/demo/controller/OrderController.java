package com.example.demo.controller;

import com.example.demo.Vo.SelectOrderVo;
import com.example.demo.common.Result;
import com.example.demo.mapper.MarketMapper;
import com.example.demo.service.IOrderService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Resource
    IOrderService iOrderService;
    @Resource
    MarketMapper marketMapper;

    @PostMapping("/generateSequence")//生成选择队列 用于所有用户都填写完广告费之后使用，生成一个用户的选择队列
    @ResponseBody
    public Result<?> test(@RequestParam Integer meetingId){
        return Result.success(iOrderService.generateSequence(meetingId));
    }

    @GetMapping("/getAll")//获取所有订单 好像用不着
    @ResponseBody
    public Result<?> getAll(){
        return Result.success(iOrderService.getAllOrder());
    }

    @GetMapping("/getOrdersByYear")//根据年份获取该年开放的所有订单
    @ResponseBody
    public Result<?> getOrdersByYear(@RequestParam String year){
        return Result.success(iOrderService.getOrderByYear(year));
    }

    @PostMapping("/selectOrder")//用户选择订单，传的参数是一个选择的list
    @ResponseBody
    public Result<?> selectOrder(@RequestBody List<SelectOrderVo> selectOrderVoList){

        return Result.success(iOrderService.selectOrder(selectOrderVoList));
    }

    @GetMapping("/getOrderAvailable")//获取该次订货会上指定市场的还剩余的订单
    @ResponseBody
    public Result<?> getOrderAvailable(@RequestParam Integer meetingId, @RequestParam Integer marketId){
        return Result.success(iOrderService.getOrderAvailable(meetingId, marketId));
    }

    @GetMapping("/getSelectedOrders")//查看用户该次订货会上选择过的所有订单
    @ResponseBody
    public Result<?> getSelectedOrders(@RequestParam Integer uid, @RequestParam Integer meetingId){
        return Result.success(iOrderService.getSelectedOrder(uid, meetingId));
    }
}
