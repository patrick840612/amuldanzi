package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.CommImageDTO;

public interface CommImageService {

	// 이미지 조회 
	List<String> getCommImagesByNo(Integer commNo);

	// 이미지 삭제 
	void deleteImage(String imageName);

	// 글 번호에 맞는 이미지 경로 조회
	List<String> getImagePathsByCommunityNo(Integer comm_no);

	// 글 번호에 맞는 이미지 삭제 
	void deleteImagesByCommunityNo(Integer comm_no);
 

}
