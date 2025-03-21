package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.csu.petstore.entity.Order;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderMapper extends BaseMapper<Order> {
    @Delete("DELETE FROM orders WHERE orderid = #{orderId}")
    int deleteOrder(@Param("orderId") String orderId);
    @Select("SELECT * FROM orders WHERE orderid = #{orderId}")
    Order selectById(@Param("orderId") String orderId);
}
