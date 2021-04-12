package com.artbeans.web.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.entity.UserInfo;

import lombok.Data;

@Data
public class PaymentVo {
	
	private String rtiName;
	
	private String rtiEmail;
	
	private String rtiPhoneNumber;
	
	private Integer rtiNumber;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date rtiDate;
	
	private String rtiTime;
	
	private String piMethod;
	
	private Integer piPrice;
	
	private ExhibitionReservationInfo exhibitionReservationInfo;

	private UserInfo userInfo;
	
}
