package com.amuldanzi.service;

import java.util.List;

public interface CommImageService {

	List<String> getCommImagesByNo(Integer commNo);

	void deleteImage(String imageName);

	List<String> getImagePathsByCommunityNo(Integer comm_no);

	void deleteImagesByCommunityNo(Integer comm_no);
 

}
