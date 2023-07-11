package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.NoticeDTO;

public interface NoticeRepository extends CrudRepository<NoticeDTO, Integer> {  //테이블명 / pk의 자료형

}
