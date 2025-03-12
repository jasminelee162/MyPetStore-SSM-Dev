package org.csu.petstore.persistence;

import org.csu.petstore.entity.OrderStatus;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderStatusMapper extends BaseMapper<OrderStatus> {

}