package org.csu.petstore.service;

import org.csu.petstore.vo.OrderVO;
import org.csu.petstore.vo.UserLogVO;

import java.sql.Timestamp;

public interface LogService {
    public UserLogVO getUserBrowseLog(String userName, String categoryId, String productId, String itemId, Timestamp timestamp);
}
