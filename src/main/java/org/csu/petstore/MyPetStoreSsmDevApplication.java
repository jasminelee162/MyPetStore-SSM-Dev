package org.csu.petstore;

import org.csu.petstore.security.SSLUtil;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;

@SpringBootApplication
@MapperScan("org.csu.petstore.persistence")
public class MyPetStoreSsmDevApplication {


    public static void main(String[] args) throws NoSuchAlgorithmException, KeyManagementException {
        SSLUtil.disableSslVerification();
        SpringApplication.run(MyPetStoreSsmDevApplication.class, args);
    }

}
