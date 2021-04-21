package com.artbeans.web.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.entity.Admin;
import com.artbeans.web.repository.AdminRepository;
import com.artbeans.web.repository.UserInfoRepository;
import com.artbeans.web.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository adminRepo;
	
	@Override
	public Admin login(Admin admin) {
		return adminRepo.findByAdIdAndAdPwd(admin.getAdId(), admin.getAdPwd());
	}

}
