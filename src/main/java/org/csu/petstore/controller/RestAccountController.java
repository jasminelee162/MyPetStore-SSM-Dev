package org.csu.petstore.controller;


import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.csu.petstore.security.JwtUtil;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.LogService;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CategoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.awt.*;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

@RestController
public class RestAccountController {

    private String msg;
    private String captcha;
    private final String successString = "sign in successfully, send to ";

    @Autowired
    private AccountService accountService;

    @Autowired
    private LogService logService;

    @Autowired
    private CatalogService catalogService;

    @Autowired
    private JwtUtil jwtUtil;

    @PostMapping("/accounts")
    public ResponseEntity<?> register(@RequestBody AccountVO accountVO) {

        try{
        accountService.registerAccount(accountVO);
        msg = "Account registered successfully, send to sign on";
        }
        catch (Exception e) {
            msg = "Account registration failed, parameter form is invalid";
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("message", msg));
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(Map.of("message", msg));

    }

    @PostMapping("/tokens")
    public ResponseEntity<?> login(@RequestParam String username,
                                   @RequestParam String password,
                                   @RequestParam("captcha") String gotCaptcha, // 接收前端验证码
                                   @RequestParam(value = "admin", required = false) boolean admin) {
        System.out.println(username);

        if(!validate(username, password, gotCaptcha, captcha)){
            msg = "Invalid username or password, reload sign on form and try again";
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("message", msg));
        }else {
            AccountVO loginAccount = accountService.getAccount(username, password);

            if (loginAccount == null) {
                this.msg = "incorrect username or password, reload sign on form and try again";
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", msg));
            } else {

                String jwtToken = jwtUtil.generateToken(username);
                this.msg = successString + "main form and put loginAccount in session";

                String message = "User " + username + " login success!";
                logService.setLog(message);
                if(admin && loginAccount.isAdmin()){this.msg = successString + "admin form and put loginAccount in session";}

                List<CategoryVO> categories = catalogService.getAllCategories();
                return ResponseEntity.status(HttpStatus.OK).header(HttpHeaders.AUTHORIZATION, "Bearer " + jwtToken)
                        .body(Map.of("message", msg, "loginAccount", loginAccount, "categories", categories));
            }

        }


    }

    private String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder randomString = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            randomString.append(characters.charAt(index));
        }

        return randomString.toString();
    }

    private void addNoise(Graphics2D g2d, int width, int height) {
        Random random = new Random();
        for (int i = 0; i < 75; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int size = random.nextInt((int)(5 * (0.75)));
            g2d.setColor(new Color(random.nextFloat(), random.nextFloat(), random.nextFloat()));
            g2d.fillRect(x, y, size, size);
        }
    }

    private boolean validate(String username, String password, String gotCaptcha, String captcha) {

        if(username == null || username.isEmpty()){
            this.msg = "用户名不能空";
            return false;
        }
        if(password == null || password.isEmpty()){
            this.msg = "密码不能空";
            return false;
        }
        /*if(gotCaptcha == null || !(gotCaptcha.equalsIgnoreCase(captcha))){
            this.msg = "验证码错误";
            return false;
        }*/
        return true;
    }



}
