package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.ReservationTicketInfo;
import com.artbeans.web.entity.UserInfo;


public interface UserService {
	List<UserInfo> getList(UserInfo ui);
	UserInfo getUser(Integer uiNum);
	UserInfo saveUser(UserInfo ui);
	UserInfo updateUser(UserInfo ui);
	int deleteUser(Integer uiNum);
	UserInfo login(UserInfo ui);
	List<UserTicketDTO> getTicketList(Integer uiNum);
	
}
