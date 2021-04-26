package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.artbeans.web.dto.Search;
import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionInfoRepository extends JpaRepository<ExhibitionInfo, Integer> {

	public List<ExhibitionInfo> findAllByOrderByEiStatus(Pageable pageable);

	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("select exhInfo from ExhibitionInfo exhInfo")
	public List<ExhibitionInfo> findAllByOrderByEiStartDateDesc();

	public List<ExhibitionInfo> findAllByEiNameLikeOrderByEiNum(String eiName);

	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	public List<ExhibitionInfo> findAllByEiBanner(Integer eiBanner);

	public List<ExhibitionInfo> findAllByEiNum(Integer eiNum);

	public List<ExhibitionInfo> findAllByUserInfoUiNum(Integer uiNum);

	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("select exhInfo from ExhibitionInfo exhInfo")
	public Page<ExhibitionInfo> findAllByEiStatus(String eiStatus, Pageable pageable);

	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("select exhInfo from ExhibitionInfo exhInfo")
	public Page<ExhibitionInfo> findAllByOrderByEiNum(Pageable pageable);

	// 심태윤- 전시회예약정보 인서트시 보여줄 전시회리스트
	public List<ExhibitionInfo> findAllByUserInfoUiNumAndReservationInfoIsNull(Integer uiNum);

	// admin banner update
	@Transactional
	@Modifying
	@Query(value = "UPDATE exhibition_info set ei_banner =:eiBanner where ei_num = :eiNum", nativeQuery = true)
	public void updateExhibitionInfoEiBanner(@Param("eiBanner") Integer eiBanner, @Param("eiNum") Integer eiNum);

	// admin-ei-update
	@Transactional
	@Modifying
	@Query(value = "UPDATE exhibition_info\n" + " SET ei_status =:eiStatus,\n" + " gi_num =:giNum,\n"
			+ " ei_name =:eiName,\n" + " ei_artist =:eiArtist,\n" + " ei_charge =:eiCharge,\n"
			+ " ei_start_date =:eiStartDate,\n" + " ei_end_date =:eiEndDate,\n" + " ei_start_time =:eiStartTime,\n"
			+ " ei_end_time =:eiEndTime,\n" + " ei_content =:eiContent,\n" + " ui_num =:uiNum\n"
			+ " WHERE ei_num =:eiNum", nativeQuery = true)
	public void updateExhibitionInfoWithoutFile(@Param("eiStatus") Integer eiStatus, @Param("giNum") Integer giNum,
			@Param("eiName") String eiName, @Param("eiArtist") String eiArtist, @Param("eiCharge") Integer eiCharge,
			@Param("eiStartDate") String eiStartDate, @Param("eiEndDate") String eiEndDate,
			@Param("eiStartTime") String eiStartTime, @Param("eiEndTime") String eiEndTime,
			@Param("eiContent") String eiContent, @Param("uiNum") Integer uiNum, @Param("eiNum") Integer eiNum);

	// admin-ei 검색바
	public Page<ExhibitionInfo> findAllByEiNameLike(String eiName, Pageable pageable);
	public Page<ExhibitionInfo> findAllByEiArtistLike(String eiArtist, Pageable pageable);
	public Page<ExhibitionInfo> findAllByEiStatusLike(String eiStatus, Pageable pageable);

	// admin-banner
	public Page<ExhibitionInfo> findAllByEiBanner(Integer eiBanner, Pageable pageable);
	
	// calendar-list
	@Query(value = "SELECT * FROM exhibition_info WHERE YEAR(ei_start_date) =:year AND MONTH(ei_start_date) = :month order by ei_num", nativeQuery = true)
	public Page<ExhibitionInfo> getOpeningCalendarList(@Param("year") String year, @Param("month") String month,
			Pageable pageable);

	// calendar-list-oneday
	@Query(value = "SELECT * FROM exhibition_info WHERE ei_start_date=:eiStartDate", nativeQuery = true)
	public Page<ExhibitionInfo> getOpeningCalendarList(@Param("eiStartDate") String eiStartDate, Pageable pageable);

	// 진행중
	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiStartDate <= current_date AND ei.eiEndDate >= current_date")
	public Page<ExhibitionInfo> getOpeningList(String eiStatus, Pageable pageable);
	
	// 진행중 무료
	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiCharge = ?2 AND ei.eiStartDate <= current_date AND ei.eiEndDate >= current_date")
	public Page<ExhibitionInfo> getOpeningListGetFree(String eiStatus, Integer eiCharge, Pageable pageable);
	
	// 진행중 무료 아닌 것
	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiCharge > ?2 AND ei.eiStartDate <= current_date AND ei.eiEndDate >= current_date")
	public Page<ExhibitionInfo> getOpeningPriceList(String eiStatus, Integer eiCharge, Pageable pageable);

	// 종료
	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiEndDate < current_date")
	public Page<ExhibitionInfo> getCloseList(String eiStatus, Pageable pageable);

	// 진행할
	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiStartDate > current_date")
	public Page<ExhibitionInfo> getFutureList(String eiStatus, Pageable pageable);
	
	// 진행할 무료
	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiCharge =?2 AND ei.eiStartDate > current_date")
	public Page<ExhibitionInfo> getFutureListGetFree(String eiStatus, Integer eiCharge, Pageable pageable);
	
	//진행할 무료 아닌 것
	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiCharge > ?2 AND ei.eiStartDate > current_date")
	public Page<ExhibitionInfo> getFuturePriceList(String eiStatus, Integer eiCharge, Pageable pageable);
	
	//주소
//	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
//	public Page<ExhibitionInfo> findAllByGalleryInfoGiAddressLike(String giAddress, Pageable pageable);
	
	//진행 주소
	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiStartDate <= current_date AND ei.eiEndDate >= current_date AND ei.galleryInfo.giAddress Like ?2")
	public Page<ExhibitionInfo> getExhibitionOpenAddr(String eiStatus, String giAddress,  Pageable pageable);
	
	//종료주소
	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiEndDate < current_date AND ei.galleryInfo.giAddress Like ?2")
	public Page<ExhibitionInfo> getExhibitionCloseAddr(String eiStatus, String giAddress,  Pageable pageable);
	
	//진행할 주소
	@EntityGraph(attributePaths = {"fileInfo","reservationInfo","galleryInfo","galleryInfo.fileInfo","userInfo"})
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiStartDate > current_date AND ei.galleryInfo.giAddress Like ?2")
	public Page<ExhibitionInfo> getExhibitionFutureAddr(String eiStatus, String giAddress,  Pageable pageable);

}
