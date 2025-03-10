package org.csu.petstore.controller;

import org.csu.petstore.entity.Account;
import org.csu.petstore.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@RequestMapping("/account")
@SessionAttributes("loginAccount")
public class AccountController {

    private String captcha;
    private String gotCaptcha;
    private String msg;

    @Autowired
    private AccountService accountService;







    @PostMapping("/signOn")
    public String signOn(String username, String password, Model model) {

        if (!validate()) {
            return "redirect:/login";
        } else {
            Account loginAccount = accountService.getAccount(username, password);
            if (loginAccount == null) {
                this.msg = "用户名或密码错误";
                model.addAttribute("msg", msg);
                return "account/signOnForm";
            } else {
                model.addAttribute("loginAccount", loginAccount);
                model.addAttribute("userName", username);

                /*if (loginAccount.getListOption()) {
                    CatalogService catalogService = new CatalogService();
                    List<Product> myList = catalogService.getProductListByCategory(loginAccount.getFavouriteCategoryId());
                    session.setAttribute("myList", myList);
                }
                //加载用户购物车信息
                CartService cartService = new CartService();
                Cart cart = cartService.getCartByUserId(username);
                if (cart != null) {
                    session.setAttribute("cart", cart);
                }*/

            }

        }
        return "account/signOn";

    }

    @GetMapping("/signOnForm")
    public String signOnForm(Model model) {
        return "account/signOnForm";
    }

    @GetMapping("/registerForm")
    public String registerForm(Model model) {
        return "account/registerForm";
    }

    private boolean validate(){

        return true;
    }



}
