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
                                    Model model,
                                    @SessionAttribute("loginAccount") AccountVO loginAccount) {

        if (password != null && !password.isEmpty()) {
            account.setPassword(password);
        }

        try {
            // 更新数据库
            accountService.updateAccount(account);

            // 更新 Session 里的 loginAccount
            loginAccount.setUsername(account.getUsername());
            loginAccount.setFirstname(account.getFirstname());
            loginAccount.setLastname(account.getLastname());
            loginAccount.setEmail(account.getEmail());
            loginAccount.setPhone(account.getPhone());

            loginAccount.setAddr1(account.getAddr1());
            loginAccount.setAddr2(account.getAddr2());
            loginAccount.setCity(account.getCity());
            loginAccount.setState(account.getState());
            loginAccount.setZip(account.getZip());
            loginAccount.setCountry(account.getCountry());
            loginAccount.setBannerName(account.getBannerName());
            loginAccount.setFavcategory(account.getFavcategory());
            loginAccount.setMylistopt(account.isMylistopt());
            loginAccount.setBanneropt(account.isBanneropt());
            if (password != null && !password.isEmpty()) {
                loginAccount.setPassword(password);
            }

            model.addAttribute("msg", "账户信息更新成功");
            return "account/editAccount";

        } catch (Exception e) {
            logger.error("更新账户信息失败", e);
            model.addAttribute("error", "更新账户信息失败：" + e.getMessage());
            return "account/editAccount";
        }
    }

}