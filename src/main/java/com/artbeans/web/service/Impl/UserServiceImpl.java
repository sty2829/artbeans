package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.UserInfo;
import com.artbeans.web.repository.TicketInfoRepository;
import com.artbeans.web.repository.UserInfoRepository;
import com.artbeans.web.service.UserService;
import com.artbeans.web.util.CodeGenerator;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserInfoRepository uRepo;
	
	@Override
	public List<UserInfo> getList(UserInfo userInfo) {
		return uRepo.findAll();
	}

	@Override
	public UserInfo getUser(Integer uiNum) {
		Optional<UserInfo> opUi = uRepo.findById(uiNum);
		return opUi.get();
	}

	@Override
	public UserInfo saveUser(UserInfo ui) {
		return uRepo.save(ui);
	}

	@Override
	public UserInfo updateUser(UserInfo ui) {	
	Optional<UserInfo> opUi = uRepo.findById(ui.getUiNum());  
	if(!opUi.isEmpty()) {
		log.info("test=>{}",uRepo.saveAndFlush(ui));
		return uRepo.saveAndFlush(ui);
	}
	    return null;
	}

	@Override
	public UserInfo login(UserInfo ui) {
		return uRepo.findByUiEmailAndUiPwd(ui.getUiEmail(), ui.getUiPwd());
	}

	@Override
	public UserInfo findId(String uiPhoneNumber) {
		UserInfo opUi = uRepo.findByUiPhoneNumber(uiPhoneNumber);
		return opUi;
	}

	
	// 비밀번호 인증할 이메일 확인과정
	public UserInfo pwdCheck(String uiEmail) {
		UserInfo opUi = uRepo.findByUiEmail(uiEmail);
		log.info("opUi=>{}",opUi);
		return opUi;
	}

	//이메일 중복 조회..(회원가입)
	@Override
	public int emailCheck(String uiEmail) {
		UserInfo opUi = uRepo.findByUiEmail(uiEmail);
		if(opUi==null) {
			return 0;
		}
		return 1;
	}
	//인증번호 코드 삽입을 위한 해당 이메일 찾기
	@Override
	public UserInfo right(String uiEmail) {
		UserInfo opUi = uRepo.findByUiEmail(uiEmail);
		return opUi;
	}

	
	//인증번호 일치여부 확인
	@Override
	public UserInfo findCode(String code) {
		UserInfo opUi = uRepo.findByCode(code);
		log.info("opUi=>{}",opUi);
		return opUi;
	}


	@Override
	public int cPwd(UserInfo userInfo) {
		int cnt =0;
		Optional<UserInfo> opUi = uRepo.findById(userInfo.getUiNum());
		log.info("opUi=>{}",opUi);
		if(!opUi.isEmpty()) {
			String newPwd = userInfo.getUiPwd(); //패스워드 꺼내오기
			userInfo = opUi.get();
			userInfo.setUiPwd(newPwd);
			cnt = uRepo.save(userInfo).getUiNum(); //cnt가 pk를 가져옴
		}
		return cnt;
	}


	@Override
	public int deleteUser(UserInfo userInfo) {
		int cnt = 0;
		Optional<UserInfo> opUi = uRepo.findById(userInfo.getUiNum());
		log.info("opUi=>{}",opUi);
		if(!opUi.isEmpty()) {
			String byebye = userInfo.getUiDropOut(); 
			userInfo = opUi.get();
			userInfo.setUiDropOut(byebye);
			log.info("byebye=>{}",userInfo.getUiDropOut());
			cnt = uRepo.save(userInfo).getUiNum();
			uRepo.deleteById(userInfo.getUiNum());
		}
		return cnt;
	}

}
