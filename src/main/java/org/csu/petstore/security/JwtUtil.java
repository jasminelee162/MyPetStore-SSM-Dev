package org.csu.petstore.security;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class JwtUtil {

    // 使用安全方法生成 256 位的密钥
    private final Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);
    private long expirationTime = 1000 * 60 * 60 * 24;
    private List<String> blacklistedTokens = new ArrayList<>();

    public String generateToken(String username) {
        return Jwts.builder()
                .setSubject(username)  // 设置用户名为 token 的主体
                .setIssuedAt(new Date())  // 设置签发时间
                .setExpiration(new Date(System.currentTimeMillis() + expirationTime))  // 设置过期时间
                .signWith(key, SignatureAlgorithm.HS256)  // 使用 HS256 算法签名
                .compact();
    }

    // 提取 token 中的用户名
    public String extractToken(String token) {
        Claims claims = parseClaims(token);
        if (claims != null) {
            return claims.getSubject();
        }
        return null;
    }

    // 解析 token 并验证签名
    private Claims parseClaims(String token) {
        try {
            return Jwts.parserBuilder()
                    .setSigningKey(key)  // 设置用于签名验证的密钥
                    .build()
                    .parseClaimsJws(token)  // 解析 token
                    .getBody();
        } catch (JwtException e) {
            return null;
        }
    }

    // 验证 token 是否有效
    public boolean validateToken(String token) {
        Claims claims = parseClaims(token);
        if (claims == null) {
            return false;
        }

        // 检查过期时间
        if (claims.getExpiration() != null && claims.getExpiration().before(new java.util.Date())) {
            return false;  // 如果 token 已过期，返回 false
        }

        return true;  // 如果通过验证，返回 true
    }

    public void deleteToken(String token) {
        blacklistedTokens.add(token);
    }

    public boolean isTokenDeleted(String token) {
        return blacklistedTokens.contains(token);
    }
}