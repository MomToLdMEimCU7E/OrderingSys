package com.example.demo.service;

import com.example.demo.Vo.SelectOrderVo;
import com.example.demo.common.Result;

import java.util.List;


public interface IOrderService {
    Result<?> getAllOrder();
    Result<?> generateSequence(Integer meetingId);
    Result<?> getOrderByYear(String year);
    Result<?> selectOrder(List<SelectOrderVo> selectOrderVoList);
    Result<?> getOrderAvailable(Integer meetingId, Integer marketId);//当用户进入市场选择订单后，返回该市场未被选择过的订单
    Result<?> getSelectedOrder(Integer uid, Integer meetingId);//获取用户在订货会上选择过的订单
}
