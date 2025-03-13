package org.csu.petstore.service.impl;

import org.csu.petstore.persistence.UserLogMapper;
import org.csu.petstore.service.LogService;
import org.csu.petstore.vo.UserLogVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private UserLogMapper userLogMapper;


    @Override
    public UserLogVO getUserBrowseLog(String userName, String categoryId, String productId, String itemId, Timestamp timestamp) {
        UserLogVO userLogVO = new UserLogVO();
        userLogVO.setUserName(userName);
        userLogVO.setActionType("Browse");
        userLogVO.setTimestamp(timestamp);
        userLogVO.setActionDetails("categoryId=" + categoryId + "&productId=" + productId + "&itemId=" + itemId);
        userLogMapper.insert(userLogVO);
        return userLogVO;
    }
}
