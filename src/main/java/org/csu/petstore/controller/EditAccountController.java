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
    public String editAccount(@ModelAttribute Account account,
                              @RequestParam String repeatedPassword,
                              HttpSession session,
                              Model model) {

        // 获取当前用户信息
        Account loginAccount = (Account) session.getAttribute("loginAccount");
        if (loginAccount == null) {
            return "redirect:/login";
        }
        account.setUsername(loginAccount.getUsername());

        // 校验字段
        if (!validate(account)) {
            model.addAttribute("error", "请完整填写信息！");
            return EDIT_ACCOUNT_FORM;
        }

        // 校验密码一致性
        if (!account.getPassword().isEmpty() && !account.getPassword().equals(repeatedPassword)) {
            model.addAttribute("error", "两次输入的密码不一致！");
            return EDIT_ACCOUNT_FORM;
        }

        // 更新账户信息
        accountService.updateAccount(account);

        // 重新获取用户信息，存入 session
        AccountVO updatedAccount = accountService.getAccount(loginAccount.getUsername(), loginAccount.getPassword());
        session.setAttribute("loginAccount", updatedAccount);

        // 更新用户喜欢的商品列表
        List<Product> myList = (List<Product>) catalogService.getProduct(account.getUncategorizable());
        session.setAttribute("myList", myList);

        return "redirect:/main";
    }

    private boolean validate(Account account) {
        return account.getFirstname() != null && !account.getFirstname().isEmpty() &&
                account.getLastname() != null && !account.getLastname().isEmpty() &&
                account.getEmail() != null && !account.getEmail().isEmpty() &&
                account.getPhone() != null && !account.getPhone().isEmpty() &&
                account.getAddr1() != null && !account.getAddr1().isEmpty() &&
                account.getCity() != null && !account.getCity().isEmpty() &&
                account.getState() != null && !account.getState().isEmpty() &&
                account.getZip() != null && !account.getZip().isEmpty() &&
                account.getCountry() != null && !account.getCountry().isEmpty() &&
                account.getUncategorizable() != null && !account.getUncategorizable().isEmpty();
    }
}
