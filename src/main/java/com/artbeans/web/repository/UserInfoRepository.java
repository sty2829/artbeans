package com.artbeans.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.UserInfo;

public interface UserInfoRepository extends JpaRepository<UserInfo, Integer> {

	public UserInfo findByUiEmailAndUiPwd(String uiEmail, String uiPwd);
	public UserInfo findByUiPhoneNumber(String uiPhoneNumber);
	public UserInfo findByUiEmail(String uiEmail);
}
