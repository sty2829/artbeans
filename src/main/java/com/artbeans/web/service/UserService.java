package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.ReviewInfo;
import com.artbeans.web.entity.UserInfo;


public interface UserService {
	List<UserInfo> getList(UserInfo userInfo);
	UserInfo getUser(Integer uiNum);
	UserInfo saveUser(UserInfo ui);
	UserInfo updateUser(UserInfo ui);
	int deleteUser(Integer uiNum);
	UserInfo login(UserInfo userInfo);
	//예약티켓 리스트 조회
	List<UserTicketDTO> getTicketList(Integer uiNum);
	//id찾기
	UserInfo FindId(String uiPhoneNumber);
}
