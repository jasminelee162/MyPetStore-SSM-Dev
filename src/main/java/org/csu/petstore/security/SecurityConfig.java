package org.csu.petstore.security;

import org.csu.petstore.security.JwtAuthFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;


@Configuration
public class SecurityConfig {

    @Autowired
    private JwtAuthFilter jwtAuthenticationFilter;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                // 禁用 CSRF（根据需要配置）
                .csrf(csrf -> csrf.disable())
                .formLogin(formLogin -> formLogin.disable())

                // 配置 URL 权限
                .authorizeHttpRequests(authorizeRequests ->
                        authorizeRequests
                                // 放行 OPTIONS 请求，不需要身份认证
                                .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()
                                .requestMatchers("/captcha", "/tokens", "/", "/catalog/index", "/callback", "/auth/github", "/auth/login",
                                        "/catalog/categories").permitAll()  // 公开访问
                                .anyRequest().authenticated()  // 其他请求需要认证
                )

                // 添加自定义过滤器
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);  // JWT 认证过滤器


        return http.build();
    }
}


