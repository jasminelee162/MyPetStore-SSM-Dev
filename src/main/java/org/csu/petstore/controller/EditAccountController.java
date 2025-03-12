package org.csu.petstore.controller;



import jakarta.servlet.http.HttpSession;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Product;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.List;

import static org.apache.catalina.startup.ExpandWar.validate;

@Controller
@RequestMapping("/account")
public class EditAccountController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private CatalogService catalogService;

    private static final String EDIT_ACCOUNT_FORM = "account/editAccount";

    @GetMapping("/edit")
    public String showEditForm(HttpSession session, Model model) {
        Account loginAccount = (Account) session.getAttribute("loginAccount");
        if (loginAccount == null) {
            return "redirect:/login";  // 若未登录，跳转到登录页面
        }
        model.addAttribute("account", loginAccount);
        return EDIT_ACCOUNT_FORM;
    }






}
