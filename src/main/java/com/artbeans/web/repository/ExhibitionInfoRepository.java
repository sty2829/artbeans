package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionInfoRepository extends JpaRepository<ExhibitionInfo, Integer> {
	
	public List<ExhibitionInfo> findAllByOrderByEiStatus(Pageable pageable);
	public List<ExhibitionInfo> findAllByOrderByEiStartDateDesc();
	public List<ExhibitionInfo> findAllByEiNameLikeOrderByEiNum(String eiName);
	public List<ExhibitionInfo> findAllByEiBanner(Integer eiBanner);
	public List<ExhibitionInfo> findAllByEiNum(Integer eiNum);
	
	public Page<ExhibitionInfo> findAllByEiStatus(String eiStatus, Pageable pageable);
	public Page<ExhibitionInfo> findAllByOrderByEiNum(Pageable pageable);
	
	public Page<ExhibitionInfo> findAllByGalleryInfoGiAddressLike(String giAddress, Pageable pageable);
	
	//심태윤- 전시회예약정보 인서트시 보여줄 전시회리스트
	public List<ExhibitionInfo> findAllByUserInfoUiNumAndReservationInfoIsNull(Integer uiNum);
 
	// admin banner update
	@Transactional
	@Modifying
	@Query(value = "UPDATE exhibition_info set ei_banner =:eiBanner where ei_num = :eiNum",
	            nativeQuery = true)
	public void updateExhibitionInfoEiBanner(@Param("eiBanner") Integer eiBanner, @Param("eiNum") Integer eiNum);
	
	// admin-ei-update
	@Transactional
	@Modifying
	@Query(value = "UPDATE exhibition_info\n"
			+ " SET ei_status =:eiStatus,\n"
			+ " gi_num =:giNum,\n"
			+ " ei_name =:eiName,\n"
			+ " ei_artist =:eiArtist,\n"
			+ " ei_charge =:eiCharge,\n"
			+ " ei_start_date =:eiStartDate,\n"
			+ " ei_end_date =:eiEndDate,\n"
			+ " ei_start_time =:eiStartTime,\n"
			+ " ei_end_time =:eiEndTime,\n"
			+ " ei_content =:eiContent,\n"
			+ " ui_num =:uiNum\n"
			+ " WHERE ei_num =:eiNum",
	            nativeQuery = true)
	public void updateExhibitionInfoWithoutFile(@Param("eiStatus") Integer eiStatus, @Param("giNum") Integer giNum, @Param("eiName") String eiName, @Param("eiArtist") String eiArtist, @Param("eiCharge") Integer eiCharge, @Param("eiStartDate") String eiStartDate, @Param("eiEndDate") String eiEndDate, @Param("eiStartTime") String eiStartTime, @Param("eiEndTime") String eiEndTime, @Param("eiContent") String eiContent, @Param("uiNum") Integer uiNum, @Param("eiNum") Integer eiNum);
	
	
	// calendar-list 
	@Query(value = "SELECT * FROM exhibition_info WHERE YEAR(ei_start_date) =:year AND MONTH(ei_start_date) = :month order by ei_num",nativeQuery = true)
	public Page<ExhibitionInfo> getOpeningCalendarList(@Param("year") String year, @Param("month") String month, Pageable pageable);
	// calendar-list-oneday
	@Query(value = "SELECT * FROM exhibition_info WHERE ei_start_date=:eiStartDate",nativeQuery = true)
	public Page<ExhibitionInfo> getOpeningCalendarList(@Param("eiStartDate") String eiStartDate, Pageable pageable);
	
	//진행중
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiStartDate <= current_date AND ei.eiEndDate >= current_date")
	public Page<ExhibitionInfo> getOpeningList(String eiStatus, Pageable pageable);
	
	//종료
    @Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiEndDate < current_date")
	public Page<ExhibitionInfo> getCloseList(String eiStatus, Pageable pageable);
		
	//진행할
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiStartDate > current_date")
	public Page<ExhibitionInfo> getFutureList(String eiStatus, Pageable pageable);
	
}
