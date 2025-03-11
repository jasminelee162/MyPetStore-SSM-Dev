package org.csu.petstore.service.impl;

import org.csu.petstore.entity.Account;
import org.csu.petstore.persistence.AccountMapper;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Override
    public AccountVO getAccount(String username, String password) {
        return accountMapper.getAccountVOByUsernameAndPassword(username, password);
    }

    @Override
    public boolean checkAccount(String username) {
        return this.accountMapper.isUsernameExists(username);
    }

    @Override
    public void registerAccount(Account account) {
        // 插入账户信息
        accountMapper.insertAccount(account);
        // 插入登录信息
        accountMapper.insertSignon(account);
        // 插入用户配置信息
        accountMapper.insertProfile(account);
    }
}
