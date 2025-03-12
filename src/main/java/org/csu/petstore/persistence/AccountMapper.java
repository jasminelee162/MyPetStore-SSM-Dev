package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Profile;
import org.csu.petstore.entity.SignOn;
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

    @Insert("INSERT INTO ACCOUNT (USERID, EMAIL, FIRSTNAME, LASTNAME, STATUS, ADDR1, ADDR2, CITY, STATE, ZIP, COUNTRY, PHONE) " +
            "VALUES (#{username}, #{email}, #{firstname}, #{lastname}, #{status}, #{addr1}, #{addr2}, #{city}, #{state}, #{zip}, #{country}, #{phone})")
    void insertAccount(Account account);

    @Insert("INSERT INTO PROFILE (USERID, LANGPREF, FAVCATEGORY, MYLISTOPT, BANNEROPT) " +
            "VALUES (#{userid}, #{langpref}, #{favcategory}, #{mylistopt}, #{banneropt})")
    void insertProfile(Profile profile);

    @Insert("INSERT INTO SIGNON (USERNAME, PASSWORD) VALUES (#{username}, #{password})")
    void insertSignon(SignOn signon);

    void updateAccount(Account account);

    void updateProfile(Account account);

    void updateSignon(Account account);

    boolean isUsernameExists(String username);

    AccountVO getAccountByUsername(String username);
}
