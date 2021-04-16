package com.artbeans.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.UserInfo;
import com.artbeans.web.repository.UserInfoRepository;
import com.artbeans.web.service.UserService;
import com.artbeans.web.dto.DataTable;
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
	public @ResponseBody Integer update(@RequestBody UserInfo userInfo) {
		userInfo = userService.updateUser(userInfo);
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

}
