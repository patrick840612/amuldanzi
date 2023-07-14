package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.NoticeDTO;

public interface NoticeRepository extends CrudRepository<NoticeDTO, Integer> {  //테이블명 / pk의 자료형
	
	//@Query(value = "SELECT title FROM notice WHERE title = :#{#title} AND regdate = :#{#regdate} AND count = :#{#count} AND content = :#{#content}", nativeQuery = true)
    //String sLoginCheck(MemberInfoDTO member);
}
