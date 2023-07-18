package com.amuldanzi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.CommImageDTO;
import com.amuldanzi.domain.CommunityDTO;
import com.amuldanzi.persistence.CommImageRepository;
import com.amuldanzi.persistence.CommLikeRepository;
import com.amuldanzi.persistence.CommunityRepository;

import jakarta.transaction.Transactional;

@Service("communityService")
public class CommunityServiceImpl implements CommuityService {

	@Autowired
	CommunityRepository commRepo;
	
	@Autowired
	CommImageRepository commImgRepo;
	
	@Autowired 
	CommLikeRepository commLikeRepo;
	
	@Override
	public void saveCommunity(CommunityDTO dto, List<CommImageDTO> fileDtos) {
 
		commRepo.save(dto); 
		for(CommImageDTO com : fileDtos) {
			
			commImgRepo.save(com); 
		}
		
	}

    @Override
    public List<HashMap<String, Object>> selectCommunityList() {
    	
        List<Object[]> listData = commRepo.selectCommunityList();
        
        List<HashMap<String, Object>> result = new ArrayList<>();
        
        for (Object[] objArray : listData) {
        	
        	HashMap<String, Object> map = new HashMap<>();
        	map.put("id", objArray[0]);
            // 필요한 다른 필드들도 추가할 수 있습니다. 
            map.put("title", objArray[1]);
            map.put("date", objArray[2]);
            map.put("content", objArray[3]);
            map.put("count", objArray[4]); 
            map.put("comm_no", objArray[5]);
            map.put("path", objArray[6]);
            result.add(map);
        	
        }
        return result;
    }

	@Override
	public CommunityDTO getCommunityByNo(Integer commNo) { 
		 
		return commRepo.findByCommNo(commNo);
	}

	@Override
	public void deleteImage(String imageName) { 
		
		
		
	}

	@Override
	@Transactional
	public void modifyCommunity(Integer comm_no, String commTitle, String commContent) {

		commRepo.modifyCommunity(comm_no, commTitle, commContent);
	    System.out.println("커뮤니티 수정 성공");
		
	}

	@Override
	@Transactional
	public void saveCommunityWithImages(CommunityDTO dto, List<CommImageDTO> fileDtos, Integer comm_no) {
		 		
		// 영속화 설정(지향 프로그래밍에서 사용되는 개념으로, 객체의 상태를 데이터베이스와 같은 영구 저장소에 저장하여 지속적으로 사용할 수 있게 하는 것을 말함)
	    CommunityDTO savedCommunity = commRepo.findById(comm_no).orElse(null); // comm_no에 해당하는 CommunityDTO 조회


        // 이미지 정보 저장
        for (CommImageDTO fileDto : fileDtos) {
            fileDto.setCommunityNum(savedCommunity);
            commImgRepo.save(fileDto);
        }
    }

	@Override
	public void deleteCommunity(Integer comm_no) {

		commRepo.deleteCommunity(comm_no); 
		
	} 
 
		
	}

	 
 
