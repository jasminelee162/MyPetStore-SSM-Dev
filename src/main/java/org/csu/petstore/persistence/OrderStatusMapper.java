package org.csu.petstore.persistence;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.csu.petstore.entity.OrderStatus;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderStatusMapper extends BaseMapper<OrderStatus> {
    @Select("SELECT * FROM orderstatus WHERE orderid = #{orderId} ORDER BY timestamp DESC LIMIT 1")
    OrderStatus getLatestStatusByOrderId(String orderId);
    @Update("UPDATE orderstatus SET status = 'S' WHERE orderid = #{orderId}")
    int updateStatusToShipped(@Param("orderId") String orderId);
    @Delete("DELETE FROM orderstatus WHERE orderid = #{orderId}")
    int deleteByOrderId(@Param("orderId") String orderId);
}