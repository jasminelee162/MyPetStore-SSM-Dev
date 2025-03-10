package org.csu.petstore.service;

import org.csu.petstore.entity.Account;
import org.springframework.stereotype.Service;


public interface AccountService {

    public Account getAccount(String username, String password);
    public boolean checkAccount(String username);
    public void registerAccount(Account account);


}
