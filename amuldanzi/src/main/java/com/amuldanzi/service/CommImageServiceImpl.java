package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.CommImageDTO;
import com.amuldanzi.persistence.CommImageRepository;

@Service("commImageService")
public class CommImageServiceImpl implements CommImageService {

	@Autowired
	CommImageRepository commImageRepo;

	//글 번호를 기준으로 해당 커뮤니티 글의 이미지 파일 이름 조회 
	@Override
	public List<String> getCommImagesByNo(Integer commNo) { 
		
		return commImageRepo.findByCommNo(commNo);
	}

	// 해당 이미지 파일 이름을 기준을 해당 이미지 삭제
	@Override
	public void deleteImage(String imageName) { 
		
		commImageRepo.deleteImage(imageName);
	}

	// 해당 커뮤니티 글의 이미지 파일경로 조회 
	@Override
	public List<String> getImagePathsByCommunityNo(Integer comm_no) {

		return commImageRepo.selectImagePath(comm_no);
	
	}

	// 해당 커뮤니티 글의 모든 이미지 삭제
	@Override
	public void deleteImagesByCommunityNo(Integer comm_no) {


		commImageRepo.deleteImageAll(comm_no);
		
	}
	
	
	
	
	
}
