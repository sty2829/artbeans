package com.artbeans.web.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;
import lombok.ToString;

@Data
@Entity
@ToString(exclude = "ticketInfo")
@Table(name="payment_info")
public class PaymentInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="pi_num")
	private Integer piNum;
	
	@Column(name="pi_method")
	private String piMethod;
	
	@Column(name="pi_price")
	private Integer piPrice;
	
	@Column(name ="pi_merchant_id")
	private String piMerchantId;
	
	@Column(name="pi_date", insertable = false, updatable = false)
	@ColumnDefault("now()")
	private Date piDate;
	
	@Column(name="pi_state", insertable = false)
	@Convert(converter = StatusConverter.class)
	@ColumnDefault("PENDING")
	private String piState;

	@OneToOne
	@JoinColumn(name = "ti_num")
	@JsonBackReference
	private TicketInfo ticketInfo;
	

}
