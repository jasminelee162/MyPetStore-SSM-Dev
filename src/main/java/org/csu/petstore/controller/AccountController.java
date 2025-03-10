package org.csu.petstore.controller;

import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Product;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import java.util.List;

@Controller
@RequestMapping("/account")
@SessionAttributes("loginAccount")
public class AccountController {

    private String msg;

    @Autowired
    private AccountService accountService;

    @Autowired
    private CatalogService catalogService;


    @PostMapping("/signOn")
    public String signOn(@RequestParam("username") String username,
                         @RequestParam("password") String password,
                         @RequestParam("captcha") String gotCaptcha, // 接收前端验证码
                         @SessionAttribute("captcha") String captcha, // 获取 Session 中的验证码
                         Model model) {

        if (!validate(username, password, gotCaptcha, captcha)) {
            // 失败回跳
            model.addAttribute("msg", msg);
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
                    List<Product> myList = catalogService.getProductListByCategory(loginAccount.getFavouriteCategoryId());
                    model.addAttribute("myList", myList);
                }*/
                //加载用户购物车信息
                /*CartService cartService = new CartService();
                Cart cart = cartService.getCartByUserId(username);
                if (cart != null) {
                    model.addAttribute("cart", cart);
                }*/

                return "mainForm"; //返回主页

            }

        }


    }

    @PostMapping("/register")
    public String register(@ModelAttribute Account account, Model model) {
        // 调用服务层的注册方法
        accountService.registerAccount(account);
        return "account/signOnForm";
    }



    @GetMapping("/signOut")
    public String signOut(SessionStatus status, Model model) {
        status.setComplete(); // 标记 Session 完成，清除 @SessionAttributes 管理的属性
        model.addAttribute("myAttribute", null);
        return "mainForm";

    }

    @GetMapping("/signOnForm")
    public String signOnForm(Model model) {
        return "account/signOnForm";
    }

    @GetMapping("/registerForm")
    public String registerForm(Model model) {
        return "account/registerForm";
    }

    private boolean validate(String username, String password, String gotCaptcha, String captcha) {

        if(username == null || username.isEmpty()){
            this.msg = "用户名不能空";
            return false;
        }
        if(password == null || password.isEmpty()){
            this.msg = "密码不能空";
            return false;
        }
        if(gotCaptcha == null || !(gotCaptcha.equalsIgnoreCase(captcha))){
            this.msg = "验证码错误";
            return false;
        }
        return true;
    }

}
