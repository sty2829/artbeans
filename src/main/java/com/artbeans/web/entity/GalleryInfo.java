package com.artbeans.web.entity;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	
	@Column(name = "gi_rphone_nubmer")
	private String giRphoneNubmer;
	
	@Column(name = "gi_start_time")
	private Time giStartTime;
	
	@Column(name = "gi_end_time")
	private Time giEndTime;
	
	@Column(name = "gi_hompage")
	private String giHompage;
	
	@Column(name = "gi_holiday")
	private String gi_Holiday;
	
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
	
	@OneToOne
	@JoinColumn(name = "fi_num")
	private FileInfo fileInfo;

}
