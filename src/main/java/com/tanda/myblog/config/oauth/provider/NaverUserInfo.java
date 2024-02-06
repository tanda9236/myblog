package com.tanda.myblog.config.oauth.provider;

import java.util.Map;

public class NaverUserInfo implements OAuth2UserInfo{

	private Map<String, Object> attributes;
	
	// {id=qCo0hz7H8ooU_yJsJEvmXnbhpF8U2Eml0XumaE61ogc,
	//  email=loir92@naver.com, name=이슬기}
	public NaverUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}
	
	@Override
	public String getProviderId() {
		return (String)attributes.get("id");
	}

	@Override
	public String getProvider() {
		return "naver";
	}

	@Override
	public String getEmail() {
		return (String)attributes.get("email");
	}

	@Override
	public String getName() {
		return (String)attributes.get("name");
	}

}
