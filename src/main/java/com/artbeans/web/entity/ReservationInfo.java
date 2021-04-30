package com.artbeans.web.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedNativeQuery;
import javax.persistence.OneToOne;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

@Data
@Entity
@NamedNativeQuery(
		name = "find_reservation_schedule_dto",
		query = "SELECT \r\n"
				+ "fi.fi_path imgPath, ei.ei_name exhibitionName, \r\n"
				+ "CONCAT(DATE_FORMAT(ri.ri_start_date, '%Y-%m-%d'), ' ~ ' , DATE_FORMAT(ri.ri_end_date, '%Y-%m-%d')) period,\r\n"
				+ "ri.ri_audience_rating audienceRating,\r\n"
				+ "DATE_FORMAT(ri.ri_start_date, '%Y-%m-%d') minDate,\r\n"
				+ "DATE_FORMAT(ri.ri_end_date, '%Y-%m-%d') maxDate,\r\n"
				+ "ei.ei_charge charge, ri.ri_max_ticket maxTicket, ri.ri_num riNum, \r\n"
				+ "case ri.ri_holiday\r\n"
				+ "when 1 then '일요일' when 2 then '월요일' when 3 then '화요일'\r\n"
				+ "when 4 then '수요일' when 5 then '목요일' when 6 then '금요일' \r\n"
				+ "when 7 then '토요일' END AS holiday,\r\n"
				+ "concat(IFNULL(holiday(ri.ri_start_date, ri.ri_end_date, ri.ri_holiday), ''),\r\n"
				+ "IFNULL((SELECT IFNULL(CONCAT(',', GROUP_CONCAT(distinct ti.ti_date)), null) FROM exhibition_info ei \r\n"
				+ "inner JOIN reservation_info ri ON ei.ei_num = ri.ei_num \r\n"
				+ "inner JOIN ticket_info ti ON ri.ri_num = ti.ri_num WHERE ei.ei_num = 33 AND ti.ti_date \r\n"
				+ "IN(SELECT ti_date FROM (\r\n"
				+ "SELECT ti.ti_date, ri.ri_max_stock * (ri.ri_end_time - ri.ri_start_time) max FROM exhibition_info ei \r\n"
				+ "inner JOIN reservation_info ri ON ei.ei_num = ri.ei_num \r\n"
				+ "inner JOIN ticket_info ti ON ri.ri_num = ti.ri_num WHERE ei.ei_num = 33 GROUP BY ti_date HAVING SUM(ti_number) >= max) a)), '')) disable\r\n"
				+ "FROM exhibition_info ei \r\n"
				+ "inner JOIN gallery_info gi ON ei.gi_num = gi.gi_num\r\n"
				+ "inner JOIN file_info fi ON ei.fi_num = fi.fi_num\r\n"
				+ "inner JOIN reservation_info ri ON ei.ei_num = ri.ei_num \r\n"
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
						@ColumnResult(name = "holiday", type = String.class),
						@ColumnResult(name = "minDate", type = String.class),
						@ColumnResult(name = "maxDate", type = String.class),
						@ColumnResult(name = "charge", type = Integer.class),
						@ColumnResult(name = "maxTicket", type = Integer.class),
						@ColumnResult(name = "riNum", type = Integer.class),
						@ColumnResult(name = "disable", type = String.class)
				})
)

@NamedNativeQuery(
		name = "find_reservation_time_dto",
		query = "WITH recursive cte AS (\r\n"
				+ "SELECT 0 AS rnum\r\n"
				+ "UNION ALL\r\n"
				+ "SELECT \r\n"
				+ "rnum + 1 \r\n"
				+ "FROM cte\r\n"
				+ "WHERE rnum < \r\n"
				+ "(\r\n"
				+ "SELECT ((CAST(substring(ri_end_time, 1, 2) AS UNSIGNED) - CAST(substring(ri_start_time, 1, 2) AS UNSIGNED))) -1 \r\n"
				+ "FROM reservation_info WHERE ri_num = :riNum\r\n"
				+ ")\r\n"
				+ ")\r\n"
				+ "SELECT\r\n"
				+ "if(LENGTH(\r\n"
				+ "CONCAT(\r\n"
				+ "(\r\n"
				+ "SELECT cast(substring(ri_start_time, 1, 2) AS UNSIGNED)\r\n"
				+ "FROM reservation_info WHERE ri_num = :riNum\r\n"
				+ ") + rnum, ':00')) < 5, CONCAT('0',\r\n"
				+ "(\r\n"
				+ "SELECT cast(substring(ri_start_time, 1, 2) AS UNSIGNED)\r\n"
				+ "FROM reservation_info WHERE ri_num = :riNum\r\n"
				+ ") + rnum, ':00'), CONCAT(\r\n"
				+ "(\r\n"
				+ "SELECT cast(substring(ri_start_time, 1, 2) AS UNSIGNED)\r\n"
				+ "FROM reservation_info WHERE ri_num = :riNum\r\n"
				+ ") + rnum, ':00')) AS riTime,\r\n"
				+ "IFNULL( \r\n"
				+ "(\r\n"
				+ "SELECT ri_max_stock FROM reservation_info WHERE ri_num = :riNum\r\n"
				+ ")\r\n"
				+ "-\r\n"
				+ "(\r\n"
				+ "SELECT SUM(ti.ti_number) as sum\r\n"
				+ "FROM ticket_info ti LEFT JOIN reservation_info ri \r\n"
				+ "on ti.ri_num = ri.ri_num where ti.ri_num = :riNum\r\n"
				+ "AND ti.ti_date = :targetDate GROUP BY ti.ti_time HAVING ti.ti_time = riTime\r\n"
				+ "), \r\n"
				+ "(\r\n"
				+ "SELECT ri_max_stock FROM reservation_info WHERE ri_num = :riNum\r\n"
				+ ")\r\n"
				+ ") riTicket\r\n"
				+ "FROM cte",
				resultSetMapping = "reservation_time_dto"
		)
@SqlResultSetMapping(
		name = "reservation_time_dto",
		classes = @ConstructorResult(
				targetClass = com.artbeans.web.dto.ReservationTimeDTO.class,
				columns = {
						@ColumnResult(name = "riTime", type = String.class),
						@ColumnResult(name = "riTicket", type = Integer.class)
						
				}
		)
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
	
	@Column(name="ri_holiday")
	private int riHoliday;
	
	@OneToOne
	@JoinColumn(name= "ei_num")
	@JsonManagedReference
	private ExhibitionInfo exhibitionInfo;
	
}
