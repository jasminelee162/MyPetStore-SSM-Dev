package org.csu.petstore.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.csu.petstore.vo.AccountVO;

public interface ThirdLoginService {

    public AccountVO mapGitHubDataToAccount(String userInfo) throws JsonProcessingException;

    public AccountVO getUserInfoFromGitHub(String code) throws JsonProcessingException;

    public String fetchUserInfo(String token);

    public String fetchAccessToken(String code);
}
