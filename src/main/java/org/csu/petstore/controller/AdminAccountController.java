package org.csu.petstore.controller;


import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.AccountVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/adminAccount")
@SessionAttributes("loginAccount")
public class AdminAccountController {

    @Autowired
    AccountService accountService;

    private static final Logger logger = LoggerFactory.getLogger(EditAccountController.class);


    @GetMapping("/editAccountFrom")
    public String editAccountForm(@SessionAttribute("loginAccount") AccountVO accountVO, Model model) {
        model.addAttribute("loginAccount", accountVO); // 确保添加到模型中
        return "adminAccount/adminEdit";
    }

    @PostMapping("/editAccount")
    public String editAccount(@ModelAttribute("loginAccount") AccountVO account,
                              @RequestParam(value = "password", required = false) String password,
                              @RequestParam("confirmPassword") String confirmPassword,
                              @SessionAttribute("loginAccount") AccountVO loginAccount,
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
            // 更新数据库
            accountService.updateAccount(account);

            model.addAttribute("msg", "账户信息更新成功");
            return "adminAccount/adminEdit";

        } catch (Exception e) {
            System.out.println("6666");
            logger.error("更新账户信息失败", e);
            model.addAttribute("error", "更新账户信息失败：" + e.getMessage());
            return "adminAccount/adminEdit";
        }

    }

}
