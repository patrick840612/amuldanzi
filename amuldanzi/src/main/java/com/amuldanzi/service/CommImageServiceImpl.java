package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.persistence.CommImageRepository;

@Service("commImageService")
public class CommImageServiceImpl implements CommImageService {

	@Autowired
	CommImageRepository commImageRepo;

	@Override
	public List<String> getCommImagesByNo(Integer commNo) { 
		
		return commImageRepo.findByCommNo(commNo);
	}

	@Override
	public void deleteImage(String imageName) { 
		
		commImageRepo.deleteImage(imageName);
	}

	@Override
	public List<String> getImagePathsByCommunityNo(Integer comm_no) {

		return commImageRepo.selectImagePath(comm_no);
	
	}

	@Override
	public void deleteImagesByCommunityNo(Integer comm_no) {


		commImageRepo.deleteImageAll(comm_no);
		
	}
	
	
	
	
	
}
