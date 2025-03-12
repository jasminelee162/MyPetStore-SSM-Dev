package org.csu.petstore.vo;


import lombok.Data;

import java.util.Date;

@Data
public class OrderStatusVO {
    private Integer orderId; // 订单ID
    private Integer linenum; // 行号
    private Date timestamp; // 时间戳
    private String status; // 状态

}