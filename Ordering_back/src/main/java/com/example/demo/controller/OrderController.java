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

    @PostMapping("/generateSequence")
    @ResponseBody
    public Result<?> test(@RequestParam Integer meetingId){
        return Result.success(iOrderService.generateSequence(meetingId));
    }

    @GetMapping("/getAll")
    @ResponseBody
    public Result<?> getAll(){
        return Result.success(iOrderService.getAllOrder());
    }

    @GetMapping("/getOrdersByYear")
    @ResponseBody
    public Result<?> getOrdersByYear(@RequestParam String year){
        return Result.success(iOrderService.getOrderByYear(year));
    }

    @PostMapping("/selectOrder")
    @ResponseBody
    public Result<?> selectOrder(@RequestBody List<SelectOrderVo> selectOrderVoList){

        return Result.success(iOrderService.selectOrder(selectOrderVoList));
    }
}
