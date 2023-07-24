package com.amuldanzi.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.CommImageDTO;
import com.amuldanzi.domain.CommReplyDTO;
import com.amuldanzi.domain.CommunityDTO;
import com.amuldanzi.persistence.CommImageRepository;
import com.amuldanzi.persistence.CommLikeRepository;
import com.amuldanzi.persistence.CommunityRepository;

import jakarta.servlet.ServletContext;
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
 
		// 커뮤니티 글 정보 저장
		commRepo.save(dto); 
		for(CommImageDTO com : fileDtos) {
			
			// 이미지 파일정보 한장씩 저장
			commImgRepo.save(com); 
		}
		
	}

    @Override
    public List<HashMap<String, Object>> selectCommunityList() {
    	
    	// 모든 커뮤니티글 목록을 조회하며 HashMap 으로 변환합니다.
        List<Object[]> listData = commRepo.selectCommunityList();
        List<HashMap<String, Object>> result = new ArrayList<>();
        
        for (Object[] objArray : listData) {
        	
        	// 각 커뮤니티 글 정보를 HashMap 에 담습니다.
        	HashMap<String, Object> map = new HashMap<>();
        	map.put("id", objArray[0]);
            // 필요한 다른 필드들도 추가할 수 있습니다. 
            map.put("title", objArray[1]);
            map.put("date", objArray[2]);
            map.put("likeCount", objArray[3]);
            map.put("path", objArray[4]); 
            map.put("comm_no", objArray[5]);
            map.put("content", objArray[6]);
            result.add(map);
        	
        }
        return result;
    }

	@Override
	public CommunityDTO getCommunityByNo(Integer commNo) { 
		 
		// 커뮤니티 글 번호를 기준으로 해당 커뮤니티 글 조회 
		return commRepo.findByCommNo(commNo);
	}

	@Override
	public void deleteImage(String imageName) {  
		
	}

	@Override
	@Transactional
	public void modifyCommunity(Integer comm_no, String commTitle, String commContent) {

		// 커뮤니티 글 수정 로직을 구현 하기 
		commRepo.modifyCommunity(comm_no, commTitle, commContent);
	    System.out.println("커뮤니티 수정 성공");
		
	}

	@Override
	@Transactional // 데이터 일관성과 안정성을 보장하기 위해 
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

		// 글번호에 맞는 이미지 삭제하기
		commRepo.deleteCommunity(comm_no); 
		
	}

	@Override
	public CommunityDTO getCommunityByCommNo(String commNo) { 
		
		// 글 번호에 맞는 해당 커뮤니티 글 조회
		return commRepo.getCommunityByCommNo(commNo);
	}

	@Override
	@Transactional
	public Integer saveLike(String commNo, String commMemberId) {

		// 좋아요 클릭 시 회원 정보 저장 
		return commLikeRepo.saveLike(commNo, commMemberId);
		
	}

	@Override
	public Integer getCommLikeCount(Integer commNo) {  
		
		// 좋아요 수 세기 
		return commLikeRepo.getCommLikeCount(commNo);
	}

	@Override
	@Transactional
	public void deleteLikeInfo(Integer comm_no) {
		 
		// 좋아요 한번 더 클릭 시 정보 삭제 
		commLikeRepo.deleteByCommunity(comm_no);
		
	}

	@Override
	@Transactional
	public void deleteCommUnlike(String commNo, String commMemberId) { 

		// 좋아요 한번더 클릭 시 정보 삭제 
		commLikeRepo.deleteCommUnlike(commNo, commMemberId);
		
	}

	@Override
	@Transactional
	public Integer saveBlame(String commNo, String commMemberId) {
		
		// 신고 버튼 클릭시 정보 저장
		return commLikeRepo.saveBlame(commNo, commMemberId);
		
	}

	@Override
	@Transactional
	public void CommUnblame(String commNo, String commMemberId) { 
		
		// 신고버튼 한번더 클릭 시 정보 저장
		commLikeRepo.deleteCommUnblame(commNo, commMemberId);
	}

	
	@Override
	@Transactional
	public void deleteBlameInfo(Integer comm_no) {

		// 글 번호를 기준으로 신고 정보 삭제 
		commLikeRepo.deleteByBlame(comm_no);
		
	}

	@Override
	public Integer getBlameCount(Integer commNo) { 
		
		// 신고글 수 세기 
		return commLikeRepo.getCommBlameCount(commNo);
	}

	@Override
	@Transactional
	public void saveReply(String commNo, String memberId, String replyContent) {

		// 댓글 입력 정보 저장하기 
		commRepo.saveReply(commNo, memberId, replyContent);
		
	}

	@Override
	public List<HashMap<String,Object>> selectReply(String commNo) {

		// 댓글 리스트 불러오기 object 로담아서 json 구조로 가져오기
		List<Object[]> replyData = commRepo.replyList(commNo);
		
		List<HashMap<String, Object>> result = new ArrayList<>();
		
		for(Object[] objArray : replyData) {
			
			HashMap<String, Object> map = new HashMap<>();
            
            map.put("replyContent", objArray[0]);
            // 필요한 다른 필드들도 추가할 수 있습니다. 
            map.put("replyDate", objArray[1]);
            map.put("id", objArray[2]); 
            map.put("replyNo", objArray[3]); 
            map.put("commNo", objArray[4]);  
            result.add(map); 
			
		} 
		
		return result;
	}

	// 댓글 리스트 불러오기
	@Override
	public CommReplyDTO getReplyNo(String replyNo) { 
		
		return commRepo.getReplyNo(replyNo);
	}

	// 댓글 삭제하기 
	@Override
	@Transactional
	public void deleteReply(String commNo, String replyNo) {
 
		commRepo.deleteReply(commNo, replyNo);
		
	}

	// 댓글 수 세기
	@Override
	public Integer getreplyLikeCount(Integer commNo) {
		 
		return commRepo.getreplyLikeCount(commNo);
	}

	@Override
	public List<HashMap<String, Object>> selectLikeCommunityList() {
		
		// 모든 커뮤니티글 목록을 조회하며 HashMap 으로 변환합니다.
        List<Object[]> listData = commRepo.selectLikeCommunityList();
        List<HashMap<String, Object>> result = new ArrayList<>();
        
        for (Object[] objArray : listData) {
        	
        	// 각 커뮤니티 글 정보를 HashMap 에 담습니다.
        	HashMap<String, Object> map = new HashMap<>();
        	map.put("id", objArray[0]);
            // 필요한 다른 필드들도 추가할 수 있습니다. 
            map.put("title", objArray[1]);
            map.put("date", objArray[2]); 
            map.put("likeCount", objArray[3]); 
            map.put("path", objArray[4]); 
            map.put("commNo", objArray[5]);
            map.put("content", objArray[6]);
            result.add(map);
        	
        }
        return result; 
        
	}
 
 
 
		
	}

	 
 
