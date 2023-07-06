package com.amuldanzi.auth;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;

@Data
public class SnsValue implements SnsUrls {
	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private DefaultApi20 api20Instance;
	
	public SnsValue(String service, String cid, String cs, String rurl) {
		this.service = service;
		this.clientId= cid;
		this.clientSecret=cs;
		this.redirectUrl=rurl;
		if(StringUtils.equalsIgnoreCase(service, "naver")) {
			this.api20Instance = NaverAPI20.instance();
		}else if(StringUtils.equalsIgnoreCase(service, "google")) {
			this.api20Instance = GoogleApi20.instance();
		}
	}
}
