package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.UserInfo;


public interface UserService {
	List<UserInfo> getList(UserInfo userInfo);
	UserInfo getUser(Integer uiNum);
	UserInfo saveUser(UserInfo ui);
	UserInfo updateUser(UserInfo ui);
	UserInfo login(UserInfo userInfo);
	
	//id찾기
	UserInfo findId(String uiPhoneNumber);

	// 이메일 중복조회
	int emailCheck(String uiEmail);

	// 인증번호 가져올 해당 이메일 찾기..
	String right(UserInfo userInfo);
	//인증번호 일치..
	UserInfo findCode(String code);
	//새비밀번호 변경..
	int cPwd(UserInfo userInfo);
	
	int deleteUser(UserInfo userInfo);

	 
}
