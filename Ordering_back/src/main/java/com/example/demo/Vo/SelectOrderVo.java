package com.example.demo.Vo;

import com.example.demo.entity.Orders;
import lombok.Data;

import java.util.List;

@Data
public class SelectOrderVo {
    private Integer uid;
    private Integer meetingId;
    private Integer marketId;
    private List<Orders> ordersList;

    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    public Integer getMarketId() {
        return marketId;
    }

    public void setMarketId(Integer marketId) {
        this.marketId = marketId;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }





    public Integer getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(Integer meetingId) {
        this.meetingId = meetingId;
    }
}
