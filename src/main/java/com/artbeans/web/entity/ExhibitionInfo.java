package com.artbeans.web.entity;



import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;
import lombok.ToString;

@Data
@Entity
@ToString(exclude = {"galleryInfo","reservationInfo"})
@Table(name = "exhibition_info")
@DynamicUpdate
public class ExhibitionInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ei_num")
	private Integer eiNum;
	
	@Column(name = "ei_name")
	private String eiName;
	
	@Column(name = "ei_charge")
	private Integer eiCharge;
	
	@Column(name = "ei_artist")
	private String eiArtist;
	
	@Column(name = "ei_content")
	private String eiContent;
	
	@Column(name = "ei_banner",insertable = false)
	@ColumnDefault("0")
	private Integer eiBanner;
	
	//패턴 수정 날짜 이상하게들어감 java.sql.date 로 변경
	@Column(name = "ei_start_date")
	private Date eiStartDate;
	
	//패턴 수정 날짜 이상하게들어감 java.sql.date 로 변경
	@Column(name = "ei_end_date")
	private Date eiEndDate;
	
	//Time 스트링 수정
	@Column(name = "ei_start_time")
	private String eiStartTime;
	
	//Time 스트링 수정
	@Column(name = "ei_end_time")
	private String eiEndTime;
	
	@Column(name = "ei_status", insertable = false)
	@Convert(converter = StatusConverter.class)
	@ColumnDefault(value = "PENDING")
	private String eiStatus;
	
	@Column(name="credat", insertable = false, updatable = false)
	@ColumnDefault("now()")
	private Date credat;
	
	@Column(name="moddat", insertable = false)
	@ColumnDefault("now()")
	private Date moddat;
	
	@ManyToOne
	@JoinColumn(name = "gi_num")
	private GalleryInfo galleryInfo;
		
	//파일인서트 추가
	@OneToOne(cascade = CascadeType.ALL, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "fi_num")
	private FileInfo fileInfo;
	
	//uiNum 묶여있어서 추가요
	@ManyToOne
	@JoinColumn(name = "ui_num")
	private UserInfo userInfo;
	
	//양방향설정
	@OneToOne(mappedBy = "exhibitionInfo")
	@JsonBackReference
	private ReservationInfo reservationInfo;

}
