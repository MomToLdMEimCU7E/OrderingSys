package com.example.demo.Vo;

import lombok.Data;

@Data
public class SelectStatusVo {
    private Integer marketId;
    private String product;
    private String market;
    private String status;

    public SelectStatusVo(Integer marketId, String product, String market) {
        this.marketId = marketId;
        this.product = product;
        this.market = market;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getMarket() {
        return market;
    }

    public void setMarket(String market) {
        this.market = market;
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
