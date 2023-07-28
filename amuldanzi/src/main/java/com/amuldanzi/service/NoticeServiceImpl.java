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

	// 공지사항 전체 목록
	@Override
	public List<NoticeDTO> getNoticeList() {
		return (List<NoticeDTO>)noticeRepo.findAll();
	}

	// 제목에 해당하는 특정 공지사항 정보
	@Override
	public NoticeDTO getNoticeByNoticeTitle(String noticeTitle) {
		return noticeRepo.findByTitle(noticeTitle);
	}

	//공지사항 정보 수정
	@Override
	public void noticeUpdate(NoticeDTO dto) {
		noticeRepo.save(dto);

	}

	// 최신 공지사항 정보 2개
	@Override
	public List<NoticeDTO> getNoticeListRecent() { 

		return noticeRepo.findNoticeListRecent();
	}

	// Id기준으로 공지사항 정보 정렬
	@Override
	public List<NoticeDTO> getAllByOrderById() {
		return noticeRepo.findAllByOrderById();
	}





}
