package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;
import org.csu.petstore.entity.CartItem;
import org.csu.petstore.entity.Item;
import org.csu.petstore.vo.CartItemVO;
import org.csu.petstore.vo.ItemVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemMapper extends BaseMapper<CartItem> {

    @Select("SELECT * FROM cartitem WHERE username = #{username}")
    List<CartItem> getCartItemsByUsername(String username);

    @Select("SELECT * FROM cartitem WHERE username = #{username} AND itemid = #{itemId}")
    CartItem getCartItemByUserAndItem(@Param("username") String username, @Param("itemId") String itemId);

    @Insert("INSERT INTO cartitem (username, itemid, quantity) VALUES (#{username}, #{itemId}, #{quantity})")
    void insertCartItem(@Param("username") String username, @Param("itemId") String itemId,@Param("quantity") int quantity );

    @Update("UPDATE cartitem SET quantity = #{quantity} WHERE username = #{username} AND itemid = #{itemId}")
    void updateCartItem(@Param("username") String username, @Param("itemId") String itemId,@Param("quantity") int quantity);

    @Delete("DELETE FROM cartitem WHERE username = #{username} AND itemid = #{itemId}")
    void deleteCartItem(@Param("username") String username, @Param("itemId") String itemId);

    @Delete("DELETE FROM cartitem WHERE username = #{username}")
    void clearCart(String username);

    @Select("SELECT * FROM item WHERE itemid = #{itemId}")
    Item getItemById(String itemId);
}
