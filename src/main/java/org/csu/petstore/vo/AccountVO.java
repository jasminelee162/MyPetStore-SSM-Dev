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

    private String bannerName;

    // 构造函数，用于整合三个类的信息
    /*public AccountVO(Account account, Profile profile, SignOn signOn) {
        this.username = account.getUsername();
        this.password = account.getPassword();
        this.email = account.getEmail();
        this.firstname = account.getFirstname();
        this.lastname = account.getLastname();
        this.status = account.getStatus();
        this.addr1 = account.getAddr1();
        this.addr2 = account.getAddr2();
        this.city = account.getCity();
        this.state = account.getState();
        this.zip = account.getZip();
        this.country = account.getCountry();
        this.phone = account.getPhone();

        this.langpref = profile.getLangpref();
        this.favcategory = profile.getFavcategory();
        this.mylistopt = profile.getMylistopt();
        this.banneropt = profile.getBanneropt();

        this.signOnUsername = signOn.getUsername();
        this.signOnPassword = signOn.getPassword();
    }*/

}
