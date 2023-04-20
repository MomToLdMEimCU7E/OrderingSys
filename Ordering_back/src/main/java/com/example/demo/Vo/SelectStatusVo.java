package com.example.demo.Vo;

import lombok.Data;

@Data
public class SelectStatusVo {
    private Integer marketId;
    private String status;

    public SelectStatusVo(Integer marketId, String status) {
        this.marketId = marketId;
        this.status = status;
    }

    public Integer getMarketId() {
        return marketId;
    }

    public void setMarketId(Integer marketId) {
        this.marketId = marketId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
