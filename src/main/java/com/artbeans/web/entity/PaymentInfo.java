package com.artbeans.web.entity;

import java.util.Date;

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
@Table(name="payment_info")
public class PaymentInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="pi_num")
	private Integer piNum;
	
	@Column(name="pi_kind")
	private String piKind;
	
	@Column(name="pi_price")
	private Integer piPrice;
	
	@Column(name="pi_depositor")
	private Integer piDepositor;
	
	@Column(name="pi_date", insertable = false, updatable = false)
	@ColumnDefault("now()")
	private Date piDate;
	
	@Column(name="pi_status")
	private String piStatus;

	@OneToOne
	@JoinColumn(name = "rti_num")
	private ReservationTicketInfo reservationTicketInfo;
	

}
