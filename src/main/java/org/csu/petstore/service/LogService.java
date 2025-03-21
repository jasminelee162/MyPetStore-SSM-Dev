package org.csu.petstore.service;

import java.util.Map;

public interface LogService {
    public void logInfo(String message);

    public void setLog(String message);

    public Map<String, Object> analyzeLogs();
}
