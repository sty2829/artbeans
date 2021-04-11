package com.artbeans.web.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;
import lombok.ToString;

@Data
@Entity
@Table(name="reservation_ticket_info")
public class ReservationTicketInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="rti_num")
	private Integer rtiNum;
	
	@Column(name="rti_name")
	private String rtiName;
	
	@Column(name="rti_email")
	private String rtiEmail;
	
	@Column(name="rti_phone_number")
	private String rtiPhoneNumber;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="rti_date")
	private Date rtiDate;
	
	//Time 스트링 수정
	@Column(name="rti_time")
	private String rtiTime;
	
	@Column(name="rti_Number")
	private Integer rtiNumber;
	
	@Column(name="rti_status", insertable = false)
	@ColumnDefault("PENDING")
	private String rtiStatus;
	
	@Column(name="rti_reivew_status", insertable = false)
	@ColumnDefault("0")
	private String rtiReivewStatus;
	
	@ManyToOne
	@JoinColumn(name = "ui_num")
	private UserInfo userInfo;
	
	@ManyToOne
	@JoinColumn(name = "eri_num")
	private ExhibitionReservationInfo exhibitionReservationInfo;
	

}
