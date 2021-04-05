package com.artbeans.web.entity;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Data;

@Data
@Entity
@Table(name="reservation_ticket_info")
@DynamicUpdate
public class ReservationTicketInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="rti_num")
	private Integer rtiNum;
	
	@Column(name="rti_name")
	private String rtiName;
	
	@Column(name="rti_email")
	private String rtiEmail;
	
	@Column(name="rti_phone_nubmer")
	private String rtiPhoneNubmer;
	
	@Column(name="rti_date")
	private Date rtiDate;
	
	@Column(name="rti_time")
	private Time rtiTime;
	
	@Column(name="rti_amount")
	private Integer rtiAmount;
	
	@Column(name="rti_status", insertable = false)
	@ColumnDefault("PENDING")
	private String rtiStatus;
	
	@Column(name="rti_reivew_status", insertable = false)
	@ColumnDefault("0")
	private String rtiReivewStatus;
	
	@ManyToOne
	@JoinColumn(name = "ui_num")
	private UserInfo user_info;
	
	@ManyToOne
	@JoinColumn(name = "eri_num")
	private ExhibitionReservationInfo exhibitionReservationInfo;
	

}
