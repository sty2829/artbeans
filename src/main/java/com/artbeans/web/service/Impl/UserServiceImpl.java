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
	private JavaMailSender mailSender;
	
	@Autowired
	private static final String FROM_ADDRESS = "psh951009@gmail.com";
	
	@Autowired
	private UserInfoRepository uRepo;

	private UserInfo userInfo;
	
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
	    return uRepo.saveAndFlush(ui);
	}

	@Override
	public int deleteUser(Integer uiNum) {
		return 0;
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
		if(opUi.getCode()==null) {
			String code = CodeGenerator.getRandomCode();
			
		}
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

//	@Override
//	public int pwdCheck(UserInfo userInfo) {
//		UserInfo opUi = uRepo.findByUiEmail(userInfo.getUiEmail());
//		if(opUi!=null) {
//			return 1;
//		}
//		return 0;
//	}
//
	public UserInfo saveCode(String code) {
		return uRepo.save(userInfo);
	}

	@Override
	public int mailCheck(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
