package org.csu.petstore.persistence;

import org.apache.ibatis.annotations.*;
import org.csu.petstore.entity.OrderStatus;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderStatusMapper extends BaseMapper<OrderStatus> {
    // 查询最新的订单状态
    @Select("SELECT * FROM orderstatus WHERE orderid = #{orderId} ORDER BY timestamp DESC LIMIT 1")
    OrderStatus getLatestStatusByOrderId(@Param("orderId") String orderId);

    // 更新订单状态为 'S'
    @Update("UPDATE orderstatus SET status = 'S' WHERE orderid = #{orderId}")
    int updateStatusToShipped(@Param("orderId") String orderId);

    // 更新订单状态为 'P'
    @Update("UPDATE orderstatus SET status = 'P' WHERE orderid = #{orderId}")
    int updateStatusToPending(@Param("orderId") String orderId);

    // 删除订单状态记录
    @Delete("DELETE FROM orderstatus WHERE orderid = #{orderId}")
    int deleteByOrderId(@Param("orderId") String orderId);

    // 更新订单状态为指定状态
    @Update("UPDATE orderstatus SET status = #{status} WHERE orderid = #{orderId}")
    int updateStatus(@Param("orderId") String orderId, @Param("status") String status);
}