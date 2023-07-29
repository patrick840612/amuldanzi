package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.AdvertisementDTO;
import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.CommerceDTO;
import com.amuldanzi.domain.CommunityDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketInfoDTO;
import com.amuldanzi.domain.NoticeDTO;

public interface AdminService {

	List<MarketInfoDTO> getMarketList();

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

	NoticeDTO getNoticeById(NoticeDTO dto);

	void adDelete(AdvertisementDTO dto);

	void adUpdate(AdvertisementDTO dto);	

	AdvertisementDTO getAdById(AdvertisementDTO dto);

	EducationDTO getEduById(EducationDTO dto);

	CareDTO getCareById(CareDTO dto);

	void careUpdate(CareDTO dto);

	void eduUpdate(EducationDTO dto);

	void noticeUpdate(NoticeDTO dto);

	void deleteImage(Integer cateId, String imageName);

	void deleteVideo(Integer cateId, String videoPath);

	void commerceSave(CommerceDTO dto);

	List<CommerceDTO> getCommerceList();

	void commerceDelete(CommerceDTO dto);

	void commerceUpdate(CommerceDTO dto);

	CommerceDTO getCommerceById(CommerceDTO dto);

	List<CommunityDTO> getCommunityList();

	

}
