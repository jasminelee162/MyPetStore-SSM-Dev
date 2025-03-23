package org.csu.petstore.controller;


import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.AccountVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/adminAccount")
@SessionAttributes("checkAccount")
public class AdminAccountController {

    @Autowired
    AccountService accountService;

    private static final Logger logger = LoggerFactory.getLogger(EditAccountController.class);


    @PostMapping("/editAccountFrom")
    public String editAccountForm(@RequestParam String username,
                                  @RequestParam String password,
                                  Model model) {
        AccountVO accountVO= accountService.getAccount(username, password);
        System.out.println(accountVO);
        model.addAttribute("checkAccount", accountVO); // 确保添加到模型中
        return "adminAccount/adminEdit";
    }

    @PostMapping("/editAccount")
    public String editAccount(@ModelAttribute("account") AccountVO account,
                              @RequestParam(value = "password", required = false) String password,
                              @RequestParam("confirmPassword") String confirmPassword,
                              @SessionAttribute("checkAccount") AccountVO loginAccount,
                              Model model) {

        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "密码和确认密码不一致，请重新输入！");
            return "adminAccount/adminEdit";  // 跳回修改密码页面
        }

        else {
            account.setPassword(password);
        }

        try {

            // 更新 Session 里的 loginAccount
            loginAccount.setPassword(account.getPassword());
            loginAccount.setUsername(account.getUsername());
            loginAccount.setEmail(account.getEmail());
            loginAccount.setPhone(account.getPhone());
            loginAccount.setAddr1(account.getAddr1());
            loginAccount.setAddr2(account.getAddr2());
            loginAccount.setCity(account.getCity());
            loginAccount.setState(account.getState());
            loginAccount.setZip(account.getZip());
            loginAccount.setLangpref(account.getLangpref());
            loginAccount.setCountry(account.getCountry());
            loginAccount.setAdmin(account.isAdmin());
            // 更新数据库
            accountService.updateAccount(account);

            model.addAttribute("msg", "账户信息更新成功");
            return "adminAccount/adminEdit";

        } catch (Exception e) {
            logger.error("更新账户信息失败", e);
            model.addAttribute("error", "更新账户信息失败：" + e.getMessage());
            return "adminAccount/adminEdit";
        }

    }

    // 新增的方法，用于返回所有用户
    @GetMapping("/allAccounts")
    public String getAllAccounts(Model model) {
        try {
            List<AccountVO> accountList = accountService.getAllAccounts();
            model.addAttribute("accountList", accountList);  // 将所有用户的列表添加到模型中
            return "adminAccount/adminShowAccount";  // 这是显示用户列表的页面
        } catch (Exception e) {
            logger.error("获取所有用户信息失败", e);
            model.addAttribute("error", "获取所有用户信息失败：" + e.getMessage());
            return "adminAccount/adminShowAccount";
        }
    }

    @GetMapping(value = "/details", produces = "application/json;charset=UTF-8")
    public ResponseEntity<AccountVO> getUserDetails(@RequestParam String username,
                                                    @RequestParam String password,
                                                    Model model) {
        AccountVO user = accountService.getAccount(username, password);
        return ResponseEntity.ok(user);
    }



}
