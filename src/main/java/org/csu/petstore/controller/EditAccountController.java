package org.csu.petstore.controller;



import jakarta.servlet.http.HttpSession;
import org.csu.petstore.MyPetStoreSsmDevApplication;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Product;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
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
    @PostMapping("/edit")
    public String editAccount(@ModelAttribute AccountVO account,
                              @RequestParam String repeatedPassword,
                              HttpSession session,
                              Model model) {
        // 从会话中获取当前登录用户
        AccountVO loginAccount = (AccountVO) session.getAttribute("loginAccount");
        if (loginAccount == null) {
            return "redirect:/login";
        }

        // 获取当前用户信息
        AccountVO currentAccount = accountService.getAccount(loginAccount.getUsername(), loginAccount.getPassword());
        if (currentAccount == null) {
            model.addAttribute("error", "用户信息不存在！");
            return "account/editAccount";
        }

        // 验证表单数据
        if (!validate(account)) {
            model.addAttribute("error", "请完整填写信息！");
            return "account/editAccount";
        }

        // 验证密码
        if (!account.getPassword().isEmpty()) {
            if (!account.getPassword().equals(repeatedPassword)) {
                model.addAttribute("error", "两次输入的密码不一致！");
                return "account/editAccount";
            }
            // 验证旧密码是否正确（假设密码加密处理）
            if (!accountService.validatePassword(loginAccount.getUsername(), account.getPassword())) {
                model.addAttribute("error", "旧密码不正确！");
                return "account/editAccount";
            }
        } else {
            account.setPassword(currentAccount.getPassword()); // 保留原密码
        }

        // 更新用户信息
        try {
            accountService.updateAccount(account);
            // 重新获取更新后的用户信息
            AccountVO updatedAccount = accountService.getAccount(loginAccount.getUsername(), account.getPassword());
            session.setAttribute("loginAccount", updatedAccount);

        } catch (Exception e) {
            model.addAttribute("error", "更新用户信息失败：" + e.getMessage());
            return "account/editAccount";
        }

        return "redirect:/main"; // 更新成功后跳转到主页
    }

    private boolean validate(AccountVO account) {
        return account.getFirstname() != null && !account.getFirstname().isEmpty() &&
                account.getLastname() != null && !account.getLastname().isEmpty() &&
                account.getEmail() != null && !account.getEmail().isEmpty() &&
                account.getPhone() != null && !account.getPhone().isEmpty() &&
                account.getAddr1() != null && !account.getAddr1().isEmpty() &&
                account.getCity() != null && !account.getCity().isEmpty() &&
                account.getState() != null && !account.getState().isEmpty() &&
                account.getZip() != null && !account.getZip().isEmpty() &&
                account.getCountry() != null && !account.getCountry().isEmpty();
    }
}
