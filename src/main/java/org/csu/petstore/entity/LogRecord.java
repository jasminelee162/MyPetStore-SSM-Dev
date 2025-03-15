package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.sql.Timestamp;

@Data
@TableName("logs")
public class LogRecord {
    @TableId(value = "id")
    private int id;
    @TableField("level")
    private String level;
    @TableField("message")
    private String message;
    @TableField("timestamp")
    private Timestamp timestamp;

    public LogRecord(String level, String message) {
        this.level = level;
        this.message = message;
        this.timestamp = new Timestamp(System.currentTimeMillis());
    }

}
