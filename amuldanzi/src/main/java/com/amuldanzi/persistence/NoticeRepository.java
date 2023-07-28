package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.amuldanzi.domain.NoticeDTO;

@Repository
public interface NoticeRepository extends JpaRepository<NoticeDTO, Integer> {

	// 제목으로 공지사항 정보 찾기
    NoticeDTO findByTitle(String noticeTitle);

    // 2개의 최신 공지사항 조회
    @Query(value = "SELECT * FROM notice ORDER BY id DESC LIMIT 2", nativeQuery = true)
	List<NoticeDTO> findNoticeListRecent();
    
    // id기준으로 공지사항 목록 정렬
    @Query("SELECT n FROM NoticeDTO n ORDER BY n.id DESC")
    List<NoticeDTO> findAllByOrderById();

}
