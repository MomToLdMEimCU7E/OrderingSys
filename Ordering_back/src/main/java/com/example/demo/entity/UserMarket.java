package com.example.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class UserMarket {
    @TableId(type = IdType.AUTO)
    private Integer userMarketId;
    private Integer uid;
    private Integer marketId;
    private Integer meetingId;
    private String money;

    public Integer getUserMarketId() {
        return userMarketId;
    }

    public void setUserMarketId(Integer userMarketId) {
        this.userMarketId = userMarketId;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getMarketId() {
        return marketId;
    }

    public void setMarketId(Integer marketId) {
        this.marketId = marketId;
    }

    public Integer getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(Integer meetingId) {
        this.meetingId = meetingId;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }
}
