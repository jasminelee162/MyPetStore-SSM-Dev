package org.csu.petstore.service;

import org.apache.ibatis.annotations.Update;
import org.csu.petstore.entity.Account;
import org.csu.petstore.persistence.AccountMapper;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public interface AccountService {

    public AccountVO getAccount(String username, String password);
    public boolean checkAccount(String username);
    public void registerAccount(AccountVO account);



    boolean validatePassword(String username, String password);

    @Update("UPDATE ACCOUNT SET EMAIL = #{email}, FIRSTNAME = #{firstname}, LASTNAME = #{lastname}, " +
            "ADDR1 = #{address1}, ADDR2 = #{address2}, CITY = #{city}, STATE = #{state}, ZIP = #{zip}, " +
            "COUNTRY = #{country}, PHONE = #{phone} WHERE USERID = #{username}")
    int updateAccount(AccountVO accountVO);


}
