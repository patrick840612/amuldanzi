package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.AdvertisementDTO;
import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.CommerceDTO;
import com.amuldanzi.domain.CommunityDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketInfoDTO;
import com.amuldanzi.domain.NoticeDTO;
import com.amuldanzi.persistence.AdvertisementRepository;
import com.amuldanzi.persistence.CareRepository;
import com.amuldanzi.persistence.ClinicRepository;
import com.amuldanzi.persistence.CommerceRepository;
import com.amuldanzi.persistence.CommunityRepository;
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
	
	@Autowired
	CommerceRepository commerceRepo;
	
	@Autowired
	CommunityRepository communityRepo;

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
	public NoticeDTO getNoticeById(NoticeDTO dto) {
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

		
		AdvertisementDTO result = adRepo.findById(dto.getId()).get();
		
		result.setTitle(dto.getTitle());		
		result.setUrl(dto.getUrl());
		
		if(dto.getImgPath() != null) {
			
		result.setImg(dto.getImg());
		result.setImgPath(dto.getImgPath());
		
		}		
		
		adRepo.save(result);
		
	}

	@Override
	public void deleteImage(Integer cateId, String imageName) {
		// TODO Auto-generated method stub
		if(cateId==2) {
			eduRepo.deleteImage(imageName);
		}else if(cateId == 3) {
			careRepo.deleteImage(imageName);
		}else if(cateId == 8){
			adRepo.deleteImage(imageName);
		}else if(cateId == 9) {
			commerceRepo.deleteImage(imageName);
		}
		
	}

	@Override
	public AdvertisementDTO getAdById(AdvertisementDTO dto) {
		// TODO Auto-generated method stub
		return adRepo.findById(dto.getId()).get();
	}

	@Override
	public void deleteVideo(Integer cateId, String vidoeName) {
		// TODO Auto-generated method stub
		if(cateId==2) {
			eduRepo.deleteVideo(vidoeName);
		}else if(cateId == 3) {
			careRepo.deleteVideo(vidoeName);
		}
		
	}

	@Override
	public EducationDTO getEduById(EducationDTO dto) {
		// TODO Auto-generated method stub
		return eduRepo.findById(dto.getId()).get();
	}

	@Override
	public CareDTO getCareById(CareDTO dto) {
		// TODO Auto-generated method stub
		return careRepo.findById(dto.getId()).get();
	}

	@Override
	public void careUpdate(CareDTO dto) {
		// TODO Auto-generated method stub
		CareDTO result = careRepo.findById(dto.getId()).get();
		
		result.setAnimal(dto.getAnimal());
		result.setTitle(dto.getTitle());
		result.setContent(dto.getContent());
		
		if(dto.getImgPath() != null) {
		
		result.setImg(dto.getImg());
		result.setImgPath(dto.getImgPath());
		
		}
		
		if(dto.getVideoPath() != null) {
		
		result.setVideo(dto.getVideo());
		result.setVideoPath(dto.getVideoPath());
		
		}
		careRepo.save(result);
		
	}

	@Override
	public void eduUpdate(EducationDTO dto) {
		// TODO Auto-generated method stub
		EducationDTO result = eduRepo.findById(dto.getId()).get();
		
		result.setAnimal(dto.getAnimal());
		result.setTitle(dto.getTitle());
		result.setStep(dto.getStep());
		result.setLevel(dto.getLevel());
		result.setContent(dto.getContent());
		
		if(dto.getImgPath() != null) {
		
		result.setImg(dto.getImg());
		result.setImgPath(dto.getImgPath());
		
		}
		
		if(dto.getVideoPath() != null) {
			
		result.setVideo(dto.getVideo());
		result.setVideoPath(dto.getVideoPath());
		
		}
		
		eduRepo.save(result);
	}

	@Override
	public void noticeUpdate(NoticeDTO dto) {
		// TODO Auto-generated method stub
		NoticeDTO result = noticeRepo.findById(dto.getId()).get();
		
		result.setTitle(dto.getTitle());
		result.setContent(dto.getContent());
		
		noticeRepo.save(result);
		
	}

	@Override
	public void commerceSave(CommerceDTO dto) {
		// TODO Auto-generated method stub
		commerceRepo.save(dto);
	}

	@Override
	public List<CommerceDTO> getCommerceList() {
		// TODO Auto-generated method stub
		return (List<CommerceDTO>)commerceRepo.findAll();
	}

	@Override
	public void commerceDelete(CommerceDTO dto) {
		// TODO Auto-generated method stub
		commerceRepo.deleteById(dto.getCommerceId());
	}

	@Override
	public void commerceUpdate(CommerceDTO dto) {
		// TODO Auto-generated method stub
		CommerceDTO result = commerceRepo.findById(dto.getCommerceId()).get();
		
		result.setCommerceName(dto.getCommerceName());
		result.setCommercePrice(dto.getCommercePrice());
		result.setCommerceStock(dto.getCommerceStock());
		
		
		//상품 이미지 패스가 null 값이라면 이미지와 이미지 패스는 기존 값 유지
		//null 값이 아니라면 새로운 상품 이미지와 이미지 패스로 변경
		if(dto.getImgPath() != null) {
			result.setImg(dto.getImg());
			result.setImgPath(dto.getImgPath());
		}
		
		//상품 상세 이미지 패스가 null 값이라면 이미지와 이미지 패스는 기존 값 유지
		//null 값이 아니라면 새로운 상품 상세 이미지와 이미지 패스로 변경
		if(dto.getDetaiImgPath() != null) {
			result.setDetailImg(dto.getDetailImg());
			result.setDetaiImgPath(dto.getDetaiImgPath());			
		}
		
		commerceRepo.save(result);
		
	}

	@Override
	public CommerceDTO getCommerceById(CommerceDTO dto) {
		// TODO Auto-generated method stub
		return commerceRepo.findById(dto.getCommerceId()).get();
	}

	@Override
	public List<CommunityDTO> getCommunityList() {
		// TODO Auto-generated method stub
		return communityRepo.getCommunityListByBlame;
	}
	
	

}
