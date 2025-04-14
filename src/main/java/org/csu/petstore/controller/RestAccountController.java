package org.csu.petstore.controller;


import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.csu.petstore.common.CommonResponse;
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

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.List;

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
    public CommonResponse<String> register(@RequestBody AccountVO accountVO) {
        try {
            accountService.registerAccount(accountVO);
            msg = "Account registered successfully, send to sign on";
            return CommonResponse.createForSuccess(msg);
        } catch (Exception e) {
            msg = "Account registration failed, parameter form is invalid";
            return CommonResponse.createForError(msg);
        }
    }

    @PostMapping("/tokens")
    public ResponseEntity<?> login(@RequestParam String username,
                                   @RequestParam String password,
                                   @RequestParam("captcha") String gotCaptcha, // 接收前端验证码
                                   @RequestParam(value = "admin", required = false) boolean admin) {

        if (!validate(username, password, gotCaptcha, captcha)) {
            msg = "Invalid username or password, reload sign on form and try again";
            CommonResponse<String> response = CommonResponse.createForError(msg);
            return ResponseEntity.status(HttpStatus.OK).body(response);
        } else {
            AccountVO loginAccount = accountService.getAccount(username, password);
            if (loginAccount == null) {
                msg = "incorrect username or password, reload sign on form and try again";
                CommonResponse<String> response = CommonResponse.createForError(msg);
                return ResponseEntity.status(HttpStatus.OK).body(response);
            } else {
                String jwtToken = jwtUtil.generateToken(username);
                msg = successString + "main form and put loginAccount in session";

                // 记录登录日志
                String logMessage = "User " + username + " login success!";
                logService.setLog(logMessage);

                // 如果是管理员并且用户具有管理员权限则返回不同消息
                if (admin && loginAccount.isAdmin()) {
                    msg = successString + "admin form and put loginAccount in session";
                }

                List<CategoryVO> categories = catalogService.getAllCategories();
                // 构造数据返回，可扩展其他必要数据
                Map<String, Object> data = new HashMap<>();
                data.put("loginAccount", loginAccount);
                data.put("categories", categories);
                data.put("admin", admin);

                CommonResponse<Map<String, Object>> response = CommonResponse.createForSuccess(msg, data);
                return ResponseEntity.status(HttpStatus.OK)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + jwtToken)
                        .body(response);
            }
        }
    }

    @DeleteMapping("/tokens")
    public CommonResponse<String> signOut(@RequestHeader("Authorization") String token) {

        token = token.substring(7);
        jwtUtil.deleteToken(token);
        msg = "delete token successfully";
        return CommonResponse.createForSuccess(msg);
    }

    /**
     * 获取验证码接口：返回验证码字节流，同时使用统一的响应对象包装验证码数据。
     */
    @GetMapping("/captcha")
    public CommonResponse<Map<String, byte[]>> getCaptcha() throws IOException {
        int originalWidth = 200;
        int originalHeight = 50;
        double scale = 0.75;
        int width = (int) (originalWidth * scale);
        int height = (int) (originalHeight * scale);

        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = bufferedImage.createGraphics();

        g2d.setColor(Color.white);
        g2d.fillRect(0, 0, width, height);

        captcha = generateRandomString(5);

        g2d.setFont(new Font("SansSerif", Font.BOLD, (int) (24 * scale)));
        g2d.setColor(Color.black);
        g2d.drawString(captcha, (int) (50 * scale), (int) (30 * scale));

        addNoise(g2d, width, height);

        ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write(bufferedImage, "png", os);

        Map<String, byte[]> data = new HashMap<>();
        data.put("captcha", os.toByteArray());

        return CommonResponse.createForSuccess(data);
    }


    @PutMapping("/accounts/{id}")
    public CommonResponse<Map<String, Object>> updateAccount(@PathVariable("id") String username,
                                                @RequestParam("confirmPassword") String confirmPassword,
                                                @RequestBody AccountVO account) {

        if (!account.getPassword().equals(confirmPassword)) {
            return CommonResponse.createForError("Password confirmation does not match.");
        }

        try {
            accountService.updateAccount(account);
            // 返回成功，但不需要返回具体内容
            Map<String, Object> data = new HashMap<>();
            data.put("loginAccount", account);
            return CommonResponse.createForSuccess("Account updated successfully.", data);
        } catch (Exception e) {
            logService.setLog("更新账户信息失败: " + e.getMessage());
            return CommonResponse.createForError("Failed to update account information.");
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
