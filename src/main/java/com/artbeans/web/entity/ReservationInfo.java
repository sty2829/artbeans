package com.artbeans.web.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedNativeQuery;
import javax.persistence.OneToOne;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;
import lombok.ToString;

@Data
@Entity
@ToString(exclude = "exhibitionInfo")
@NamedNativeQuery(
		name = "find_reservation_schedule_dto",
		query = "SELECT \r\n"
				+ "fi.fi_path imgPath, ei.ei_name exhibitionName, \r\n"
				+ "CONCAT(DATE_FORMAT(ri.ri_start_date, '%Y-%m-%d'), ' ~ ' , DATE_FORMAT(ri.ri_end_date, '%Y-%m-%d')) period,\r\n"
				+ "ri.ri_audience_rating audienceRating,\r\n"
				+ "ri.ri_running_time runningTime,\r\n"
				+ "DATE_FORMAT(ri.ri_start_date, '%Y-%m-%d') minDate,\r\n"
				+ "DATE_FORMAT(ri.ri_end_date, '%Y-%m-%d') maxDate,\r\n"
				+ "ei.ei_charge charge,\r\n"
				+ "ri.ri_max_ticket maxTicket,\r\n"
				+ "ri.ri_num riNum,\r\n"
				+ "gi.gi_address_x x,\r\n"
				+ "gi.gi_address_y y,\r\n"
				+ "concat(IFNULL(holiday(ri.ri_start_date, ri.ri_end_date, ri.ri_holiday), ''),\r\n"
				+ "IFNULL((SELECT IFNULL(CONCAT(',', GROUP_CONCAT(distinct ti.ti_date)), null) FROM exhibition_info ei \r\n"
				+ "LEFT JOIN reservation_info ri ON ei.ei_num = ri.ei_num \r\n"
				+ "LEFT JOIN ticket_info ti ON ri.ri_num = ti.ri_num WHERE ei.ei_num = :eiNum AND ti.ti_date \r\n"
				+ "IN(SELECT ti_date FROM (\r\n"
				+ "SELECT ti.ti_date, ri.ri_max_stock * (ri.ri_end_time - ri.ri_start_time) max FROM exhibition_info ei \r\n"
				+ "LEFT JOIN reservation_info ri ON ei.ei_num = ri.ei_num \r\n"
				+ "LEFT JOIN ticket_info ti ON ri.ri_num = ti.ri_num WHERE ei.ei_num = :eiNum GROUP BY ti_date HAVING SUM(ti_number) >= max) a)), '')) disable\r\n"
				+ "FROM exhibition_info ei \r\n"
				+ "LEFT JOIN gallery_info gi ON ei.gi_num = gi.gi_num\r\n"
				+ "LEFT JOIN file_info fi ON ei.fi_num = fi.fi_num\r\n"
				+ "LEFT JOIN reservation_info ri ON ei.ei_num = ri.ei_num \r\n"
				+ "WHERE ei.ei_num = :eiNum",
		resultSetMapping = "reservation_schedule_dto" 		
)
@SqlResultSetMapping(
		name = "reservation_schedule_dto",
		classes = @ConstructorResult(
				targetClass = com.artbeans.web.dto.ReservationSchedule.class,
				columns = {
						@ColumnResult(name = "imgPath", type = String.class),
						@ColumnResult(name = "exhibitionName", type = String.class),
						@ColumnResult(name = "period", type = String.class),
						@ColumnResult(name = "audienceRating", type = String.class),
						@ColumnResult(name = "runningTime", type = String.class),
						@ColumnResult(name = "minDate", type = String.class),
						@ColumnResult(name = "maxDate", type = String.class),
						@ColumnResult(name = "charge", type = Integer.class),
						@ColumnResult(name = "maxTicket", type = Integer.class),
						@ColumnResult(name = "riNum", type = Integer.class),
						@ColumnResult(name = "disable", type = String.class),
						@ColumnResult(name = "x", type = String.class),
						@ColumnResult(name = "y", type = String.class)
				})
)

@Table(name="reservation_info")
public class ReservationInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ri_num")
	private Integer riNum;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="ri_start_date")
	private Date riStartDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="ri_end_date")
	private Date riEndDate;
	
	//Time 스트링 수정
	@Column(name="ri_start_time")
	private String riStartTime;
	
	//Time 스트링 수정
	@Column(name="ri_end_time")
	private String riEndTime;
	
	@Column(name="ri_max_ticket")
	private Integer riMaxTicket;
	
	@Column(name="ri_max_stock")
	private Integer riMaxStock;
	
	@Column(name="ri_audience_rating")
	private String riAudienceRating;
	
	@Column(name="ri_running_time")
	private String riRunningTime;
	
	@Column(name="ri_holiday")
	private int riHoliday;
	
	@OneToOne
	@JoinColumn(name= "ei_num")
	@JsonBackReference
	private ExhibitionInfo exhibitionInfo;
	
	
	
}