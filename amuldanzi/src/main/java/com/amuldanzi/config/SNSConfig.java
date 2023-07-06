package com.amuldanzi.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SNSConfig {
    @Value("${naver.client.id}")
    private String naverClientId;

    @Value("${naver.client.secret}")
    private String naverClientSecret;

    @Value("${naver.redirect.url}")
    private String naverRedirectUrl;

    @Bean(name = "naverSns")
    public SNS naverSns() {
        return new SNS("naver", naverClientId, naverClientSecret, naverRedirectUrl);
    }	
}
