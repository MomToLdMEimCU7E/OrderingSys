package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.Vo.ProductMarketVo;
import com.example.demo.entity.Orders;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderMapper extends BaseMapper<Orders> {
    @Select("select * from orders")
    List<Orders> getAll();

    @Select("select * from orders where time = #{year}")
    List<Orders> getOrdersByYear(String year);

    @Select("select product, market from orders where order_id =#{orderId}")
    List<ProductMarketVo> getMarketByOrderId(Integer orderId);

    @Select("select * from orders where time = #{year} and product = #{product} and market = #{market}")
    List<Orders> getOrdersByAvailable(String year, String product, String market);

    @Select("select * from orders where order_id = #{orderId}")
    Orders getOrderById(Integer orderId);
}
