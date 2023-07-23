package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.amuldanzi.domain.NoticeDTO;

@Repository
public interface NoticeRepository extends JpaRepository<NoticeDTO, Integer> {

	
    NoticeDTO findByTitle(String noticeTitle);

    @Query(value = "SELECT * FROM notice ORDER BY id DESC LIMIT 2", nativeQuery = true)
	List<NoticeDTO> findNoticeListRecent();

}
