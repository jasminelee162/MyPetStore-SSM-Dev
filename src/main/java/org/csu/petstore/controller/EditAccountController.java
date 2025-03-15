package org.csu.petstore.controller;

import org.csu.petstore.entity.Account;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/account")
public class EditAccountController {

    @Autowired
    private AccountService accountService;
    AccountVO loginAccount;

    @GetMapping("/editAccount")
    public String editAccountForm(@SessionAttribute("loginAccount") AccountVO loginAccount, Model model) {
        // 填充表单数据
        model.addAttribute("account", loginAccount);
        return "account/editAccount";
    }

    @PostMapping("/submitAccountInfo")
    public String submitAccountInfo(@Validated @ModelAttribute("account") AccountVO account,
                                    @RequestParam("password") String password,
                                    @RequestParam("repeatedPassword") String repeatedPassword,
                                    Model model) {

        // 处理表单提交逻辑
        if (!password.equals(repeatedPassword)) {
            model.addAttribute("error", "密码和确认密码不一致");
            return "account/editAccount";
        }

        try {
            // 判断是否有密码更改，如果有，进行密码更新
            if (!password.isEmpty()) {
                account.setPassword(password);  // 设置新密码
            }

            // 更新账户信息
            accountService.updateAccount(account);
            model.addAttribute("msg", "账户信息更新成功");

        } catch (Exception e) {
            model.addAttribute("error", "更新账户信息失败：" + e.getMessage());
        }

        return "account/editAccount";
    }

}
