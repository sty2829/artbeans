package com.artbeans.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.UserInfo;

public interface UserInfoRepository extends JpaRepository<UserInfo, Integer> {

	UserInfo findByUiEmailAndUiPwd(String uiEmail, String uiPwd);

}
