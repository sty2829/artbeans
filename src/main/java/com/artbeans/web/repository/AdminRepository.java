package com.artbeans.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer> {
	
	public Admin findByAdIdAndAdPwd(String adId, String adPwd);
}
