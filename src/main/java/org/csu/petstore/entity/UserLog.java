package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.sql.Timestamp;

@Data
@TableName("user_logs")
public class UserLog {
    @TableId("id")
    private Integer id;
    @TableField("user_name")
    private String userName;
    @TableField("action_type")
    private String actionType;
    @TableField("action_details")
    public String actionDetails;
    @TableField("request_time")
    private Timestamp timestamp;

}
