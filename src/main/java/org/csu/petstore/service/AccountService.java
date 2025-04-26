package org.csu.petstore.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.ibatis.annotations.Update;
import org.csu.petstore.persistence.AccountMapper;
import org.csu.petstore.vo.AccountVO;

import java.util.List;


public interface AccountService {

    public AccountVO getAccount(String username, String password);
    public boolean checkAccount(String username);
    public void registerAccount(AccountVO account);



    boolean validatePassword(String username, String password);
    AccountVO getAccountByUsername(String username);
    void updateAccount(AccountVO account);


    List<AccountVO> getAllAccounts();

    public AccountVO getAccountVO(String username);




}
