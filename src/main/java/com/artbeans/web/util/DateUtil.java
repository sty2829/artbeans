package com.artbeans.web.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.dto.SumTicketTime;
import com.artbeans.web.dto.ReservationTimeDTO;
import com.artbeans.web.entity.ReservationInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DateUtil {

	private static final String YYYY_MM_DD = "yyyy-MM-dd";
	
	
	public static ReservationSchedule getMinDate(ReservationSchedule rs) {
		SimpleDateFormat sdf = new SimpleDateFormat(YYYY_MM_DD);

		List<String> disableList = Arrays.asList(rs.getDisable().split(","));
		
		rs.setDisableList(disableList);
		
		List<Date> dateList = new ArrayList<>();
		
		for(String dateStr : disableList) {
			try {
				Date parseDate = sdf.parse(dateStr);
				dateList.add(parseDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		//투데이 생성
		Date date = new Date();
		String format = sdf.format(date);
		try {
			date = sdf.parse(format);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Date minDate = StringToDate(rs.getMinDate());
		
		//투데이가 스타트date(mindate)보다 크다면 mindate에 투데이 입력 
		if(date.compareTo(minDate) > 0) {
			minDate = date;
		}
		
		//기간 휴무일 + MAX티켓 제외리스트 합친걸 날짜순으로 정렬
		dateList.sort(new Comparator<Date>() {
				@Override
				public int compare(Date o1, Date o2) {
					return o1.compareTo(o2);
				}
			});
		
		//date 하루 추가위해 캘린더생성
		Calendar cal = Calendar.getInstance();
		//캘린더에 mindate 세팅
		cal.setTime(minDate);
		
		//mindate랑 제외리스트를 비교하면서 mindate 선정   
		for(Date d : dateList) {
			if(d.compareTo(minDate) > 0) {
				//제외날짜가 mindate보다 크면 for문 나감
				break;
			}else if(d.compareTo(minDate) == 0){
				//mindate가 제외날짜와 같다면 하루 추가
				cal.add(Calendar.DATE, 1);
				minDate = cal.getTime();
			}
		}
		
		
		rs.setMinDate(dateToString(minDate));
		
	    return rs;
	}
	
	public static List<ReservationTimeDTO> setDisableTime(List<ReservationTimeDTO> rtList, String dateStr) {
		LocalDate today = LocalDate.now();
		LocalDate targetDate = LocalDate.parse(dateStr, DateTimeFormatter.ISO_DATE);
		int hour = LocalTime.now().getHour();
		for(ReservationTimeDTO rt : rtList) {
			if(today.equals(targetDate)) {
				int targetHour = Integer.parseInt(rt.getTime().substring(0,2));
				if(hour >= targetHour) {
					rt.setDisableTime(true);
					continue;
				}
			}
			rt.setDisableTime(false);
		}
		
		return rtList;
	}
	
	
	public static String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(YYYY_MM_DD);
		return sdf.format(date);
	}
	
	public static Date StringToDate(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat(YYYY_MM_DD);
		Date date;
		try {
			date = sdf.parse(dateStr);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
