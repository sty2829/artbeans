package com.artbeans.web.controller;

import java.util.List;
import java.util.Random;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.ReviewInfo;
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
	
	//	@GetMapping("/user-table")
	//	public DataTable<UserInfo> getLists(Pageable pageable ,DataTable<UserInfo> dt){
	//		log.info("pageable=>{}",pageable);
	//		Page<UserInfo> pb = UserInfoRepository.findAll(pageable);
	//		dt.setData(pb.getContent());
	//		dt.setRecordsTotal(pb.getTotalElements());
	//		dt.setRecordsFiltered(pb.getTotalElements());
	//		log.info("dt=>{}",dt);
	//		return dt;
	//}

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
	
	//비밀번호 이메일 인증하기
	@GetMapping("/mailCheck")
	public @ResponseBody String mailCheckGET(String uiEmail) throws Exception{
		
		//비밀번호 찾기페이지로부터 넘어온 데이터 확인
		log.info("이메일 데이터 전송 확인");
		log.info("인증 이메일 : " +  uiEmail);
		
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
			log.info("인증번호 : " + checkNum );
		
		//이메일 보내기	
		String setFrom = "psh951009@gmail.com";
		String toMail = uiEmail;
		String title = "비밀번호 인증 이메일입니다.";
		String content = "아트빈을 방문해주셔서 감사합니다." +
						"<br><br>" +
						"인증 번호는 " + checkNum + "입니다." +
						"<br>" +
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
//		try {
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
//			helper.setFrom(setFrom);
//			helper.setTo(toMail);
//			helper.setSubject(title);
//			helper.setText(content,true);
//			mailSender.send(message);
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		  String num = Integer.toString(checkNum); //인증번호 확인페이지로 전송
		  return num;
	}
	
	public static void main(String[] args) {
		String str = "010234556789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		Random r = new Random();
		for(int i=1;i<=6;i++) {
			int rNum = r.nextInt(str.length());
			char c = str.charAt(rNum);
			System.out.println(c);
			log.info("인증번호 : " + c);
		}
	}
}
