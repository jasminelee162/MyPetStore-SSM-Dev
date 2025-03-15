package org.csu.petstore.persistence;

import org.apache.ibatis.annotations.Insert;
import org.csu.petstore.entity.LogRecord;


public interface LogMapper {
    @Insert("INSERT INTO log_record (level, message, timestamp) VALUES (#{level}, #{message}, #{timestamp})")
    void insertLog(LogRecord logRecord);
}
