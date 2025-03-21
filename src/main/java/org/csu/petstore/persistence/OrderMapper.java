package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.csu.petstore.entity.LineItem;
import org.csu.petstore.entity.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper extends BaseMapper<Order> {
    @Delete("DELETE FROM orders WHERE orderid = #{orderId}")
    int deleteOrder(@Param("orderId") String orderId);
    @Select("SELECT * FROM orders WHERE orderid = #{orderId}")
    Order selectById(@Param("orderId") Integer orderId);
    // 根据订单编号查询所有订单明细
    @Select("SELECT * FROM lineitem WHERE orderid = #{orderId}")
    List<LineItem> selectLineItemsByOrderId(@Param("orderId") String orderId);

    // 更新订单基本信息
    @Update("UPDATE orders SET userid = #{userId}, totalprice = #{totalPrice}, status = #{status} WHERE orderid = #{orderId}")
    int updateOrderInfo(@Param("orderId") String orderId, @Param("userId") String userId, @Param("totalPrice") String totalPrice, @Param("status") String status);

    // 更新订单明细数量
    @Update("UPDATE lineitem SET quantity = #{quantity} WHERE orderid = #{orderId} AND itemid = #{itemId}")
    int updateLineItemQuantity(@Param("orderId") String orderId, @Param("itemId") String itemId, @Param("quantity") int quantity);
}
