package com.artbeans.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.UserInfo;
import com.artbeans.web.service.UserService;

import lombok.extern.slf4j.Slf4j;

/*
 * 테스트용 변경하셔도 됩니다.
 * 
 * 
 */

@RestController
@Slf4j
public class UserInfoController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/user")
	public int insert(@RequestBody UserInfo userInfo) {
		log.info("UserInfo => {}", userInfo);
		userService.saveUser(userInfo);
		return 1;
	}
	
	@GetMapping("/users")
	public List<UserInfo> getList(@RequestBody UserInfo userInfo){
		return userService.getList(userInfo);
	}
	
	@PostMapping("/login")
	public UserInfo login(@RequestBody UserInfo userInfo, HttpServletRequest req) {
		UserInfo user = userService.login(userInfo); 
		log.info("user=>{}",user);
		if(user!=null) {
			HttpSession session = req.getSession();
			session.setAttribute("userInfo", user);
		}
		return user;
				 
	}
}
