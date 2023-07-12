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
		return (List<NoticeDTO>)noticeRepo.findAll();
	}

	@Override
	public NoticeDTO noticeList(NoticeDTO dto) {
		return noticeRepo.findById(dto.getId()).get();
	}

	@Override
	public void noticeUpdate(NoticeDTO dto) {
		noticeRepo.save(dto);
	}

	@Override
	public NoticeDTO getNoticeByNoticeTitle(String noticeTitle) {
		return null;
	public void noticeInsert(NoticeDTO dto) {
		// TODO Auto-generated method stub
		noticeRepo.save(dto);
	}

}
