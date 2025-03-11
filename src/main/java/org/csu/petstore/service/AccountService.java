package org.csu.petstore.service;

import org.csu.petstore.entity.Account;
import org.csu.petstore.vo.AccountVO;
import org.springframework.stereotype.Service;


public interface AccountService {

    public AccountVO getAccount(String username, String password);
    public boolean checkAccount(String username);
    public void registerAccount(Account account);


}
