package com.artbeans.web.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.service.MailService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class MailController {
	@Autowired
	private MailService mailService;
	
	@Autowired
	private JavaMailSender mailSender;

	@PostMapping("/mail")
	public Integer sendMail(@RequestBody SimpleMailMessage smm) {
		log.info("smm=>{}",smm);
		mailService.mailSend(smm);
		return 1;
	}
	
	//@GetMapping("/mailCheck")
	public void mailCheckGET(String uiEmail) throws Exception{
		
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + uiEmail);
		
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
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
						
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
