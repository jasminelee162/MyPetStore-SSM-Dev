package org.csu.petstore.service.impl;

import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Profile;
import org.csu.petstore.entity.SignOn;
import org.csu.petstore.persistence.AccountMapper;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    @Transactional
    public void registerAccount(AccountVO accountVO) {
        // 创建 Account 实体对象并设置其字段

        Account account = new Account();
        account.setUsername(accountVO.getUsername());
        account.setPassword(accountVO.getPassword());
        account.setEmail(accountVO.getEmail());
        account.setFirstname(accountVO.getFirstname());
        account.setLastname(accountVO.getLastname());
        account.setStatus(accountVO.getStatus());
        account.setAddr1(accountVO.getAddr1());
        account.setAddr2(accountVO.getAddr2());
        account.setCity(accountVO.getCity());
        account.setState(accountVO.getState());
        account.setZip(accountVO.getZip());
        account.setCountry(accountVO.getCountry());
        account.setPhone(accountVO.getPhone());
        System.out.println(account.toString());
        System.out.println(accountVO.toString());

        // 插入账户信息
        accountMapper.insertAccount(account);

        // 创建 SignOn 实体对象并设置其字段
        SignOn signOn = new SignOn();
        signOn.setUsername(accountVO.getUsername());
        signOn.setPassword(accountVO.getPassword());

        // 插入登录信息
        accountMapper.insertSignon(signOn);

        // 创建 Profile 实体对象并设置其字段
        Profile profile = new Profile();
        profile.setUserid(accountVO.getUsername()); // 假设 Profile 表中 username 是关联 Account 的外键
        profile.setLangpref(accountVO.getLangpref());
        profile.setFavcategory(accountVO.getFavcategory());
        profile.setMylistopt(accountVO.isMylistopt());
        profile.setBanneropt(accountVO.isBanneropt());

        // 插入用户配置信息
        accountMapper.insertProfile(profile);

    }




    @Override
    public AccountVO getAccountByUsername(String username) {
        return accountMapper.getAccountByUsername(username);
    }



    @Override
    public void updateAccount(AccountVO accountVO) {
        // 将VO转换为Entity并更新
        Account account = new Account();
        account.setUsername(accountVO.getUsername());
        account.setPassword(accountVO.getPassword());
        account.setEmail(accountVO.getEmail());
        account.setFirstname(accountVO.getFirstname());
        account.setLastname(accountVO.getLastname());
        account.setStatus(accountVO.getStatus());
        account.setAddr1(accountVO.getAddr1());
        account.setAddr2(accountVO.getAddr2());
        account.setCity(accountVO.getCity());
        account.setState(accountVO.getState());
        account.setZip(accountVO.getZip());
        account.setCountry(accountVO.getCountry());
        account.setPhone(accountVO.getPhone());
        System.out.println(account.toString());
        System.out.println(accountVO.toString());

        // 调用Mapper进行更新操作
        accountMapper.updateAccount(account);
    }
    @Override
    public boolean validatePassword(String username, String password) {
        return false;
    }


}
