package com.example.demo.Vo;

import lombok.Data;

@Data
public class BossAndMarketVo {
    private Integer bossUid;
    private Integer marketId;

    public Integer getBossUid() {
        return bossUid;
    }

    public void setBossUid(Integer bossUid) {
        this.bossUid = bossUid;
    }

    public Integer getMarketId() {
        return marketId;
    }

    public void setMarketId(Integer marketId) {
        this.marketId = marketId;
    }
}
