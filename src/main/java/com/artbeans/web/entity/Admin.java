package com.artbeans.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "admin")
public class Admin {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="ad_num")
	private Integer adNum;
	
	@Column(name="ad_name")
	private String adName;
	
	@Column(name="ad_id")
	private String adId;
	
	@Column(name="ad_pwd")
	private String adPwd;
	
	@Column(name="ad_phone")
	private String adPhone;
}
