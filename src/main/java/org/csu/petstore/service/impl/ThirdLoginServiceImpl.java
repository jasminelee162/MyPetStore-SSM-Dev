package org.csu.petstore.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.ThirdLoginService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class ThirdLoginServiceImpl implements ThirdLoginService {

    @Autowired
    private AccountService accountService;

    private final RestTemplate restTemplate = new RestTemplate(); // Initialize RestTemplate here

    @Override
    public AccountVO getUserInfoFromGitHub(String code) throws JsonProcessingException {
        String token = fetchAccessToken(code);
        String userInfo = fetchUserInfo(token);
        return mapGitHubDataToAccount(userInfo);
    }

    @Override
    public String fetchAccessToken(String code) {
        MultiValueMap<String, String> paramMap = new LinkedMultiValueMap<>();
        paramMap.add("client_id", "Ov23liaqK4Ooy6PMiWWX");
        paramMap.add("client_secret", "aaa02740aa3db1a27fec8e2870937702106cc053");
        paramMap.add("code", code);
        paramMap.add("accept", "json");

        // Set request headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(paramMap, headers);

        // Make the POST request to fetch the token
        ResponseEntity<String> response = restTemplate.exchange(
                "https://github.com/login/oauth/access_token",
                HttpMethod.POST,
                entity,
                String.class
        );

        String result = response.getBody();
        String token = null;
        if (result != null) {
            token = result.split("&")[0].split("=")[1];
        }
        return token;
    }

    @Override
    public String fetchUserInfo(String token) {
        HttpHeaders userHeaders = new HttpHeaders();
        userHeaders.set("Authorization", "token " + token);
        userHeaders.set("X-GitHub-Api-Version", "2022-11-28");

        HttpEntity<String> userEntity = new HttpEntity<>(userHeaders);

        // Make the GET request to fetch user info
        ResponseEntity<String> userResponse = restTemplate.exchange(
                "https://api.github.com/user",
                HttpMethod.GET,
                userEntity,
                String.class
        );

        return userResponse.getBody();
    }

    @Override
    public AccountVO mapGitHubDataToAccount(String userInfo) throws JsonProcessingException {
        // Example parsing process
        JsonNode userNode = new ObjectMapper().readTree(userInfo);
        AccountVO account = new AccountVO();

        // Check and create or fetch account
        String username = userNode.get("login").asText();
        if (!accountService.checkAccount(username)) {
            account.setUsername(userNode.get("login").asText());
            account.setPassword("0000");
            account.setEmail(userNode.get("email").asText());
            account.setFirstname("N");
            account.setLastname("N");
            account.setStatus("0");
            account.setAddr1("N");
            account.setAddr2("N");
            account.setCity("N");
            account.setState("N");
            account.setZip("N");
            account.setCountry("N");
            account.setPhone("N");
            account.setLangpref("english");
            account.setFavcategory("FISH");
            account.setMylistopt(false);
            account.setBanneropt(false);
            accountService.registerAccount(account);
        } else {
            account = accountService.getAccountByUsername(username);
        }

        return account;
    }
}
