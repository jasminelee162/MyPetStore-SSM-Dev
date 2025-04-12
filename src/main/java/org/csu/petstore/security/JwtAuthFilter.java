package org.csu.petstore.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class JwtAuthFilter extends OncePerRequestFilter {

    @Autowired
    private JwtUtil jwtUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String authHeader = request.getHeader("Authorization");

        if(authHeader == null){
            if(!exclude(request)){
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid token");
                return;
            }
            /*else{
                filterChain.doFilter(request, response);
            }*/
        }
        else if(authHeader.startsWith("Bearer ")) {
            authHeader = authHeader.substring(7);
            if(!jwtUtil.validateToken(authHeader) || jwtUtil.isTokenDeleted(authHeader)) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid token");
                return;
            }

            String username = jwtUtil.extractToken(authHeader);
            Authentication authentication = new UsernamePasswordAuthenticationToken(username, null, new ArrayList<GrantedAuthority>());

            SecurityContextHolder.getContext().setAuthentication(authentication);

            // 设置到 SecurityContext
            SecurityContextHolder.getContext().setAuthentication(authentication);
        }

        filterChain.doFilter(request, response);
    }

    public boolean exclude(HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        // 判断请求路径是否在排除列表中
        return true;
        //return requestURI.equals("/accounts") || requestURI.equals("/tokens") || requestURI.equals("/") || requestURI.equals("/catalog/index") || requestURI.equals("/captcha");
    }
}
