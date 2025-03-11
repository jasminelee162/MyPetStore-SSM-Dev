package org.csu.petstore.controller;

import org.csu.petstore.vo.AccountVO;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.csu.petstore.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.io.IOException;

@Controller
@Scope("session")
@RequestMapping("/login")
@SessionAttributes(value = {"account", "msg", "msg2", "onlineAccount"}) // 将account、msg、msg2、onlineAccount存储在会话中
public class LoginController {

    @Autowired
    private AccountService accountService; // 注入AccountService来获取账户信息

    @GetMapping
    public String toLogin() {
        // 返回登录页面
        return "login";
    }

    @PostMapping("/signin")
    public String login(String username, String password, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 创建一个AccountVO对象用于保存用户输入的账户信息
        AccountVO account = new AccountVO();
        account.setUsername(username);
        account.setPassword(password);

        // 获取会话中的验证码
        String validateCode = (String) request.getSession().getAttribute("validateCode");
        // 获取用户输入的验证码
        String veryCode = request.getParameter("veryCode");

        // 1. 用户名为空的情况
        if (account.getUsername().equals("")) {
            String msg = "The username cannot be empty!";
            model.addAttribute("msg", msg); // 将错误信息添加到Model中
            response.sendRedirect("../login"); // 重定向回登录页面
            return "login";
        }

        // 2. 获取账户信息，如果账户不存在
        AccountVO loginAccount = accountService.getAccount(username, password);
        if (loginAccount == null) {
            String msg = "Wrong username!";
            model.addAttribute("msg", msg);
            response.sendRedirect("../login");
            return "login";
        }

        // 3. 验证码为空的情况
        if ("".equals(veryCode)) {
            String msg2 = "VeryCode is empty!";
            model.addAttribute("msg2", msg2);
            response.sendRedirect("../login");
            return "login";
        }

        // 4. 验证码错误的情况
        else if (!validateCode.equals(veryCode)) {
            String msg2 = "VeryCode is Wrong!";
            model.addAttribute("msg2", msg2);
            response.sendRedirect("../login");
            return "login";
        }

        // 5. 密码错误的情况
        else if (!loginAccount.getPassword().equals(account.getPassword())) {
            String msg = "Wrong password!";
            model.addAttribute("msg", msg);
            response.sendRedirect("../login");
            return "login";
        }

        // 6. 登录成功
        else {
            // 将登录成功的账户信息添加到会话中，保持用户登录状态
            model.addAttribute("account", loginAccount);
            // 重定向到主页面
            response.sendRedirect("../main");
            return "main";
        }
    }
}
