package com.artbeans.web.entity;

import java.sql.Time;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;

@Data
@Entity
@Table(name="exhibition_reservation_info")
public class ExhibitionReservationInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="eri_num")
	private Integer eriNum;
	
	@Column(name="eri_start_date")
	private Date eriStartDate;
	
	@Column(name="eri_end_date")
	private Date eriEndDate;
	
	//Time 스트링 수정
	@Column(name="eri_start_time")
	private String eriStartTime;
	
	//Time 스트링 수정
	@Column(name="eri_end_time")
	private String eriEndTime;
	
	@Column(name="eri_max_ticket")
	private Integer eriMaxTicket;
	
	@Column(name="eri_max_stock")
	private Integer eriMaxstock;
	
	@Column(name="eri_audience_rating")
	private String eriAudienceRating;
	
	@Column(name="eri_running_time")
	private String eriRunningTime;
	
	@OneToOne
	@JoinColumn(name= "ei_num")
	@JsonBackReference
	private ExhibitionInfo exhibitionInfo;
	
}
