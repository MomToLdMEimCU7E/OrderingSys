package com.example.demo.Vo;

import lombok.Data;

@Data
public class MarketNameVo {
    private String marketLocation;
    private String marketProduct;

    public String getMarketLocation() {
        return marketLocation;
    }

    public void setMarketLocation(String marketLocation) {
        this.marketLocation = marketLocation;
    }

    public String getMarketProduct() {
        return marketProduct;
    }

    public void setMarketProduct(String marketProduct) {
        this.marketProduct = marketProduct;
    }
}
