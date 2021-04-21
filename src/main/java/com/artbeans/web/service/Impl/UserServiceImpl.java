package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

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
	
	@Autowired
	private TicketInfoRepository rtiRepo;
	
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
	public List<UserTicketDTO> getTicketList(Integer uiNum) {
		return rtiRepo.findAllUserTicket(uiNum);
	}

	@Override
	public UserInfo findId(String uiPhoneNumber) {
		UserInfo opUi = uRepo.findByUiPhoneNumber(uiPhoneNumber);
		return opUi;
	}
	//비밀번호 이메일 인증..
	@Override
	public int mailCheck(UserInfo userInfo) {
		UserInfo opUi = uRepo.findByUiEmail(userInfo.getUiEmail());
		if(opUi != null) {
			creatMail(opUi);
			return 1;
		}
		return 0;
	}
	
//	@Override
//	public String pwdCheck(UserInfo userInfo) {
//		UserInfo opUi = uRepo.findByUiEmail(userInfo.getUiEmail());
//		if(opUi !=null) {
//			SimpleMailMessage smm;
//			smm.setText(CodeGenerator.getRandomCode());
//			return smm;
//		}
//		return null;
//	}
	//이메일 중복 조회..
	@Override
	public int emailCheck(String uiEmail) {
		UserInfo opUi = uRepo.findByUiEmail(uiEmail);
		if(opUi == null) {
			return 0;
		}
		return 1;
	}
	

	
	public void creatMail(UserInfo userInfo) {
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setTo(userInfo.getUiEmail());
		smm.setFrom(FROM_ADDRESS);
		smm.setText(CodeGenerator.getRandomCode());
	}

}
