package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Profile;
import org.csu.petstore.entity.SignOn;
import org.csu.petstore.vo.AccountVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountMapper extends BaseMapper<Account> {

    @Select("SELECT " +
            "SIGNON.USERNAME, SIGNON.ADMIN, " +
            "ACCOUNT.EMAIL, ACCOUNT.FIRSTNAME, ACCOUNT.LASTNAME, ACCOUNT.STATUS, " +
            "ACCOUNT.ADDR1 AS addr1, ACCOUNT.ADDR2 AS addr2, " +
            "ACCOUNT.CITY, ACCOUNT.STATE, ACCOUNT.ZIP, ACCOUNT.COUNTRY, ACCOUNT.PHONE, " +
            "PROFILE.LANGPREF AS langpref, PROFILE.FAVCATEGORY AS favcategory, " +
            "PROFILE.MYLISTOPT AS mylistopt, PROFILE.BANNEROPT AS banneropt, " +
            "BANNERDATA.BANNERNAME AS bannerName " +
            "FROM ACCOUNT " +
            "JOIN SIGNON ON SIGNON.USERNAME = ACCOUNT.USERID " +
            "JOIN PROFILE ON PROFILE.USERID = ACCOUNT.USERID " +
            "JOIN BANNERDATA ON PROFILE.FAVCATEGORY = BANNERDATA.FAVCATEGORY " +
            "WHERE ACCOUNT.USERID = #{username} AND SIGNON.PASSWORD = #{password}")
    AccountVO getAccountVOByUsernameAndPassword(String username, String password);


    @Insert("INSERT INTO ACCOUNT (USERID, EMAIL, FIRSTNAME, LASTNAME, STATUS, ADDR1, ADDR2, CITY, STATE, ZIP, COUNTRY, PHONE) " +
            "VALUES (#{username}, #{email}, #{firstname}, #{lastname}, #{status}, #{addr1}, #{addr2}, #{city}, #{state}, #{zip}, #{country}, #{phone})")
    void insertAccount(Account account);

    @Insert("INSERT INTO PROFILE (USERID, LANGPREF, FAVCATEGORY, MYLISTOPT, BANNEROPT) " +
            "VALUES (#{userid}, #{langpref}, #{favcategory}, #{mylistopt}, #{banneropt})")
    void insertProfile(Profile profile);

    @Insert("INSERT INTO SIGNON (USERNAME, PASSWORD) VALUES (#{username}, #{password})")
    void insertSignon(SignOn signon);

    @Select("SELECT " +
            "SIGNON.USERNAME, SIGNON.ADMIN, " +
            "ACCOUNT.EMAIL, ACCOUNT.FIRSTNAME, ACCOUNT.LASTNAME, ACCOUNT.STATUS, " +
            "ACCOUNT.ADDR1 AS addr1, ACCOUNT.ADDR2 AS addr2, " +
            "ACCOUNT.CITY, ACCOUNT.STATE, ACCOUNT.ZIP, ACCOUNT.COUNTRY, ACCOUNT.PHONE, " +
            "PROFILE.LANGPREF AS langpref, PROFILE.FAVCATEGORY AS favcategory, " +
            "PROFILE.MYLISTOPT AS mylistopt, PROFILE.BANNEROPT AS banneropt, " +
            "BANNERDATA.BANNERNAME AS bannerName " +
            "FROM ACCOUNT " +
            "JOIN SIGNON ON SIGNON.USERNAME = ACCOUNT.USERID " +
            "JOIN PROFILE ON PROFILE.USERID = ACCOUNT.USERID " +
            "JOIN BANNERDATA ON PROFILE.FAVCATEGORY = BANNERDATA.FAVCATEGORY " +
            "WHERE ACCOUNT.USERID = #{username}")
    AccountVO getAccountVOByUsername(String username);



    // 获取账户信息
    @Select("SELECT * FROM account WHERE ACCOUNT.USERID = #{username}")
    AccountVO getAccountByUsername(@Param("username") String username);

    @Select("SELECT COUNT(*) > 0 FROM SIGNON WHERE USERNAME = #{username}")
    boolean isUsernameExists(String username);

    // Update password in the SIGNON table
    @Update("UPDATE SIGNON SET PASSWORD = #{password}, ADMIN = #{admin} WHERE USERNAME = #{username}")
    void updatePassword(@Param("username") String username, @Param("password") String password, @Param("admin") boolean admin);

    // Update account information in the ACCOUNT table
    @Update("UPDATE ACCOUNT SET " +
            "EMAIL = #{email}, " +
            "FIRSTNAME = #{firstname}, " +
            "LASTNAME = #{lastname}, " +
            "ADDR1 = #{addr1}, " +
            "ADDR2 = #{addr2}, " +
            "CITY = #{city}, " +
            "STATE = #{state}, " +
            "ZIP = #{zip}, " +
            "COUNTRY = #{country}, " +
            "PHONE = #{phone} " +
            "WHERE USERID = #{username}")
    void updateAccount(Account accountVO);

    @Update("UPDATE PROFILE SET " +
            "LANGPREF = #{langpref}" +
            "WHERE USERID = #{userid}")
    void updateProfile(Profile profile);

    @Select("SELECT " +
            "SIGNON.USERNAME, " +
            "ACCOUNT.EMAIL, ACCOUNT.FIRSTNAME, ACCOUNT.LASTNAME, ACCOUNT.STATUS, " +
            "ACCOUNT.ADDR1 AS addr1, ACCOUNT.ADDR2 AS addr2, " +
            "ACCOUNT.CITY, ACCOUNT.STATE, ACCOUNT.ZIP, ACCOUNT.COUNTRY, ACCOUNT.PHONE, " +
            "SIGNON.PASSWORD AS PASSWORD, " +
            "PROFILE.LANGPREF AS langpref, PROFILE.FAVCATEGORY AS favcategory, " +
            "PROFILE.MYLISTOPT AS mylistopt, PROFILE.BANNEROPT AS banneropt, " +
            "BANNERDATA.BANNERNAME AS bannerName " +
            "FROM ACCOUNT " +
            "JOIN SIGNON ON SIGNON.USERNAME = ACCOUNT.USERID " +
            "JOIN PROFILE ON PROFILE.USERID = ACCOUNT.USERID " +
            "JOIN BANNERDATA ON PROFILE.FAVCATEGORY = BANNERDATA.FAVCATEGORY")
    List<AccountVO> getAllAccounts();  // 获取所有用户信息


}
