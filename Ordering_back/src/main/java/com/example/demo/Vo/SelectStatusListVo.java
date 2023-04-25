package com.example.demo.Vo;

import lombok.Data;

import java.util.List;

@Data
public class SelectStatusListVo {
    private Integer uid;
    private String username;
    private String market;

    public SelectStatusListVo(Integer uid, String username, String market) {
        this.uid = uid;
        this.username = username;
        this.market = market;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMarket() {
        return market;
    }

    public void setMarket(String market) {
        this.market = market;
    }
}
