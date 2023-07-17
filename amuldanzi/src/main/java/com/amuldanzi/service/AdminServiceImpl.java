package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.AdvertisementDTO;
import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketInfoDTO;
import com.amuldanzi.domain.NoticeDTO;
import com.amuldanzi.persistence.AdvertisementRepository;
import com.amuldanzi.persistence.CareRepository;
import com.amuldanzi.persistence.ClinicRepository;
import com.amuldanzi.persistence.EducationRepository;
import com.amuldanzi.persistence.MarketInfoRepository;
import com.amuldanzi.persistence.NoticeRepository;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	CareRepository careRepo;
	
	@Autowired
	ClinicRepository clinicRepo;
	
	@Autowired
	EducationRepository eduRepo;
	
	@Autowired
	MarketInfoRepository marketRepo;
	
	@Autowired
	NoticeRepository noticeRepo;
	
	@Autowired
	AdvertisementRepository adRepo;

	@Override
	public List<MarketInfoDTO> getMarketList() {
		// TODO Auto-generated method stub
		return (List<MarketInfoDTO>)marketRepo.findAll();
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

	@Override
	public List<AdvertisementDTO> getAdList() {
		// TODO Auto-generated method stub
		return (List<AdvertisementDTO>)adRepo.findAll();
	}


	@Override
	public void careSave(CareDTO dto) {
		// TODO Auto-generated method stub
		careRepo.save(dto);
	}

	@Override
	public void eduSave(EducationDTO dto) {
		// TODO Auto-generated method stub
		eduRepo.save(dto);
	}

	@Override
	public void noticeSave(NoticeDTO dto) {
		// TODO Auto-generated method stub
		noticeRepo.save(dto);
	}

	@Override
	public void adSave(AdvertisementDTO dto) {
		// TODO Auto-generated method stub
		adRepo.save(dto);
	}

	@Override
	public void noticeDelete(NoticeDTO dto) {
		// TODO Auto-generated method stub
		noticeRepo.deleteById(dto.getId());
	}

	@Override
	public void eduDelete(EducationDTO dto) {
		// TODO Auto-generated method stub
		eduRepo.deleteById(dto.getId());
	}

	@Override
	public void careDelete(CareDTO dto) {
		// TODO Auto-generated method stub
		careRepo.deleteById(dto.getId());
	}

	@Override
	public NoticeDTO getNotice(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return noticeRepo.findById(dto.getId()).get();
	}

	@Override
	public void adDelete(AdvertisementDTO dto) {
		// TODO Auto-generated method stub
		adRepo.deleteById(dto.getId());
	}

	@Override
	public void adUpdate(AdvertisementDTO dto) {
		// TODO Auto-generated method stub
		AdvertisementDTO result = adRepo.findById(dto.getId()).get();
		
		result.setTitle(dto.getTitle());
		result.setUrl(dto.getUrl());
		
		adRepo.save(result);
		
	}
	
	
	
	

}
