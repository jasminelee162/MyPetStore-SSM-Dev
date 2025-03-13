package org.csu.petstore.vo;

import lombok.Data;
import org.csu.petstore.entity.Product;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;


@Data
public class OrderVO {
    private String orderId;
    private String userId;
    private String orderDate;
    private String shipAddr1;
    private String shipAddr2;
    private String shipCity;
    private String shipState;
    private String shipZip;
    private String shipCountry;
    private String billAddr1;
    private String billAddr2;
    private String billCity;
    private String billState;
    private String billZip;
    private String billCountry;
    private String courier;
    private String totalPrice;
    private String billToFirstName;
    private String billToLastName;
    private String shipToFirstName;
    private String shipToLastName;
    private String creditCard;
    private String exprDate;
    private String cardType;
    private String locale;



    //下面两个属性位于另外一张表中
    //OrderDaoImpl 199
    //追溯到OrderServlet 35，在doGet()时自动插入时间、状态
    //status在原来init时默认为P，待实现

    private String status;
    private List<LineItemVO> lineItems;


    private Timestamp timestamp;
}