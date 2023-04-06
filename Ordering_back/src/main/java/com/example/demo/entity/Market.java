package com.example.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class Market {
    @TableId(type = IdType.AUTO)
    private Integer marketId;
    private String marketProduct;
    private String marketLocation;
    private String marketOpenTime;

    public Integer getMarketId() {
        return marketId;
    }

    public void setMarketId(Integer marketId) {
        this.marketId = marketId;
    }

    public String getMarketProduct() {
        return marketProduct;
    }

    public void setMarketProduct(String marketProduct) {
        this.marketProduct = marketProduct;
    }

    public String getMarketLocation() {
        return marketLocation;
    }

    public void setMarketLocation(String marketLocation) {
        this.marketLocation = marketLocation;
    }

    public String getMarketOpenTime() {
        return marketOpenTime;
    }

    public void setMarketOpenTime(String marketOpenTime) {
        this.marketOpenTime = marketOpenTime;
    }
}
