package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.NoticeDTO;
import com.amuldanzi.persistence.NoticeRepository;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeRepository noticeRepo;

	@Override
	public List<NoticeDTO> getNoticeList() {
		// TODO Auto-generated method stub
		return (List<NoticeDTO>)noticeRepo.findAll();
	}

	@Override
	public NoticeDTO getNoticeByNoticeTitle(String noticeTitle) {
		// TODO Auto-generated method stub
		return noticeRepo.findByTitle(noticeTitle);
	}

	@Override
	public void noticeUpdate(NoticeDTO dto) {
		noticeRepo.save(dto);
		
	}

	@Override
	public List<NoticeDTO> getNoticeListRecent() { 
		
		return noticeRepo.findNoticeListRecent();
	}



	

}
