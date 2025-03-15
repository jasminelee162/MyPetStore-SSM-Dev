package org.csu.petstore.service;

import org.apache.ibatis.annotations.Update;
import org.csu.petstore.vo.AccountVO;


public interface AccountService {

    public AccountVO getAccount(String username, String password);
    public boolean checkAccount(String username);
    public void registerAccount(AccountVO account);



    boolean validatePassword(String username, String password);

    @Update("UPDATE ACCOUNT SET EMAIL = #{email}, FIRSTNAME = #{firstname}, LASTNAME = #{lastname}, " +
            "ADDR1 = #{address1}, ADDR2 = #{address2}, CITY = #{city}, STATE = #{state}, ZIP = #{zip}, " +
            "COUNTRY = #{country}, PHONE = #{phone} WHERE USERID = #{username}")
    void updateAccount(AccountVO accountVO);


}
