package com.amuldanzi.service;

import java.util.List;


import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketDTO;
import com.amuldanzi.domain.NoticeDTO;

public interface AdminContentService {

	List<MarketDTO> getMarketList();

	List<ClinicDTO> getClinicList();

	List<CareDTO> getCareList();

	List<EducationDTO> getEduList();

	List<NoticeDTO> getNoticeList();

	List getListByCateId(Integer cateId);
	

}
