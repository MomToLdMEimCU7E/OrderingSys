package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.UserOrder;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserOrderMapper extends BaseMapper<UserOrder> {
    @Select("select order_id from user_order where meeting_id = #{meetingId}")
    List<String> getOrderIdList(Integer meetingId);

    @Select("select order_id from user_order where uid = #{uid} and meeting_id = #{meetingId}")
    List<String> getOrderIdListByUid(Integer uid, Integer meetingId);

    @Select("SELECT * FROM user_order where uid  in ( SELECT uid FROM user where group_id = #{groupId})")
    List<UserOrder> getGroupOrders(Integer groupId);

    @Select("SELECT * FROM user_order where uid  in ( SELECT uid FROM user where group_id = #{groupId} and username like #{sql})")
    List<UserOrder> getGroupOrdersByName(Integer groupId, String sql);
}
