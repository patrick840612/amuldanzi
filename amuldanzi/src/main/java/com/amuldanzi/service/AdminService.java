package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.AdvertisementDTO;
import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketDTO;
import com.amuldanzi.domain.NoticeDTO;

public interface AdminService {

	List<MarketDTO> getMarketList();

	List<ClinicDTO> getClinicList();

	List<CareDTO> getCareList();

	List<EducationDTO> getEduList();

	List<NoticeDTO> getNoticeList();

	List getListByCateId(Integer cateId);
	
	List<AdvertisementDTO> getAdList();	
	
	void careSave(CareDTO dto);	
	
	void eduSave(EducationDTO dto);	

	void noticeSave(NoticeDTO dto);
	
	void adSave(AdvertisementDTO dto);

	void noticeDelete(NoticeDTO dto);

	void eduDelete(EducationDTO dto);

	void careDelete(CareDTO dto);

	NoticeDTO getNotice(NoticeDTO dto);
	

}
