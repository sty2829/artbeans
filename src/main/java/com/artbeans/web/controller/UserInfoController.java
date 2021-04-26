package com.artbeans.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.UserInfo;
import com.artbeans.web.repository.UserInfoRepository;
import com.artbeans.web.service.UserService;
import com.artbeans.web.util.CodeGenerator;

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
	
	@Autowired
	private static final String FROM_ADDRESS = "psh951009@gmail.com";
	
	private UserInfo userInfo;
	
	
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

	
//	@GetMapping("/sendEmail")
//	public String findEmail(@RequestBody String uiEmail) {
//		log.info("userInfo=>{}", uiEmail);
//		String code = CodeGenerator.getRandomCode();
//		return code;
//	}
	

	//이메일 중복확인..
	@GetMapping("/emailCheck")
	public int emailCheck(String uiEmail) {
		log.info("uiEmail=>{}", userService.emailCheck(uiEmail)); 
		return userService.emailCheck(uiEmail);
		}
	
	@GetMapping("/checkPwd")
	public String authEmail(String uiEmail,String code) throws Exception {

		if (userService.pwdCheck(uiEmail) == null) {
			code = CodeGenerator.getRandomCode();
			log.info("uiEmail=>{}", userService.pwdCheck(uiEmail));
			userInfo = userService.saveUser(userInfo);
			String title = "아트빈 비밀번호 인증메일입니다.";
			String content = "인증번호는 " + code + "입니다." + "<br><br>" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			SimpleMailMessage smm = new SimpleMailMessage();

			smm.setTo(uiEmail);
			smm.setFrom(FROM_ADDRESS);
			smm.setSubject(title);
			smm.setText(content);

			mailSender.send(smm);
			log.info("smm=>{}", smm);
			log.info("code=>{}", code);
		}
		return code;
	}

}
