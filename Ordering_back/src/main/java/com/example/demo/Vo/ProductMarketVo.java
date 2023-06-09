package com.example.demo.Vo;

import lombok.Data;

@Data
public class ProductMarketVo {
    private String product;
    private String market;

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

    public Integer getMarketId(){
        Integer marketId = null;

        switch (market){
            case "本地": switch (product){
                case "P1": marketId = 1; break;
                case "P2": marketId = 2; break;
                case "P3": marketId = 3; break;
                case "P4": marketId = 4; break;
            }; break;
            case "区域": switch (product){
                case "P1": marketId = 5; break;
                case "P2": marketId = 6; break;
                case "P3": marketId = 7; break;
                case "P4": marketId = 8; break;
            };break;
            case "国内": switch (product){
                case "P1": marketId = 9; break;
                case "P2": marketId = 10; break;
                case "P3": marketId = 11; break;
                case "P4": marketId = 12; break;
            };break;
            case "亚洲": switch (product){
                case "P1": marketId = 13; break;
                case "P2": marketId = 14; break;
                case "P3": marketId = 15; break;
                case "P4": marketId = 16; break;
            };break;
            case "国际": switch (product){
                case "P1": marketId = 17; break;
                case "P2": marketId = 18; break;
                case "P3": marketId = 19; break;
                case "P4": marketId = 20; break;
            };break;
        }
        return marketId;
    }
}
