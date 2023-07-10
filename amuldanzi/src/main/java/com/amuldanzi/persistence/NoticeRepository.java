package com.amuldanzi.persistence;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.NoticeDTO;

public interface NoticeRepository extends CrudRepository<NoticeDTO, Integer> {  //테이블명 / pk의 자료형

}
