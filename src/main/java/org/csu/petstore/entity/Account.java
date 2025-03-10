package org.csu.petstore.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
//import net.sourceforge.stripes.validation.Validate;

@Setter
@Getter
public class Account implements Serializable {
    private static final long serialVersionUID = 8751282105532159742L;

    private String username;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String status;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String zip;
    private String country;
    private String phone;
    private String favouriteCategoryId;
    private String languagePreference;
    private boolean listOption;
    private boolean bannerOption;
    private String bannerName;

    public Account() {
    }


    public boolean getListOption() {
        return this.listOption;
    }

    public boolean getBannerOption() {
        return this.bannerOption;
    }

    public void setAddr1(String address1) {
        this.address1 = address1;
    }

    public void setAddr2(String address2) {
        this.address2 = address2;
    }

}
