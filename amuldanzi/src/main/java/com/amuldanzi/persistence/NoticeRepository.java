package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.amuldanzi.domain.NoticeDTO;

@Repository
public interface NoticeRepository extends JpaRepository<NoticeDTO, Long> {

    NoticeDTO findByTitle(String noticeTitle);

}
