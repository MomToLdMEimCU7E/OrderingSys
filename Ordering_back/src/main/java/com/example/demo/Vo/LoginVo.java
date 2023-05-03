package com.example.demo.Vo;

import lombok.Data;

@Data
public class LoginVo {
    private String username;
    private String password;
    private Integer uid;
    private String role;


    public LoginVo(String username, String password, Integer uid, String role) {
        this.username = username;
        this.password = password;
        this.uid = uid;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
