package com.example.demo.Vo;

import lombok.Data;

@Data
public class AdvertiseStatusVo {
    private Integer uid;
    private String username;
    private String status;

    public AdvertiseStatusVo(Integer uid, String username, String status) {
        this.uid = uid;
        this.username = username;
        this.status = status;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
