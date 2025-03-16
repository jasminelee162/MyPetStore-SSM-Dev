package org.csu.petstore.controller;

import org.csu.petstore.entity.Account;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.AccountVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/account")
public class EditAccountController {

    private static final Logger logger = LoggerFactory.getLogger(EditAccountController.class);

    @Autowired
    private AccountService accountService;

    @GetMapping("/editAccount")
    public String editAccountForm(@SessionAttribute("loginAccount") AccountVO loginAccount, Model model) {
        // 填充表单数据
        model.addAttribute("account", loginAccount);
        return "account/editAccount";
    }

    @PostMapping("/editAccount")
    public String submitAccountInfo(@Validated @ModelAttribute("account") AccountVO account,
                                    @RequestParam(value = "password", required = false) String password,
                                    Model model) {

        // 如果密码不为空，更新账户的密码
        if (password != null && !password.isEmpty()) {
            account.setPassword(password);
        }

        try {
            // 更新账户信息
            accountService.updateAccount(account);
            model.addAttribute("msg", "账户信息更新成功");

            // 保存成功后重定向到 catalog/main
            return "account/editAccount";

        } catch (Exception e) {
            // 记录异常信息
            logger.error("更新账户信息失败", e);
            model.addAttribute("error", "更新账户信息失败：" + e.getMessage());
            return "account/editAccount"; // 返回编辑页面
        }
    }
}