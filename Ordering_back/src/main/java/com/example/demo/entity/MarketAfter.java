package com.example.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class MarketAfter {
    @TableId(type = IdType.AUTO)
    private Integer marketAfterId;

    public MarketAfter(Integer meetingId, Integer marketId, Integer bossUid) {
        this.meetingId = meetingId;
        this.marketId = marketId;
        this.bossUid = bossUid;
    }

    private Integer meetingId;
    private Integer marketId;
    private Integer bossUid;

    public Integer getMarketAfterId() {
        return marketAfterId;
    }

    public void setMarketAfterId(Integer marketAfterId) {
        this.marketAfterId = marketAfterId;
    }

    public Integer getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(Integer meetingId) {
        this.meetingId = meetingId;
    }

    public Integer getMarketId() {
        return marketId;
    }

    public void setMarketId(Integer marketId) {
        this.marketId = marketId;
    }

    public Integer getBossUid() {
        return bossUid;
    }

    public void setBossUid(Integer bossUid) {
        this.bossUid = bossUid;
    }
}
