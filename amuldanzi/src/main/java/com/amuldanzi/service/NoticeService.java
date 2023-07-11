package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.NoticeDTO;

public interface NoticeService {

	List<NoticeDTO> getNoticeList();

	NoticeDTO noticeList(NoticeDTO dto);

	void noticeUpdate(NoticeDTO notice);

	NoticeDTO getNoticeByNoticeTitle(String noticeTitle);

	

}