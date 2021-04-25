package com.artbeans.web.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

@Data
@Entity
@Table(name="ticket_info")
public class TicketInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ti_num")
	private Integer tiNum;
	
	@Column(name="ti_name")
	private String tiName;
	
	@Column(name="ti_email")
	private String tiEmail;
	
	@Column(name="ti_phone_number")
	private String tiPhoneNumber;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="ti_date")
	private Date tiDate;
	
	//Time 스트링 수정
	@Column(name="ti_time")
	private String tiTime;
	
	@Column(name="ti_Number")
	private Integer tiNumber;
	
	@Column(name="ti_state")
	@Convert(converter = StatusConverter.class)
	@ColumnDefault(value = "PENDING")
	private String tiState;
	
	@Column(name="ti_reivew_status", insertable = false)
	@ColumnDefault("0")
	private String tiReivewStatus;
	
	@ManyToOne
	@JoinColumn(name = "ui_num")
	private UserInfo userInfo;
	
	@ManyToOne
	@JoinColumn(name = "ri_num")
	private ReservationInfo reservationInfo;
	
	@OneToOne(mappedBy = "ticketInfo", cascade = CascadeType.ALL, optional = false)
	@JsonManagedReference
	private PaymentInfo paymentInfo;
	
}
