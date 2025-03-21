package org.csu.petstore.persistence;

import org.apache.ibatis.annotations.Select;
import org.csu.petstore.entity.LineItem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface LineItemMapper extends BaseMapper<LineItem> {
    @Select("SELECT * FROM lineitem WHERE orderid = #{orderId}")
    List<LineItem> selectListByOrderId(Integer orderId);
}
