package org.csu.petstore.entity;

import org.csu.petstore.vo.OrderVO;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ConfirmOrderRequest {
    private String username;
    private OrderVO orderVO;

    // Getter 和 Setter
}
