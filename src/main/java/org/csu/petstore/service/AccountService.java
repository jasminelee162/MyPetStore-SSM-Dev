package org.csu.petstore.service;

import org.csu.petstore.entity.Account;
import org.csu.petstore.persistence.AccountMapper;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public interface AccountService {

    public AccountVO getAccount(String username, String password);
    public boolean checkAccount(String username);
    public void registerAccount(AccountVO account);

    public void updateAccount(Account account);
}
