package org.csu.petstore.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.ui.Model;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import java.io.ByteArrayOutputStream;

@Controller
@RequestMapping("/captcha")
@SessionAttributes("captcha")
public class CaptchaController {

    @GetMapping(produces = MediaType.IMAGE_PNG_VALUE)
    @ResponseBody
    public byte[] getCaptcha(Model model) throws IOException {
        int originalWidth = 200;
        int originalHeight = 50;

        // 设置缩放比例
        double scale = 0.75; // 75% 的缩放比例
        int width = (int) (originalWidth * scale);
        int height = (int) (originalHeight * scale);

        // 创建一个图像缓冲区
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        // 获取图形上下文
        Graphics2D g2d = bufferedImage.createGraphics();

        g2d.setColor(Color.white);
        g2d.fillRect(0, 0, width, height);

        // 生成随机字符
        String captchaText = generateRandomString(5); // 生成包含5个字符的随机字符串

        // 将验证码存储在 Model 中，Spring 会自动将其放入 Session
        model.addAttribute("captcha", captchaText);

        // 设置
        g2d.setFont(new Font("SansSerif", Font.BOLD, (int) (24 * scale))); // 根据比例缩小字体大小
        g2d.setColor(Color.black);

        // 绘制验证码
        g2d.drawString(captchaText, (int) (50 * scale), (int) (30 * scale));

        // 添加噪音
        addNoise(g2d, (int) (width * scale), (int) (height * scale)); // 使用缩小后的尺寸添加噪声

        // 将图片写入字节数组
        try (OutputStream os = new ByteArrayOutputStream()) {
            ImageIO.write(bufferedImage, "png", os);
            return ((ByteArrayOutputStream) os).toByteArray();
        }
    }

    // 生成随机字符串
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

    // 添加噪音
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
}
