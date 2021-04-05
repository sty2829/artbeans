package com.artbeans.web.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;

import lombok.Data;

@Data
@Entity
@Table(name = "ticket_cancel_info")
public class TicketCancelInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="tci_num")
	private Integer tciNum;
	
	@Column(name="tci_reason")
	private String tciReason;
	
	@Column(name="tci_depositor")
	private String tciDepositor;
	
	@Column(name="tci_price")
	private Integer tciPrice;
	
	@Column(name="tci_date", insertable = false, updatable = false)
	@ColumnDefault("now()")
	private Date tciDate;
	
	@OneToOne
	@JoinColumn(name = "rti_num")
	private ReservationTicketInfo reservationTicketInfo;
}