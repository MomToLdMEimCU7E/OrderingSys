package com.example.demo.Vo;

import lombok.Data;

@Data
public class BossVo {
    private String product;
    private String market;
    private String username;

    public BossVo(String product, String market) {
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
