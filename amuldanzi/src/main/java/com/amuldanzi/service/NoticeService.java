package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.NoticeDTO;

public interface NoticeService {

	// 공지사항 정보의 전체 목록
	List<NoticeDTO> getNoticeList();

	// 제목에 해당하는 특정 공지사항의 정보
	NoticeDTO getNoticeByNoticeTitle(String noticeTitle);

	// 공지사항 정보 수정
	void noticeUpdate(NoticeDTO notice);

	//최신 공지사항 정보 2개
	List<NoticeDTO> getNoticeListRecent();
	
	// Id 기준으로 공지사항 정보 정렬
	List<NoticeDTO> getAllByOrderById();

}
