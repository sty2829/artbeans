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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

@Data
@Entity
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
	
	@Column(name = "ei_start_date")
	private Date eiStartDate;
	
	@Column(name = "ei_end_date")
	private Date eiEndDate;
	
	@Column(name = "ei_start_time")
	private Time eiStartTime;
	
	@Column(name = "ei_end_time")
	private Time eiEndTime;
	
	@Column(name = "ei_status", insertable = false)
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
		
	@OneToOne
	@JoinColumn(name = "fi_num")
	private FileInfo fileInfo;
	
	@OneToOne(mappedBy = "exhibitionInfo")
	@JsonManagedReference
	private ExhibitionReservationInfo exhibitionReservationInfo;

}
