package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.Orders;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderMapper extends BaseMapper<Orders> {
    @Select("select * from orders")
    List<Orders> getAll();

    @Select("select * from orders where time = #{year}")
    List<Orders> getOrdersByYear(String year);
}
