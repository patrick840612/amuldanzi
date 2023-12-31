package com.amuldanzi.service;

import java.util.List;
import java.util.Map;

import com.amuldanzi.domain.AdvertisementDTO;
import com.amuldanzi.domain.BusinessDTO;
import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.CommerceDTO;
import com.amuldanzi.domain.CommerceScheduleDTO;
import com.amuldanzi.domain.CommunityDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketInfoDTO;
import com.amuldanzi.domain.NoticeDTO;
import com.amuldanzi.domain.QnaDTO;
import com.amuldanzi.domain.SitterDTO;

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

	List<Map<String, Object>> getCommunityListByBlamedId();

	void blamedDeleteByCommNo(Integer commNo);

	void commDeleteByCommNo(Integer commNo);

	void imgDeleteByCommNO(Integer commNo);

	List<String> getCommImagesByNo(Integer commNo);

	CommunityDTO getCommunityByNo(Integer commNo);

	List<QnaDTO> getQnaList();

	List<BusinessDTO> getBusinessList();

	List<SitterDTO> getSitterList();

	void sitterUpdate(SitterDTO dto);

	void businessUpdate(BusinessDTO dto);

	void commerceScheduleSave(CommerceScheduleDTO dto);

	List<CommerceScheduleDTO> commerceScheduleList();

	void scheduleDeleteById(CommerceScheduleDTO dto);

	void scheduleUpdate(CommerceScheduleDTO dto);

	QnaDTO qnaDetailById(QnaDTO dto);

	void qnaDetailAnswer(QnaDTO dto);

}
