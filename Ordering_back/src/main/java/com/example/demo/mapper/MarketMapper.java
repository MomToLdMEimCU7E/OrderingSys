package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.Vo.MarketNameVo;
import com.example.demo.entity.Market;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MarketMapper extends BaseMapper<Market> {
    @Select("select * from market where market_open_time like #{year}")
    List<Market> getMarketByYear(String year);

    @Select("select market_id from market where market_open_time like #{year}")
    List<Integer> getMarketIdByYear(String year);

    @Select("select market_location, market_product from market where market_id = #{id}")
    MarketNameVo getMarketName(Integer id);

    @Select("select market_location from market where market_id = #{id}")
    String getLocation(Integer id);
}
