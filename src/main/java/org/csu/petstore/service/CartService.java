package org.csu.petstore.service;

import jakarta.servlet.http.HttpSession;
import org.csu.petstore.entity.CartItem;
import org.csu.petstore.vo.CartItemVO;
import org.csu.petstore.vo.CartVO;
import org.csu.petstore.vo.ItemVO;
import org.springframework.ui.Model;


public interface CartService {
    // 添加购物车项
    void addCartItem(String username, String itemId);

    // 更新购物车项数量
    void updateCartItem(String username, String itemId,int quantity);

    // 删除购物车项
    ItemVO removeCartItem(String username, String itemId);

    // 获取用户购物车
    CartVO getCartByUsername(String username);

    // 清空购物车
    void clearCart(String username);
}