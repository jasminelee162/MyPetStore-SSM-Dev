package org.csu.petstore.persistence;

import org.apache.ibatis.annotations.*;
import org.csu.petstore.entity.LineItem;
import org.csu.petstore.vo.LineItemVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface LineItemMapper extends BaseMapper<LineItem> {
    // 根据订单编号查询订单明细，返回 List<LineItem>
    @Select("SELECT * FROM lineitem WHERE orderid = #{orderId}")
    List<LineItem> selectListByOrderId(@Param("orderId") Integer orderId);

    // 根据订单编号查询订单明细，返回 List<LineItemVO>
    @Select("SELECT * FROM lineitem WHERE orderid = #{orderId}")
    List<LineItemVO> selectByOrderId(@Param("orderId") String orderId);

    // 更新订单明细数量
    @Update("UPDATE lineitem SET quantity = #{quantity} WHERE orderid = #{orderId} AND itemid = #{itemId}")
    int updateQuantity(@Param("orderId") Integer orderId, @Param("itemId") String itemId, @Param("quantity") Integer quantity);

    // 插入新的订单明细
    @Insert("INSERT INTO lineitem (orderid, linenum, itemid, quantity, unitprice) VALUES (#{orderId}, #{linenum}, #{itemId}, #{quantity}, #{unitprice})")
    int insertLineItem(@Param("orderId") Integer orderId, @Param("linenum") Integer linenum, @Param("itemId") String itemId, @Param("quantity") Integer quantity, @Param("unitprice") BigDecimal unitprice);


}