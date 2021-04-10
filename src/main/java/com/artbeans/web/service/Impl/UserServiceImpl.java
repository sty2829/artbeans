package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.entity.UserInfo;
import com.artbeans.web.repository.UserInfoRepository;
import com.artbeans.web.service.UserService;

@Service
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
		return uRepo.save(ui);
	}

	@Override
	public int deleteUser(Integer uiNum) {
		return 0;
	}

	@Override
	public UserInfo login(UserInfo ui) {
		return uRepo.findByUiEmailAndUiPwd(ui.getUiEmail(), ui.getUiPwd());
	}

}
