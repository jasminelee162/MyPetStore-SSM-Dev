package org.csu.petstore.service.impl;

import org.csu.petstore.entity.Account;
import org.csu.petstore.persistence.AccountMapper;
import org.csu.petstore.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Override
    public Account getAccount(String username, String password) {
        Account account = new Account();
        account.setUsername(username);
        account.setPassword(password);
        return this.accountMapper.getAccountByUsernameAndPassword(account);
    }

    @Override
    public boolean checkAccount(String username) {
        return this.accountMapper.isUsernameExists(username);
    }

    @Override
    public void registerAccount(Account account) {
        // 等待实现
    }
}
