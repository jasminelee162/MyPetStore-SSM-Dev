package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;


@Data
@TableName("orders")
public class Order {
    @TableId(value = "orderid")
    private String orderId;
    @TableField(value = "userid")
    private String userId;
    @TableField(value = "orderdate")
    private String orderDate;
    @TableField(value = "shipaddr1")
    private String shipAddr1;
    @TableField(value = "shipaddr2")
    private String shipAddr2;
    @TableField(value = "shipcity")
    private String shipCity;
    @TableField(value = "shipstate")
    private String shipState;
    @TableField(value = "shipzip")
    private String shipZip;
    @TableField(value = "shipcountry")
    private String shipCountry;
    @TableField(value = "billaddr1")
    private String billAddr1;
    @TableField(value = "billaddr2")
    private String billAddr2;
    @TableField(value = "billcity")
    private String billCity;
    @TableField(value = "billstate")
    private String billState;
    @TableField(value = "billcountry")
    private String billZip;
    @TableField(value = "billzip")
    private String billCountry;
    @TableField(value = "courier")
    private String courier;
    @TableId(value = "totalprice")
    private String totalPrice;
    @TableField(value = "billtofirstname")
    private String billToFirstName;
    @TableField(value = "billtolastname")
    private String billToLastName;
    @TableField(value = "shiptofirstname")
    private String shipToFirstName;
    @TableField(value = "shiptolastname")
    private String shipToLastName;
    @TableField(value = "creditcard")
    private String creditCard;
    @TableField(value = "exprdate")
    private String exprDate;
    @TableField(value = "cardtype")
    private String cardType;
    @TableField(value = "locale")
    private String locale;



}
