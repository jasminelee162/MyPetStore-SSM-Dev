package org.csu.petstore.vo;

import lombok.Data;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Profile;
import org.csu.petstore.entity.SignOn;

@Data
public class AccountVO {

    // Account 类中的字段
    private String username;
    private String password;
    private String email;
    private String firstname;
    private String lastname;
    private String status;
    private String addr1;
    private String addr2;
    private String city;
    private String state;
    private String zip;
    private String country;
    private String phone;

    // Profile 类中的字段
    private String langpref;
    private String favcategory;
    private boolean mylistopt;
    private boolean banneropt;

    // SignOn 类中的字段
    private String signOnUsername;
    private String signOnPassword;
    private boolean admin;

    private String bannerName;


}
