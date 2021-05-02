package com.artbeans.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.UserInfo;
import com.artbeans.web.service.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class UserInfoController {


	@Autowired
	private UserService userService;


	@PostMapping("/user")
	public int insert(@RequestBody UserInfo userInfo) {
		log.info("UserInfo => {}", userInfo);
		userInfo = userService.saveUser(userInfo);
		return userInfo.getUiNum();

	}

	@GetMapping("/users")
	public List<UserInfo> getList(@RequestBody UserInfo userInfo) {
		return userService.getList(userInfo);
	}

	@GetMapping("/user")
	public UserInfo getUser(@RequestParam Integer uiNum) {
		log.info("uiNum=>{}", userService.getUser(uiNum));
		return userService.getUser(uiNum);
	}

	@PostMapping("/login")
	public UserInfo login(@RequestBody UserInfo userInfo, HttpServletRequest req) {
		UserInfo user = userService.login(userInfo);
		log.info("user=>{}", user);
		log.info("user.uiStatus=>{}", user.getUiStatus());
		if(user.getUiStatus().equals("1")) {
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
		UserInfo userInfo = userService.saveUser(ui);
		return userInfo.getUiNum();
	}

	// id찾기..
	@PostMapping("/user-email")
	public UserInfo findId(String uiPhoneNumber) {
		UserInfo user = userService.findId(uiPhoneNumber);
		if(user.getUiStatus().equals("0")) {
			return null;
		}
		return user;
	}
	

	// 이메일 중복확인..
	@GetMapping("/emailCheck")
	public int emailCheck(String uiEmail) {
		return userService.emailCheck(uiEmail);
	}
	//인증번호 받기 위한 이메일 찾기..
	@PostMapping("/checkPwd")
	public String authEmail(@RequestBody UserInfo ui) {
		log.info("ui=>{}", userService.right(ui));
		return userService.right(ui);
	}

	// 인증번호 일치여부 확인..
	@GetMapping("/verificationCode")
	public UserInfo verify(String code) {
		return userService.findCode(code);
	}

	// 새 비밀번호 변경
	@PostMapping("/changePwd")
	public int change(@RequestBody UserInfo userInfo) {
		return userService.cPwd(userInfo);
	}

	@PostMapping("/dropOut")
	public int dropOut(@RequestBody UserInfo userInfo) {
		return userService.deleteUser(userInfo);
	}
}