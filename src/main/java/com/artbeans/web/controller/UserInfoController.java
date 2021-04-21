package com.artbeans.web.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.dto.UserTicketDTO;
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
	private JavaMailSender mailSender;

	@Autowired
	private UserService userService;
	
	@PostMapping("/user")
	public int insert(@RequestBody UserInfo userInfo) {
		log.info("UserInfo => {}", userInfo);
		userInfo = userService.saveUser(userInfo);
		return userInfo.getUiNum();

	}
	
	@GetMapping("/users")
	public List<UserInfo> getList(@RequestBody UserInfo userInfo){
		return userService.getList(userInfo);
	}
	
	@GetMapping("/user")
	public UserInfo getUser(@RequestParam Integer uiNum){
		log.info("uiNum=>{}",userService.getUser(uiNum));
		return userService.getUser(uiNum);
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
	
	@PostMapping("/logout")
	public @ResponseBody boolean logout(HttpServletRequest req) {
		HttpSession hs = req.getSession();
		hs.invalidate();
		return true;
	}
	
	@PostMapping("/user-update")
	public Integer update(@RequestBody UserInfo ui) {
		UserInfo userInfo = userService.updateUser(ui);
		return userInfo.getUiNum();
	}
	

	@PostMapping("/user-insert")
    public Integer userInsert(@RequestBody UserInfo ui) {
      log.info("ui=>{}",ui);	
      UserInfo userInfo = userService.saveUser(ui);
      return userInfo.getUiNum();
    }

	//id찾기..
	@GetMapping("/user-email")
	public UserInfo findId(String uiPhoneNumber){
		log.info("userInfo=>{}",userService.findId(uiPhoneNumber));
		return userService.findId(uiPhoneNumber);
	}
	
	//비밀번호 이메일로 인증받기..
	@PostMapping("/checkPwd")
	public int mailCheck(@RequestBody UserInfo userInfo) {
		log.info("userInfo=>{}", userInfo); 
		return userService.mailCheck(userInfo);
	}
	
	//이메일 중복확인..
	@GetMapping("/emailCheck")
	public int emailCheck(String uiEmail) {
		log.info("uiEmail=>{}", userService.emailCheck(uiEmail)); 
		return userService.emailCheck(uiEmail);
		}
	}

