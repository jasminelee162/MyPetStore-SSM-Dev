package org.csu.petstore.service.impl;

import org.csu.petstore.persistence.OrderStatusMapper;
import org.csu.petstore.service.AdminOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("AdminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {

    @Autowired
    private OrderStatusMapper orderStatusMapper;

    @Override
    public boolean getOrders() {
        return false;
    }

    public boolean updateStatusToShipped(String orderId) {
        try {
            // 调用 Mapper 更新状态
            int rowsAffected = orderStatusMapper.updateStatusToShipped(orderId);
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
