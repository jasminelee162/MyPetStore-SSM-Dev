package org.csu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.entity.ItemDTO;
import org.csu.petstore.security.JwtUtil;
import org.csu.petstore.service.CartService;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.CartItemVO;
import org.csu.petstore.vo.CartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

@RestController
@RequestMapping("/cart")
public class RestCartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private CatalogService catalogService;

    @Autowired
    private JwtUtil jwtUtil;

    // 从 request 的 Authorization 中提取用户名
    private String extractUsername(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        if (token == null || !token.startsWith("Bearer ")) {
            return null;
        }
        token = token.substring(7); // 去掉 Bearer 前缀
        return jwtUtil.extractToken(token);
    }

    @GetMapping
    public CommonResponse<CartVO> getCart(HttpServletRequest request) {
        String username = extractUsername(request);
        if (username == null) {
            return CommonResponse.createForError("请先登录后再使用购物车！");
        }

        CartVO cart = cartService.getCartByUsername(username);
        return CommonResponse.createForSuccess(cart);
    }

    @PostMapping("/item/{itemId}")
    public CommonResponse<String> addItemToCart(@PathVariable String itemId,
                                                HttpServletRequest request) {
        String username = extractUsername(request);
        if (username == null) {
            return CommonResponse.createForError("请先登录后再添加商品！");
        }

        try {
            catalogService.getItem(itemId);
        } catch (Exception e) {
            return CommonResponse.createForError("不存在该商品！");
        }

        cartService.addCartItem(username, itemId);
        return CommonResponse.createForSuccess("商品添加成功");
    }

    @PutMapping("/item/{itemId}")
    public CommonResponse<ItemDTO> updateItemQuantity(@PathVariable String itemId,
                                                      @RequestParam int quantity,
                                                      HttpServletRequest request) {
        String username = extractUsername(request);
        if (username == null) {
            return CommonResponse.createForError("请先登录！");
        }

        try {
            catalogService.getItem(itemId);
        } catch (Exception e) {
            return CommonResponse.createForError("不存在该商品！");
        }

        CartVO cart = cartService.getCartByUsername(username);
        CartItemVO cartItemVO = cart.getItemMap().get(itemId);

        if (cartItemVO != null) {
            if (quantity < 1) {
                cartService.removeCartItem(username, itemId);
                cart.getItemMap().remove(itemId);
                cart.getItemList().removeIf(item -> item.getItem().getItemId().equals(itemId));
            } else {
                cartService.updateCartItem(username, itemId, quantity);
                cartItemVO.setQuantity(quantity);
                cartItemVO.setTotalPrice(cartItemVO.getItem().getListPrice().multiply(BigDecimal.valueOf(quantity)));
            }
        } else {
            return CommonResponse.createForError("购物车中无该商品！");
        }

        BigDecimal subTotal = cart.getItemMap().values().stream()
                .map(CartItemVO::getTotalPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        ItemDTO responseDTO = new ItemDTO(
                cartItemVO != null ? cartItemVO.getTotalPrice() : BigDecimal.ZERO,
                subTotal);

        return CommonResponse.createForSuccess(responseDTO);
    }

    @DeleteMapping("/item/{itemId}")
    public CommonResponse<String> removeItem(@PathVariable String itemId,
                                             HttpServletRequest request) {
        String username = extractUsername(request);
        if (username == null) {
            return CommonResponse.createForError("请先登录！");
        }

        try {
            catalogService.getItem(itemId);
        } catch (Exception e) {
            return CommonResponse.createForError("不存在该商品！");
        }

        cartService.removeCartItem(username, itemId);
        return CommonResponse.createForSuccess("商品已删除");
    }

    @DeleteMapping
    public CommonResponse<String> clearCart(HttpServletRequest request) {
        String username = extractUsername(request);
        if (username == null) {
            return CommonResponse.createForError("请先登录！");
        }

        cartService.clearCart(username);
        return CommonResponse.createForSuccess("清空购物车成功！");
    }
}
