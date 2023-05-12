package com.example.demo.Vo;

import lombok.Data;

@Data
public class AdvertiseFeeVo {
    private Integer uid;
    private Integer meetingId;
    private Integer marketId;
    private String money;

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
