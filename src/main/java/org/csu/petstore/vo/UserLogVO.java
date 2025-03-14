package org.csu.petstore.vo;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class UserLogVO {
    private Integer id;
    private String userName;
    private String actionType;
    public String actionDetails;
    private Timestamp timestamp;
}
