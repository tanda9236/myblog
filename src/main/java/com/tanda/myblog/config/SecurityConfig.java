package com.tanda.myblog.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.tanda.myblog.config.oauth.PrincipalOauth2UserService;
import com.tanda.myblog.handler.LoginFailureHandler;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig {
	
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	
	private final LoginFailureHandler loginFailureHandler = new LoginFailureHandler();
	
	@Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
    	http
    	.csrf((csrfConfig) -> csrfConfig.disable())
        
    	.authorizeRequests(authorize -> authorize
        		.antMatchers("/user/**","/board/**").authenticated()
                .antMatchers("/manager/**").access("hasRole('ADMIN') or hasRole('MANAGER')")
                .antMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().permitAll())
    	
        .formLogin((formLogin) -> formLogin
    			.loginPage("/loginForm")
    			.usernameParameter("username")
    			.passwordParameter("password")
    			.loginProcessingUrl("/login")
    			.failureHandler(loginFailureHandler) // 로그인 실패
    			.defaultSuccessUrl("/"))
    	
    	.oauth2Login((oauth2Login) -> oauth2Login
    			.loginPage("/loginForm")
    			.userInfoEndpoint()
    			.userService(principalOauth2UserService));

        return http.build();
    }
}

