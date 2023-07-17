package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.NoticeDTO;

public interface NoticeService {

	List<NoticeDTO> getNoticeList();

	NoticeDTO getNoticeByNoticeTitle(String noticeTitle);

	void noticeUpdate(NoticeDTO notice);

	

}
