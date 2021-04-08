package com.artbeans.web.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

@Data
@Entity
@Table(name="exhibition_reservation_info")
public class ExhibitionReservationInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="eri_num")
	private Integer eriNum;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="eri_start_date")
	private Date eriStartDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
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
	private Integer eriMaxStock;
	
	@Column(name="eri_audience_rating")
	private String eriAudienceRating;
	
	@Column(name="eri_running_time")
	private String eriRunningTime;
	
	@OneToMany(mappedBy = "exhibitionReservationInfo")
	@JsonManagedReference
	private List<ReservationTicketInfo> rtiList;
	
	@OneToOne
	@JoinColumn(name= "ei_num")
	private ExhibitionInfo exhibitionInfo;
	
}
