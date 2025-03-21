package org.csu.petstore.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.csu.petstore.entity.LogRecord;
import org.csu.petstore.persistence.LogMapper;
import org.csu.petstore.persistence.UserLogMapper;
import org.csu.petstore.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Service("logService")
public class LogServiceImpl implements LogService {
    private static final Logger logger = LogManager.getLogger(LogService.class);

    @Autowired
    private LogMapper logMapper;

    @Autowired
    private UserLogMapper userLogMapper;

    @Override
    public void logInfo(String message) {
        logger.info(message);
        logMapper.insertLog(new LogRecord("INFO", message));
    }

    @Override
    public void setLog(String message) {
        logger.info(message);
        logMapper.insertLog(new LogRecord("INFO", message));
    }

    @Override
    public Map<String, Object> analyzeLogs() {
        List<String> messages = userLogMapper.getAllMessage(); // 获取所有日志 message

        Map<String, Integer> categoryCount = new HashMap<>();
        Map<String, Integer> productCount = new HashMap<>();
        Map<String, Integer> itemCount = new HashMap<>();
        Map<String, Integer> orderCount = new HashMap<>();

        int totalOrderSubmissions = 0; // 记录订单总提交次数

        for (String message : messages) {
            if (message.contains("viewed category:")) {
                String category = message.split("viewed category: ")[1].trim();
                categoryCount.put(category, categoryCount.getOrDefault(category, 0) + 1);
            }

            if (message.contains("viewed product:")) {
                String product = message.split("viewed product: ")[1].trim();
                productCount.put(product, productCount.getOrDefault(product, 0) + 1);
            }

            if (message.contains("viewed item:")) {
                String item = message.split("viewed item: ")[1].trim();
                itemCount.put(item, itemCount.getOrDefault(item, 0) + 1);
            }

            if (message.contains("submit order")) {
                totalOrderSubmissions++; // 订单提交总次数 +1
            }
        }

        // 找出浏览次数最多的 category
        Map.Entry<String, Integer> topCategory = categoryCount.entrySet()
                .stream()
                .max(Map.Entry.comparingByValue())
                .orElse(Map.entry("暂无数据", 0));

        // 找出浏览次数最多的 product
        Map.Entry<String, Integer> topProduct = productCount.entrySet()
                .stream()
                .max(Map.Entry.comparingByValue())
                .orElse(Map.entry("暂无数据", 0));

        // 找出浏览次数最多的 item
        Map.Entry<String, Integer> topItem = itemCount.entrySet()
                .stream()
                .max(Map.Entry.comparingByValue())
                .orElse(Map.entry("暂无数据", 0));

        // 找出购买最多的 product
        Map.Entry<String, Integer> topPurchased = orderCount.entrySet()
                .stream()
                .max(Map.Entry.comparingByValue())
                .orElse(Map.entry("暂无数据", 0));

        Map<String, Object> result = new HashMap<>();
        result.put("topCategoryId", topCategory.getKey());
        result.put("topCategoryCount", topCategory.getValue());

        result.put("topProductId", topProduct.getKey());
        result.put("topProductCount", topProduct.getValue());

        result.put("topItemId", topItem.getKey());
        result.put("topItemCount", topItem.getValue());

        result.put("totalOrderSubmissions", totalOrderSubmissions);

        return result;
    }

}
