package org.csu.petstore.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.csu.petstore.entity.LogRecord;
import org.csu.petstore.persistence.LogMapper;
import org.csu.petstore.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;






@Service("logService")
public class LogServiceImpl implements LogService {
    private static final Logger logger = LogManager.getLogger(LogService.class);

    @Autowired
    private LogMapper logMapper;

    @Override
    public void logInfo(String message) {
        logger.info(message);
        logMapper.insertLog(new LogRecord("INFO", message));
    }

    @Override
    public void setLog(String message) {
        logger.info(message);
        logMapper.insertLog(new LogRecord("INFO", message));
    }
}
