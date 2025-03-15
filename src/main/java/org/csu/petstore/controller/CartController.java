package org.csu.petstore.controller;

import com.alibaba.fastjson.JSON;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.CartItem;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemDTO;
import org.csu.petstore.service.CartService;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CartItemVO;
import org.csu.petstore.vo.CartVO;
import org.csu.petstore.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;


@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping("viewCart")
    public String viewCart(HttpSession session,Model model) {
        // 检查 session 是否有账户信息
        AccountVO account = (AccountVO) session.getAttribute("loginAccount");
        String username = null;
        if (account == null) {
            model.addAttribute("msg", "请先登录后再使用购物车！");
            return "/account/signOnForm";
        } else {
            username = account.getUsername();
        }

        // 获取购物车信息
        CartVO cart = cartService.getCartByUsername(username);
        if (cart == null) {
            cart = new CartVO(); // 创建一个新的购物车对象
            session.setAttribute("cart", cart);
        }

        session.setAttribute("cart", cart);

        return "cart/cart";
    }

    @GetMapping("/addItemToCart")
    public String addItemToCart(@RequestParam("workingItemId") String itemId, HttpSession session, Model model) {
        //从 session 中获取登录用户的 username
        AccountVO account = (AccountVO) session.getAttribute("loginAccount");
        if (account == null) {
            model.addAttribute("msg", "请先登录后再使用购物车！");
            return "/account/signOnForm";
        }
        String username = account.getUsername();
        //调用 CartService 的方法将商品添加到购物车
        cartService.addCartItem(username, itemId);

        //获取购物车
        CartVO cart = cartService.getCartByUsername(username);
        if (cart != null) {
            session.setAttribute("cart", cart);  //更新 session 中的购物车
        }

        // 跳转回购物车页面
        return "redirect:/cart/viewCart";
    }

    @PostMapping("/updateCart")
    @ResponseBody
    public void updateCart(@RequestParam("itemId") String itemId,
                           @RequestParam("quantity") int quantity,
                           HttpSession session,
                           HttpServletResponse response) throws IOException {

        // 获取用户信息
        AccountVO account = (AccountVO) session.getAttribute("loginAccount");
        String username = (account != null) ? account.getUsername() : null;

        // 获取购物车信息（不重新查询）
        CartVO cart = (CartVO) session.getAttribute("cart");

        // 获取购物车中对应的 CartItemVO
        CartItemVO cartItemVO = cart.getItemMap().get(itemId);

        if (cartItemVO != null) {
            if (quantity < 1) {
                // 如果数量小于 1，则从购物车中移除该商品
                cartService.removeCartItem(username, itemId);

                // **手动移除 itemMap 里的 itemId，防止空指针异常**
                cart.getItemMap().remove(itemId);
            } else {
                // 更新商品数量
                cartService.updateCartItem(username, itemId, quantity);

                // **手动更新 cartItemVO 的数量和总价**
                cartItemVO.setQuantity(quantity);
                BigDecimal newTotalPrice = cartItemVO.getItem().getListPrice().multiply(BigDecimal.valueOf(quantity));
                cartItemVO.setTotalPrice(newTotalPrice);
            }
        }

        // **手动计算 subTotal**
        BigDecimal subTotal = BigDecimal.ZERO;
        for (CartItemVO item : cart.getItemMap().values()) {
            subTotal = subTotal.add(item.getTotalPrice());
        }

        // **避免 NullPointerException**
        BigDecimal totalPrice = cart.getItemMap().containsKey(itemId) ? cart.getItemMap().get(itemId).getTotalPrice() : BigDecimal.ZERO;

        System.out.println("totalPrice: " + totalPrice);
        System.out.println("subTotal: " + subTotal);

        // 更新 session 中的购物车数据
        session.setAttribute("cart", cart);

        // 封装 JSON 数据
        ItemDTO responseDTO = new ItemDTO(totalPrice, subTotal);
        String jsonResult = JSON.toJSONString(responseDTO);
        System.out.println(jsonResult);

        // 设定响应格式并返回 JSON 数据
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        out.println(jsonResult);
    }


    @PostMapping("/removeCartItem")
    public String removeCartItem(@RequestParam String itemId, HttpSession session) {
        CartVO cart = (CartVO) session.getAttribute("cart");
        if (cart != null) {
            cartService.removeCartItem(cart.getUsername(), itemId);
            session.setAttribute("cart", cart);  // 更新 session 中的购物车
        }
        return "redirect:/cart/viewCart";
    }

    @PostMapping("/clearCart")
    public String clearCart(HttpSession session) {
        CartVO cart = (CartVO) session.getAttribute("cart");
        if (cart != null) {
            cartService.clearCart(cart.getUsername());
            session.setAttribute("cart", cart);  // 更新 session 中的购物车
        }
        return "redirect:/cart/viewCart";
    }
}
