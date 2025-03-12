package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;
import org.csu.petstore.entity.Account;
import org.csu.petstore.vo.AccountVO;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountMapper extends BaseMapper<Account> {

    @Select("SELECT " +
            "SIGNON.USERNAME, " +
            "ACCOUNT.EMAIL, ACCOUNT.FIRSTNAME, ACCOUNT.LASTNAME, ACCOUNT.STATUS, " +
            "ACCOUNT.ADDR1 AS address1, ACCOUNT.ADDR2 AS address2, " +
            "ACCOUNT.CITY, ACCOUNT.STATE, ACCOUNT.ZIP, ACCOUNT.COUNTRY, ACCOUNT.PHONE, " +
            "PROFILE.LANGPREF AS languagePreference, PROFILE.FAVCATEGORY AS favouriteCategoryId, " +
            "PROFILE.MYLISTOPT AS listOption, PROFILE.BANNEROPT AS bannerOption, " +
            "BANNERDATA.BANNERNAME AS bannerName " +
            "FROM ACCOUNT " +
            "JOIN SIGNON ON SIGNON.USERNAME = ACCOUNT.USERID " +
            "JOIN PROFILE ON PROFILE.USERID = ACCOUNT.USERID " +
            "JOIN BANNERDATA ON PROFILE.FAVCATEGORY = BANNERDATA.FAVCATEGORY " +
            "WHERE ACCOUNT.USERID = #{username} AND SIGNON.PASSWORD = #{password}")
    AccountVO getAccountVOByUsernameAndPassword(String username, String password);

   // Account getAccountByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    void insertAccount(Account account);

    void insertProfile(Account account);

    void insertSignon(Account account);

    void updateAccount(AccountVO account);

    void updateProfile(AccountVO account);

    void updateSignon(Account account);

    boolean isUsernameExists(String username);

    AccountVO getAccountByUsername(String username);
}
