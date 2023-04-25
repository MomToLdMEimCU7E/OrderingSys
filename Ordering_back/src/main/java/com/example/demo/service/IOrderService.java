package com.example.demo.service;

import com.example.demo.Vo.SelectOrderVo;
import com.example.demo.common.Result;

import java.util.List;


public interface IOrderService {
    Result<?> getAllOrder();
    Result<?> generateSequence(Integer meetingId);
    Result<?> getOrderByYear(String year);
    Result<?> selectOrder(SelectOrderVo selectOrderVo);//还有需要更改的，用户未选择任何订单的时候获取不到uid，更新不了选择状态
    Result<?> getOrderAvailable(Integer meetingId, Integer marketId, Integer uid);//当用户进入市场选择订单后，返回该市场未被选择过的订单
    Result<?> getSelectedOrder(Integer uid, Integer meetingId);//获取用户在订货会上选择过的订单
    Result<?> getSelectStatus(Integer uid, Integer meetingId);//获取该次订货会中该用户的各个市场的选择状态
    //生成顺序带选择 选择完成带选择 选择空
}
