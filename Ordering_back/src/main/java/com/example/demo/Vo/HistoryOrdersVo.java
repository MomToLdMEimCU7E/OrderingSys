package com.example.demo.Vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class HistoryOrdersVo {
    private String orderId;
    private String time;
    private String product;
    private String market;
    private String amount;
    private BigDecimal price;
    private BigDecimal total;
    private String username;//归属公司

    public HistoryOrdersVo(String orderId, String time, String product, String market, String amount, BigDecimal price, BigDecimal total, String username) {
        this.orderId = orderId;
        this.time = time;
        this.product = product;
        this.market = market;
        this.amount = amount;
        this.price = price;
        this.total = total;
        this.username = username;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
