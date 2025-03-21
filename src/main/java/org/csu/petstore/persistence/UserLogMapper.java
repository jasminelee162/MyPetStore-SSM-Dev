package org.csu.petstore.persistence;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.csu.petstore.vo.UserLogVO;

import java.util.List;

@Mapper
public interface UserLogMapper {
    @Insert("INSERT INTO user_logs (user_name, action_type, action_details, request_time) " +
            "VALUES (#{userName}, #{actionType}, #{actionDatails}, #{requestTime})")
    void insert(UserLogVO log);

    @Select("SELECT message FROM log_record")
    List<String> getAllMessage();  // 获取所有日志

}
