package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.UserInfo;
import com.artbeans.web.repository.UserInfoRepository;

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
	private UserInfoRepository userInfoRepository;
	
	@PostMapping("/user")
	public int insert(@RequestBody UserInfo userInfo) {
		log.info("UserInfo => {}", userInfo);
		userInfoRepository.save(userInfo);
		return 1;
	}
	
	@GetMapping("/users")
	public List<UserInfo> getList(){
		return userInfoRepository.findAll();
	}
}
