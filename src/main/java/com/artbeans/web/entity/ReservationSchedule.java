package com.artbeans.web.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.artbeans.web.dto.SumTicketTime;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
@Component
public class ReservationSchedule {
	
	private static final String YYYY_MM_DD = "yyyy-MM-dd";
	
	private String imgPath;
	
	private String exhibitionName;

	private String period;
	
	private String audienceRating;
	
	private String runningTime;
	
	private String minDate;
	
	private String maxDate;
	
	private Integer charge;
	
	private Integer maxTicket;
	
	private List<String> disable;

	public ReservationSchedule(){
		
	}
	
	public ReservationSchedule(String imgPath, String exhibitionName, String period, String audienceRating,
			String runningTime, String minDate, String maxDate, Integer charge, Integer maxTicket,
			List<String> disable) {
		this.imgPath = imgPath;
		this.exhibitionName = exhibitionName;
		this.period = period;
		this.audienceRating = audienceRating;
		this.runningTime = runningTime;
		this.minDate = minDate;
		this.maxDate = maxDate;
		this.charge = charge;
		this.maxTicket = maxTicket;
		this.disable = disable;
	}
	
	
	
	public ReservationSchedule createSchedule(ExhibitionReservationInfo eri, List<Date> excludeDateList) {
		Date eriStartDate = eri.getEriStartDate();
		Date eriEndDate = eri.getEriEndDate();
		int eriHoliday = eri.getEriHoliday();
		

		//휴무일 제외리스트에 추가
		List<Date> excludeDateAndHolidayList = disableHoliday(excludeDateList, eriStartDate, eriEndDate, eriHoliday);
		
		//minDate시작날짜 선정
		String minDate = minDateSelect(excludeDateAndHolidayList, eriStartDate);
		
		//제외리스트 스트링포맷리스트 변환
		List<String> disable = disableDateFormat(excludeDateAndHolidayList);
		
		
		String imgPath = eri.getExhibitionInfo().getFileInfo().getFiPath();
		String exhibitionName = eri.getExhibitionInfo().getEiName();
		//시작날짜 변환
		String startDate = dateToString(eriStartDate);
		//종료날짜 변환
		String endDate = dateToString(eriEndDate);
		String period = startDate + " ~ " + endDate;
		String audienceRating = eri.getEriAudienceRating();
		String runningTime = eri.getEriRunningTime();
		Integer charge = eri.getExhibitionInfo().getEiCharge();
		Integer maxTicket = eri.getEriMaxTicket();
		
		ReservationSchedule reservationSchedule = new ReservationSchedule(imgPath, exhibitionName, period, audienceRating, runningTime, minDate, endDate, charge, maxTicket, disable);
		
		return reservationSchedule;
		
	}
	
	public List<Date> disableHoliday(List<Date> excludeDateList, Date eriStartDate, Date eriEndDate, int eriHoliday) {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY_MM_DD");
		//시작날짜
		Calendar start = Calendar.getInstance();
		start.setTime(eriStartDate);
		//종료날짜
	    Calendar end = Calendar.getInstance();
	    end.setTime(eriEndDate);
	    //시작날짜부터 종료날짜까지 휴무일을 제외리스트에 추가
	    while (!start.after(end)) {
	        int day = start.get(Calendar.DAY_OF_WEEK);
	        //해당날짜가 휴무일이라면 제외리스트 추가
	        if(day == eriHoliday) {
	        	excludeDateList.add(start.getTime());
	        }
	        //날짜 하루 ++ 
	        start.add(Calendar.DATE, 1);
	    }
	    //반환
	    return excludeDateList;
	}
	
	public String minDateSelect(List<Date> excludeDateAndHolidayList, Date minDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		List<Date> formatDateList = new ArrayList<>();
		
		for(Date d : excludeDateAndHolidayList) {
			String format = sdf.format(d);
			try {
				Date parseDate = sdf.parse(format);
				formatDateList.add(parseDate);
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		log.info("formatDateList => {} ", formatDateList);
		
		//투데이 생성
		Date date = new Date();
		String format = sdf.format(date);
		try {
			date = sdf.parse(format);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//투데이가 스타트date(mindate)보다 크다면 mindate에 투데이 입력 
		if(date.compareTo(minDate) > 0) {
			minDate = date;
		}
		
		//기간 휴무일 + MAX티켓 제외리스트 합친걸 날짜순으로 정렬
		excludeDateAndHolidayList.sort(new Comparator<Date>() {
				@Override
				public int compare(Date o1, Date o2) {
					return o1.compareTo(o2);
				}
			});
		
		//date 하루 추가위해 캘린더생성
		Calendar cal = Calendar.getInstance();
		//캘린더에 mindate 세팅
		cal.setTime(minDate);
		log.info("excludeDateAndHolidayList => {}", excludeDateAndHolidayList);
		//mindate랑 제외리스트를 비교하면서 mindate 선정   
		for(Date d : excludeDateAndHolidayList) {
			minDate = cal.getTime();
			log.info("d =>{}", d);
			if(d.compareTo(minDate) > 0) {
				//제외날짜가 mindate보다 크면 for문 나감
				log.info("minDate =>{}", minDate);
				break;
			}else if(d.compareTo(minDate) == 0){
				//mindate가 제외날짜와 같다면 하루 추가
				cal.add(Calendar.DATE, 1);
				log.info("minDate =>{}", minDate);
			}
		}
		
		//minDate 스트링 포맷 변환
		return sdf.format(minDate); 
	}

	public List<String> disableDateFormat(List<Date> excludeDateList) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//제외리스트 스트링으로 포맷변환 리스트 생성
		List<String> disableList = new ArrayList<>();
		
		//제외리스트 스트링으로 포맷변환
		for(Date date : excludeDateList) {
			String format = sdf.format(date);
			disableList.add(format);
		}
		
		//스트링포맷데이트리스트 반환
		return disableList;
	}
	
	
	public String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(YYYY_MM_DD);
		return sdf.format(date);
	}
	
	public Date StringToDate(String dateStr) {
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
	
	
	public long dayMaximumTicket(ExhibitionReservationInfo eri) {
		//종료시간 앞2자리만 가져옴
		String eriEndTime = eri.getEriEndTime().substring(0,2);
		//시작시간 앞2자리만 가져옴
		String eriStartTime = eri.getEriStartTime().substring(0,2);
		//간격 계산위해 종료시간 인트로 변환
		int eriEndTimeInt = Integer.parseInt(eriEndTime);
		//간격 계산위해 시작시간 인트로 변환
		int eriStartTimeInt = Integer.parseInt(eriStartTime);
		//시간당 최대티켓수 가져오기
		int eriMaxStock = eri.getEriMaxStock();
		//(시간당최대티켓 * (종료시간 - 시작시간))
		long max = (eriMaxStock * (eriEndTimeInt - eriStartTimeInt));
		
		return max;
	}

	public Map<String,Integer> reservationTimeList(ExhibitionReservationInfo eri, List<SumTicketTime> sttList) {
		//시간대별 최대 티켓수 
		Integer maxStock = eri.getEriMaxStock();
		String startTime = eri.getEriStartTime();
		String endTime = eri.getEriEndTime();
		int startTimeInt = Integer.parseInt(startTime.substring(0,2));
		int endTimeInt = Integer.parseInt(endTime.substring(0,2));
		int length = endTimeInt - startTimeInt;
		
		Map<String,Integer> timeMap = new HashMap<>();
		
		for(SumTicketTime stt : sttList) {
			int sum = stt.getSum().intValue();
			timeMap.put(stt.getTime(), maxStock-sum);
		}
		
		for(int i=0; i<length; i++) {
			String time = startTimeInt + ":00";
			if(time.length() != 5) {
				time = "0"+time;
			}
			
			if(!timeMap.containsKey(time)) {
				timeMap.put(time, maxStock);
			}
			startTimeInt++;
		}
		
		log.info("timeMap => {}",timeMap);
		
		return timeMap;
	}
	
}
