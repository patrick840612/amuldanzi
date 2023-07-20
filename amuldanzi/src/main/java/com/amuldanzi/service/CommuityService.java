package com.amuldanzi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.amuldanzi.domain.CommImageDTO;
import com.amuldanzi.domain.CommReplyDTO;
import com.amuldanzi.domain.CommunityDTO;

public interface CommuityService {

	void saveCommunity(CommunityDTO dto, List<CommImageDTO> fileDtos);

	List<HashMap<String, Object>> selectCommunityList();

	CommunityDTO getCommunityByNo(Integer commNo);

	void deleteImage(String imageName); 

	void modifyCommunity(Integer comm_no, String commTitle, String commContent); 
	
	void saveCommunityWithImages(CommunityDTO dto, List<CommImageDTO> fileDtos, Integer comm_no);

	void deleteCommunity(Integer comm_no);

	CommunityDTO getCommunityByCommNo(String commNo);

	Integer saveLike(String commNo, String commMemberId); 

	void deleteLikeInfo(Integer comm_no);

	Integer getCommLikeCount(Integer commNo);

	void deleteCommUnlike(String commNo, String commMemberId);

	Integer saveBlame(String commNo, String commMemberId);

	void CommUnblame(String commNo, String commMemberId);

	void deleteBlameInfo(Integer comm_no);

	Integer getBlameCount(Integer commNo);

	void saveReply(String commNo, String memberId, String replyContent);

	List<HashMap<String, Object>> selectReply(String commNo);

	CommReplyDTO getReplyNo(String replyNo);  

	void deleteReply(String commNo, String replyNo);

	Integer getreplyLikeCount(Integer commNo);
 

	 

}
