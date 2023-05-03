package com.example.demo.Vo;

import lombok.Data;

@Data
public class OrderVo {
    private String orderId;
    private String time;


    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
