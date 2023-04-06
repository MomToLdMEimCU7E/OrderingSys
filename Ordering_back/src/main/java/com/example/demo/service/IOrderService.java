package com.example.demo.service;

import com.example.demo.Vo.SelectOrderVo;
import com.example.demo.common.Result;

import java.util.List;


public interface IOrderService {
    Result<?> getAllOrder();
    Result<?> generateSequence(Integer meetingId);
    Result<?> getOrderByYear(String year);
    Result<?> selectOrder(List<SelectOrderVo> selectOrderVoList);
}
