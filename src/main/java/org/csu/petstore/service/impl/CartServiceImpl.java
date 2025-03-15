package org.csu.petstore.service.impl;

import jakarta.servlet.http.HttpSession;
import org.csu.petstore.entity.CartItem;
import org.csu.petstore.persistence.CartItemMapper;
import org.csu.petstore.service.CartService;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.LogService;
import org.csu.petstore.vo.CartItemVO;
import org.csu.petstore.vo.CartVO;
import org.csu.petstore.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartItemMapper cartItemMapper;  // 依赖数据库操作接口

    @Autowired
    private CatalogService catalogService;

    @Autowired
    private LogService logService;


    @Override
    public void addCartItem(String username, String itemId) {
        // 检查购物车中是否已有该商品
        CartItem existingCartItem = cartItemMapper.getCartItemByUserAndItem(username, itemId);
        if (existingCartItem != null) {
            // 如果已有该商品，增加数量
            existingCartItem.setQuantity(existingCartItem.getQuantity() + 1);
            cartItemMapper.updateCartItem(username, existingCartItem.getItemId(), existingCartItem.getQuantity());
        } else {
            // 如果没有该商品，插入新商品到购物车
            cartItemMapper.insertCartItem(username,itemId,1);
        }

        //记录日志
        String message = "User" + username + " added " + itemId + " to cart ";
        logService.setLog(message);

    }

    @Override
    public void updateCartItem(String username, String itemId, int quantity) {
        // 更新购物车中的商品
        cartItemMapper.updateCartItem(username, itemId, quantity);
    }

    @Override
    public ItemVO removeCartItem(String username, String itemId, HttpSession session) {
        ItemVO itemVO = catalogService.getItem(itemId, session);
        cartItemMapper.deleteCartItem(username, itemId);

        //记录日志
        String message = "User" + username + " removed " + itemId + " from cart ";
        logService.setLog(message);

        return itemVO;
    }

    @Override
    public CartVO getCartByUsername(String username, HttpSession session) {
        // 获取该用户的购物车商品
        List<CartItem> cartItems = cartItemMapper.getCartItemsByUsername(username);

        // 调用封装的方法，转换为 CartVO
        return convertToCartVO(cartItems, session);
    }

    /**
     * 将购物车数据转换为 CartVO
     */
    private CartVO convertToCartVO(List<CartItem> cartItems, HttpSession session) {
        CartVO cartVO = new CartVO();
        BigDecimal subTotal = BigDecimal.ZERO;

        Map<String, CartItemVO> itemMap = new HashMap<>();
        List<CartItemVO> itemList = new ArrayList<>();

        for (CartItem cartItem : cartItems) {
            CartItemVO cartItemVO = new CartItemVO();
            cartItemVO.setQuantity(cartItem.getQuantity());

            // 获取商品数据
            ItemVO item = catalogService.getItem(cartItem.getItemId(), session);
            cartItemVO.setItem(item);

            // 计算商品总价
            BigDecimal total = item.getListPrice().multiply(BigDecimal.valueOf(cartItem.getQuantity()));
            cartItemVO.setTotalPrice(total);

            // 假设商品有库存
            cartItemVO.setInStock(true);

            // 累计购物车小计
            subTotal = subTotal.add(total);

            // 存入 Map 和 List
            itemMap.put(item.getItemId(), cartItemVO);
            itemList.add(cartItemVO);
        }

        // 设置购物车数据
        cartVO.setItemMap(itemMap);
        cartVO.setItemList(itemList);
        cartVO.setSubTotal(subTotal);

        return cartVO;
    }

    @Override
    public void clearCart(String username) {
        // 清空购物车
        cartItemMapper.clearCart(username);
    }

}