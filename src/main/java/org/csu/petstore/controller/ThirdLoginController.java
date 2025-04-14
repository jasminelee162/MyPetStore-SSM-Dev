package org.csu.petstore.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Profile;
import org.csu.petstore.entity.SignOn;
import org.csu.petstore.security.JwtUtil;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.ThirdLoginService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import java.util.HashMap;
import java.util.Map;

@RestController
public class ThirdLoginController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private ThirdLoginService thirdLoginService;

    @GetMapping("/callback")
    public ResponseEntity<?> getCode(String code) throws JsonProcessingException {
        AccountVO loginAccount = thirdLoginService.getUserInfoFromGitHub(code);

        Map<String, Object> data = new HashMap<>();
        data.put("loginAccount", loginAccount);

        String jwtToken = jwtUtil.generateToken(loginAccount.getUsername());

        CommonResponse<Map<String, Object>> res = CommonResponse.createForSuccess("success", data);

        return ResponseEntity.status(HttpStatus.OK)
                .header(HttpHeaders.AUTHORIZATION, "Bearer " + jwtToken)
                .body(res);
    }


}


