package com.example.demo.Vo;

import lombok.Data;

@Data
public class UidMoneyVo {
    private Integer uid;
    private String money;
    //作用见MarketRankVo


    public UidMoneyVo(Integer uid, String money) {
        this.uid = uid;
        this.money = money;
    }

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

    public Double getDoubleMoney(){return Double.parseDouble(money);}
}
