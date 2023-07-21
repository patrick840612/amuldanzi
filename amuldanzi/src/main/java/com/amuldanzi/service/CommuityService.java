package com.amuldanzi.service;

import java.util.HashMap;
import java.util.List;

import com.amuldanzi.domain.CommImageDTO;
import com.amuldanzi.domain.CommReplyDTO;
import com.amuldanzi.domain.CommunityDTO;

public interface CommuityService {

    // 커뮤니티 글과 이미지 정보를 저장하는 메서드입니다.
    void saveCommunity(CommunityDTO dto, List<CommImageDTO> fileDtos);

    // 모든 커뮤니티 글 목록을 조회하는 메서드입니다.
    List<HashMap<String, Object>> selectCommunityList();

    // 커뮤니티 글 번호를 기준으로 해당 커뮤니티 글을 조회하는 메서드입니다.
    CommunityDTO getCommunityByNo(Integer commNo);

    // 이미지 파일 이름을 기준으로 해당 이미지를 삭제하는 메서드입니다.
    void deleteImage(String imageName);

    // 커뮤니티 글 번호를 기준으로 커뮤니티 글의 제목과 내용을 수정하는 메서드입니다.
    void modifyCommunity(Integer comm_no, String commTitle, String commContent);

    // 커뮤니티 글과 이미지 정보를 저장하고 이미지가 있는 경우 커뮤니티 글과 이미지를 함께 저장하는 메서드입니다.
    void saveCommunityWithImages(CommunityDTO dto, List<CommImageDTO> fileDtos, Integer comm_no);

    // 커뮤니티 글 번호를 기준으로 해당 커뮤니티 글을 삭제하는 메서드입니다.
    void deleteCommunity(Integer comm_no);

    // 커뮤니티 글 번호를 기준으로 해당 커뮤니티 글을 조회하는 메서드입니다.
    CommunityDTO getCommunityByCommNo(String commNo);

    // 커뮤니티 글 번호와 회원 아이디를 기준으로 좋아요 정보를 저장하는 메서드입니다.
    Integer saveLike(String commNo, String commMemberId);

    // 커뮤니티 글 번호를 기준으로 좋아요 정보를 삭제하는 메서드입니다.
    void deleteLikeInfo(Integer comm_no);

    // 커뮤니티 글 번호를 기준으로 해당 커뮤니티 글의 좋아요 수를 조회하는 메서드입니다.
    Integer getCommLikeCount(Integer commNo);

    // 커뮤니티 글 번호와 회원 아이디를 기준으로 좋아요 정보를 삭제하는 메서드입니다.
    void deleteCommUnlike(String commNo, String commMemberId);

    // 커뮤니티 글 번호와 회원 아이디를 기준으로 신고 정보를 저장하는 메서드입니다.
    Integer saveBlame(String commNo, String commMemberId);

    // 커뮤니티 글 번호와 회원 아이디를 기준으로 신고 정보를 삭제하는 메서드입니다.
    void CommUnblame(String commNo, String commMemberId);

    // 커뮤니티 글 번호를 기준으로 신고 정보를 삭제하는 메서드입니다.
    void deleteBlameInfo(Integer comm_no);

    // 커뮤니티 글 번호를 기준으로 해당 커뮤니티 글의 신고 수를 조회하는 메서드입니다.
    Integer getBlameCount(Integer commNo);

    // 커뮤니티 글 번호와 회원 아이디, 댓글 내용을 기준으로 댓글을 저장하는 메서드입니다.
    void saveReply(String commNo, String memberId, String replyContent);

    // 커뮤니티 글 번호를 기준으로 댓글 목록을 조회하는 메서드입니다.
    List<HashMap<String, Object>> selectReply(String commNo);

    // 댓글 번호를 기준으로 댓글을 조회하는 메서드입니다.
    CommReplyDTO getReplyNo(String replyNo);

    // 커뮤니티 글 번호와 댓글 번호를 기준으로 댓글을 삭제하는 메서드입니다.
    void deleteReply(String commNo, String replyNo);

    // 커뮤니티 글 번호를 기준으로 댓글의 좋아요 수를 조회하는 메서드입니다.
    Integer getreplyLikeCount(Integer commNo);

	List<HashMap<String, Object>> selectLikeCommunityList();
 
 

	 

}
