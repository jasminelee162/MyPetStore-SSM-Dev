package org.csu.petstore.persistence;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.csu.petstore.vo.UserLogVO;

@Mapper
public interface UserLogMapper {
    @Insert("INSERT INTO user_logs (user_name, action_type, action_details, request_time) " +
            "VALUES (#{userName}, #{actionType}, #{actionDatails}, #{requestTime})")
    void insert(UserLogVO log);
}
