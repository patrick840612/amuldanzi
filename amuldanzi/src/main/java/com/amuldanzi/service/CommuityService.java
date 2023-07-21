package com.amuldanzi.service;

import java.util.HashMap;
import java.util.List;

import com.amuldanzi.domain.CommImageDTO;
import com.amuldanzi.domain.CommunityDTO;

public interface CommuityService {

	void saveCommunity(CommunityDTO dto, List<CommImageDTO> fileDtos);

	List<HashMap<String, Object>> selectCommunityList();

	CommunityDTO getCommunityByNo(Integer commNo);

	void deleteImage(String imageName); 

	void modifyCommunity(Integer comm_no, String commTitle, String commContent); 
	
	void saveCommunityWithImages(CommunityDTO dto, List<CommImageDTO> fileDtos, Integer comm_no);

	void deleteCommunity(Integer comm_no);

	 

}
