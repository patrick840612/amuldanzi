package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketDTO;
import com.amuldanzi.domain.NoticeDTO;
import com.amuldanzi.persistence.CareRepository;
import com.amuldanzi.persistence.ClinicRepository;
import com.amuldanzi.persistence.EducationRepository;
import com.amuldanzi.persistence.MarketRepository;
import com.amuldanzi.persistence.NoticeRepository;

@Service("adminContnetService")
public class AdminContentServiceImpl implements AdminContentService {
	
	@Autowired
	CareRepository careRepo;
	
	@Autowired
	ClinicRepository clinicRepo;
	
	@Autowired
	EducationRepository eduRepo;
	
	@Autowired
	MarketRepository marketRepo;
	
	@Autowired
	NoticeRepository noticeRepo;

	@Override
	public List<MarketDTO> getMarketList() {
		// TODO Auto-generated method stub
		return (List<MarketDTO>)marketRepo.findAll();
	}

	@Override
	public List<ClinicDTO> getClinicList() {
		// TODO Auto-generated method stub
		return (List<ClinicDTO>)clinicRepo.findAll();
	}

	@Override
	public List<CareDTO> getCareList() {
		// TODO Auto-generated method stub
		return (List<CareDTO>)careRepo.findAll();
	}

	@Override
	public List<EducationDTO> getEduList() {
		// TODO Auto-generated method stub
		return (List<EducationDTO>)eduRepo.findAll();
	}

	@Override
	public List<NoticeDTO> getNoticeList() {
		// TODO Auto-generated method stub
		return (List<NoticeDTO>)noticeRepo.findAll();
	}

	@Override
	public List getListByCateId(Integer cateId) {
		
		List list = null;
		
		if(cateId==0) {
			list = (List)noticeRepo.findAll();
		}else if(cateId == 1) {
			list = (List)clinicRepo.findAll();
		}else if(cateId == 2){
			list = (List)eduRepo.findAll();
		}else if(cateId == 3) {
			list = (List)careRepo.findAll();
		}else if(cateId == 4) {
			list = (List)marketRepo.findAll();
		}
		
		return list;
	}
	
	
	
	

}
