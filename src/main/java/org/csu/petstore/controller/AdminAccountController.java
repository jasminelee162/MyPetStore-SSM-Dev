package org.csu.petstore.controller;

import org.csu.petstore.entity.Account;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/adminAccount")
public class AdminAccountController {

    @Autowired
    AccountService accountService;

    @GetMapping("/editAccountFrom")
    public String editAccount(@SessionAttribute("loginAccount") AccountVO accountVO, Model model) {
        model.addAttribute("loginAccount", accountVO); // 确保添加到模型中
        return "adminAccount/adminEdit";
    }

}
