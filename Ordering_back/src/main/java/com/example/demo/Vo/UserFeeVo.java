package com.example.demo.Vo;

import lombok.Data;

@Data
public class UserFeeVo {
    private String market;
    private String money;

    public UserFeeVo(String market, String money) {
        this.market = market;
        this.money = money;
    }

    public String getMarket() {
        return market;
    }

    public void setMarket(String market) {
        this.market = market;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }
}
