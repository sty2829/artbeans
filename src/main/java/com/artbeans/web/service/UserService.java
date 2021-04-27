package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.UserInfo;


public interface UserService {
	List<UserInfo> getList(UserInfo userInfo);
	UserInfo getUser(Integer uiNum);
	UserInfo saveUser(UserInfo ui);
	UserInfo updateUser(UserInfo ui);
	int deleteUser(Integer uiNum);
	UserInfo login(UserInfo userInfo);
	
	//id찾기
	UserInfo findId(String uiPhoneNumber);
	// 비밀번호 이메일 인증..
	int mailCheck(UserInfo userInfo);
	// 이메일 중복조회
	int emailCheck(String uiEmail);
	UserInfo pwdCheck(String uiEmail);
}
