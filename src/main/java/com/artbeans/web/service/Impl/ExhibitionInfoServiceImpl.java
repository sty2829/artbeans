package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.dto.Search;
import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.FileInfo;
import com.artbeans.web.repository.ExhibitionInfoRepository;
import com.artbeans.web.repository.FileInfoRepository;
import com.artbeans.web.service.ExhibitionService;
import com.artbeans.web.util.FileConverter;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ExhibitionInfoServiceImpl implements ExhibitionService {

	private static final String TYPE = "exhibition";
	@Autowired
	private FileInfoRepository fileRepo;
	@Autowired
	private ExhibitionInfoRepository exhiRepo;
 
	@Override
	public List<ExhibitionInfo> getExhibitionInfos(ExhibitionInfo exhibitionInfo) {
		if(exhibitionInfo != null) {
			if(exhibitionInfo.getEiBanner() != null) {
				return exhiRepo.findAllByEiBanner(exhibitionInfo.getEiBanner());
			}else if(exhibitionInfo.getEiName() != null) {
				return exhiRepo.findAllByEiNameLikeOrderByEiNum("%" + exhibitionInfo.getEiName() + "%");
			}else if(exhibitionInfo.getEiNum() != null) {
				return exhiRepo.findAllByEiNum(exhibitionInfo.getEiNum());
			}
			
		}
		return exhiRepo.findAll();
	}
	
	
	//사용중 (상혁)
	@Override
	public Page<ExhibitionInfo> getExhibitionInfos(Search search, Pageable pageable) {
		if(search != null) {
			if(search.getStatus().equals("CONFIRM")) {
				if(search.getDate().equals("OPENIG")) {
                    if(search.getPrice() != null) {
                    	if(search.getPrice() == 0) {
                    		return exhiRepo.getOpeningListGetFree(search.getStatus(),search.getPrice(), pageable);                    		
                    	} else if(search.getPrice() == 1){
                    		return exhiRepo.getOpeningPriceList(search.getStatus(),search.getPrice(), pageable);
                    	}
					}else {
						return exhiRepo.getOpeningList(search.getStatus(), pageable);
					}
				}else if(search.getDate().equals("FUTURE")) {
					if(search.getPrice() != null) {
						if(search.getPrice() == 0) {
							return exhiRepo.getFutureListGetFree(search.getStatus(),search.getPrice(), pageable);
						}else if(search.getPrice() == 1) {
							return exhiRepo.getFuturePriceList(search.getStatus(),search.getPrice(), pageable);							
						}                    	
					}else {
						return exhiRepo.getFutureList(search.getStatus(), pageable);
					}					
				}else if(search.getDate().equals("CLOSE")) {
				    return exhiRepo.getCloseList(search.getStatus(), pageable);					
			    }
					
			}
		}		
		return null;
	}
	
	// 사용중 (상혁)
	@Override
	public Page<ExhibitionInfo> getExhiAddrList(String giAddress, Search search, Pageable pageable) {
		if(search != null) {
			if(search.getStatus().equals("CONFIRM")) {
				if(search.getDate().equals("OPENIG")) {
					return exhiRepo.getExhibitionOpenAddr(search.getStatus(), giAddress + "%", pageable);
				}else if(search.getDate().equals("FUTURE")) {
					return exhiRepo.getExhibitionFutureAddr(search.getStatus(), giAddress + "%", pageable);
				}else if(search.getDate().equals("CLOSE")) {					
					return exhiRepo.getExhibitionCloseAddr(search.getStatus(), giAddress + "%", pageable);
				}				
			}				
		}				
		return null;
	}
		
		
	//     /exhibitions?status=CONFIRM&state=CLOSE&
	//     for (var exhibition of res.content)
	
	
//	// getExhibitionInfoLists 변경 진행중
//		@Override
//		public DataTable<ExhibitionInfo> getOpeningList(String eiStatus, Pageable pageable,
//				DataTable<ExhibitionInfo> dtExhibitionInfo) {
//			Page<ExhibitionInfo> pb = exhiRepo.getOpeningList("1", pageable);
//			dtExhibitionInfo.setData(pb.getContent());
//			dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
//			dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
//			return dtExhibitionInfo;
//		}
//		
//		//진행중 무료
//		@Override
//		public DataTable<ExhibitionInfo> getOpeningListGetFree(String eiStatus, Integer eiCharge, Pageable pageable,
//				DataTable<ExhibitionInfo> dtExhibitionInfo) {
//			Page<ExhibitionInfo> pb = exhiRepo.getOpeningListGetFree("1",0, pageable);
//			dtExhibitionInfo.setData(pb.getContent());
//			dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
//			dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
//			return dtExhibitionInfo;
//		}
//
//		// getExhibitionInfoLists 변경 종료
//		@Override
//		public DataTable<ExhibitionInfo> getCloseList(String eiStatus, Pageable pageable,
//				DataTable<ExhibitionInfo> dtExhibitionInfo) {
//			Page<ExhibitionInfo> pb = exhiRepo.getCloseList("1", pageable);
//			dtExhibitionInfo.setData(pb.getContent());
//			dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
//			dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
//			return dtExhibitionInfo;
//		}
//
//		// getExhibitionInfoLists 변경 진행할
//		@Override
//		public DataTable<ExhibitionInfo> getFutureList(String eiStatus, Pageable pageable,
//				DataTable<ExhibitionInfo> dtExhibitionInfo) {
//			Page<ExhibitionInfo> pb = exhiRepo.getFutureList("1", pageable);
//			dtExhibitionInfo.setData(pb.getContent());
//			dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
//			dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
//			return dtExhibitionInfo;
//		}	
//		
//		//진행할 무료
//		@Override
//		public DataTable<ExhibitionInfo> getFutureListGetFree(String eiStatus, Integer eiCharge, Pageable pageable,
//				DataTable<ExhibitionInfo> dtExhibitionInfo) {
//			Page<ExhibitionInfo> pb = exhiRepo.getFutureListGetFree("1",0, pageable);
//			dtExhibitionInfo.setData(pb.getContent());
//			dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
//			dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
//			return dtExhibitionInfo;
//		}
		
		
//	//진행
//	if(search.getEiStatus().equals("CONFIRM") && search.getState().equals("OPENIG")) {
//		return exhiRepo.getOpeningList(search.getState(), pageable);
//	}else if(search.getEiStatus().equals("CONFIRM") && search.getState().equals("OPENIG") && search.getEiCharge() != null) {
//		return exhiRepo.getOpeningListGetFree(search.getEiStatus(),search.getEiCharge(), pageable);
//	}
//	
//	//종료
//	if(search.getEiStatus().equals("CONFIRM") && search.getState().equals("CLOSE")) {
//		return exhiRepo.getCloseList(search.getEiStatus(), pageable);
//	}else if(search.getEiStatus().equals("CONFIRM") && search.getState().equals("CLOSE") && search.getEiCharge() != null) {
//		return exhiRepo.getOpeningListGetFree(search.getEiStatus(),search.getEiCharge(), pageable);
//	}
//	
//	//진행 할
//	if(search.getEiStatus().equals("CONFIRM") && search.getState().equals("FUTURE")) {
//		return exhiRepo.getCloseList(search.getEiStatus(), pageable);
//	}else if(search.getEiStatus().equals("CONFIRM") && search.getState().equals("FUTURE") && search.getEiCharge() != null) {
//		return exhiRepo.getOpeningListGetFree(search.getEiStatus(),search.getEiCharge(), pageable);
//	}


	
	
//	// 변경. 지울것
//	@Override
//	public DataTable<ExhibitionInfo> getExhibitionInfoLists(Pageable pageable,
//			DataTable<ExhibitionInfo> dtExhibitionInfo) {
//		// 1 은 관리자수락 상태
//		Page<ExhibitionInfo> pb = exhiRepo.findAllByEiStatus("1", pageable);
//		dtExhibitionInfo.setData(pb.getContent());
//		dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
//		dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
//		return dtExhibitionInfo;
//	}

	// 나중에 지울 것
//	@Override
//	public DataTable<ExhibitionInfo> getExhiListDemo(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo) {
//		Page<ExhibitionInfo> pb = exhiRepo.findAll(pageable);
//		dtExhibitionInfo.setData(pb.getContent());
//		dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
//		dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
//		return dtExhibitionInfo;
//	}//
	
	
	

	@Override
	public ExhibitionInfo getExhibitionInfo(Integer eiNum) {
		Optional<ExhibitionInfo> opEt = exhiRepo.findById(eiNum);
		if (opEt.isEmpty())
			return null;
		return opEt.get();
	}

	@Override
	public ExhibitionInfo saveExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception {
		FileConverter.fileInsert(exhibitionInfo.getFileInfo(), TYPE);
		return exhiRepo.save(exhibitionInfo);
	}

	@Override
	@Transactional
	public ExhibitionInfo updateExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception {// file 유무 확인해서 조건문 작성할것
		log.info("exhibitionInfo>{}", exhibitionInfo);
		FileInfo fi = exhibitionInfo.getFileInfo();
		if (fi.getFiFile() == null) {
			fi = fileRepo.findById(fi.getFiNum()).get();
			exhibitionInfo.setFileInfo(fi);
			log.info("fi =>  {}", fi);
			return exhiRepo.saveAndFlush(exhibitionInfo);
		}
		// log.info("fiNum=>{}",exhibitionInfo.getFileInfo().getFiNum());
		FileConverter.fileInsert(exhibitionInfo.getFileInfo(), TYPE);
		if (fi.getFiNum() != null && fileRepo.findById(fi.getFiNum()).get() != null) {
			fileRepo.saveAndFlush(fi);
		}
		return exhiRepo.saveAndFlush(exhibitionInfo);
	}

	@Override
	public int deleteExhibitionInfo(Integer eiNum) {
		exhiRepo.deleteById(eiNum);
		if (getExhibitionInfo(eiNum) == null)
			return 1;
		return 0;
	}
	
	//해당유저의 전시회리스트를 불러온다.
	@Override
	public List<ExhibitionInfo> getExhibitionFindByUiNum(UserSession userSession) {
		if(userSession != null && userSession.getUiNum() != null) {
			List<ExhibitionInfo> eiList = exhiRepo.findAllByUserInfoUiNumAndReservationInfoIsNull(userSession.getUiNum());
			if(!eiList.isEmpty()) {
				return eiList;
			}
		}
		return null;
	}

	

	// admin 배너 허가를 위한 업데이트
	@Override
	public void updateExhibitionInfoEiBanner(ExhibitionInfo exhibitionInfo) throws Exception {
		log.info("exhibitionInfo123=>{}", exhibitionInfo);
		exhiRepo.updateExhibitionInfoEiBanner(exhibitionInfo.getEiBanner(), exhibitionInfo.getEiNum());
	}

	// admin pagenation
	@Override
	public Page<ExhibitionInfo> getBeforeConfirmLists(Pageable pageable) {
		return exhiRepo.findAllByOrderByEiNum(pageable);
	}
	
	//calendar-list
	@Override
	public DataTable<ExhibitionInfo> getOpeningCalendarList(String year, String month, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo) {
		Page<ExhibitionInfo> pb = exhiRepo.getOpeningCalendarList(year,month, pageable);
		dtExhibitionInfo.setData(pb.getContent());
		dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
		dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
		return dtExhibitionInfo;
	}
	
	//calendar-list-oneday
	@Override
	public DataTable<ExhibitionInfo> getOpeningCalendarListOneday(String eiStartDate, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo) {
		Page<ExhibitionInfo> pb = exhiRepo.getOpeningCalendarList(eiStartDate, pageable);
		dtExhibitionInfo.setData(pb.getContent());
		dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
		dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
		return dtExhibitionInfo;
	}
	
	//admin-ei 검색바
	@Override
	public Page<ExhibitionInfo> findAllByEiNameLike(String eiName,Pageable pageable) {
		return exhiRepo.findAllByEiNameLike("%"+eiName+"%",pageable);
	}
	
	//admin-ei 검색바
	@Override
	public Page<ExhibitionInfo> findAllByEiArtistLike(String EiArtist, Pageable pageable) {
		return exhiRepo.findAllByEiArtistLike("%"+EiArtist+"%",pageable);
	}

	//admin-ei 검색바
	@Override
	public Page<ExhibitionInfo> findAllByEiStatusLike(String EiStatus, Pageable pageable) {
		Page<ExhibitionInfo> pageCheck= exhiRepo.findAllByEiStatusLike("%"+EiStatus+"%",pageable);
		return pageCheck;
	}

	//admin-ei-update
	@Override
	public void updateExhibitionInfoWithoutFile(Integer eiStatus, Integer giNum, String eiName, String eiArtist,
			Integer eiCharge, String eiStartDate, String eiEndDate, String eiStartTime, String eiEndTime,
			String eiContent, Integer uiNum, Integer eiNum) {
		exhiRepo.updateExhibitionInfoWithoutFile(eiStatus, giNum, eiName, eiArtist, eiCharge, eiStartDate, eiEndDate, eiStartTime, eiEndTime, eiContent, uiNum, eiNum);
	}

	@Override
	public List<ExhibitionInfo> eiUpdateGetExhibitionInfo(Integer uiNum) {
	
		return exhiRepo.findAllByUserInfoUiNum(uiNum);
	}
	
	//admin-banner
	@Override
	public Page<ExhibitionInfo> findAllByEiBanner(Integer eiBanner, Pageable pageable) {
		return exhiRepo.findAllByEiBanner(eiBanner, pageable);
	}

	
}
