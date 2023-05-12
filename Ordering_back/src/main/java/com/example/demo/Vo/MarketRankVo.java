package com.example.demo.Vo;

import lombok.Data;

import java.util.List;

@Data
public class MarketRankVo {
    private Integer marketId;
    private List<UidMoneyVo> uidMoneyVoList;
    //到时候每一场订货会会有一个List<MarketRankVo>,里面存放了每个market中，对这个market投了广告费的uid和广告费
    //结构类似于HashMap<marketId, HashMap<uid, money>>


    public MarketRankVo(Integer marketId, List<UidMoneyVo> uidMoneyVoList) {
        this.marketId = marketId;
        this.uidMoneyVoList = uidMoneyVoList;
    }

    public List<UidMoneyVo> getUidMoneyVoList() {
        return uidMoneyVoList;
    }

    public void setUidMoneyVoList(List<UidMoneyVo> uidMoneyVoList) {
        this.uidMoneyVoList = uidMoneyVoList;
    }

    public Integer getMarketId() {
        return marketId;
    }

    public void setMarketId(Integer marketId) {
        this.marketId = marketId;
    }
}
