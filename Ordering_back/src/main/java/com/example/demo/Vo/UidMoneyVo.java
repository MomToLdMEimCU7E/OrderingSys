package com.example.demo.Vo;

import lombok.Data;

@Data
public class UidMoneyVo {
    private Integer uid;
    private String money;
    //作用见MarketRankVo
    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }


    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public Integer getIntMoney(){return Integer.parseInt(money);}
}
