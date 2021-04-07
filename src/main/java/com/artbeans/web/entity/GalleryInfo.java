package com.artbeans.web.entity;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Data;

@Data
@Entity
@Table(name = "gallery_info")
@DynamicUpdate
public class GalleryInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "gi_num")
	private Integer giNum;
	
	@Column(name = "gi_name")
	private String giName;
	
	@Column(name = "gi_rphone_number")
	private String giRphoneNumber;
	
	//Time 스트링 수정
	@Column(name = "gi_start_time")
	private String giStartTime;
	
	//Time 스트링 수정
	@Column(name = "gi_end_time")
	private String giEndTime;
	
	@Column(name = "gi_homepage")
	private String giHomepage;
	
	@Column(name = "gi_holiday")
	private String giHoliday;
	
	@Column(name = "gi_address")
	private String giAddress;
	
	@Column(name = "gi_address_x")
	private String giAddressX;
	
	@Column(name = "gi_address_y")
	private String giAddressY;
	
	@Column(name = "gi_status", insertable = false)
	private String giStatus;
	
	@Column(name="credat", insertable = false, updatable = false)
	@ColumnDefault("now()")
	private Date credat;
	
	@Column(name="moddat", insertable = false)
	@ColumnDefault("now()")
	private Date moddat;
	
	@OneToOne(cascade = CascadeType.ALL, optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "fi_num")
	private FileInfo fileInfo;

}
