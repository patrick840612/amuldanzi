package com.amuldanzi.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.BusinessDTO;
import com.amuldanzi.domain.QnaDTO;

public interface QnaDAO extends CrudRepository<QnaDTO, Integer>
{

	@Query(value = "SELECT * FROM qna WHERE id = :id", nativeQuery = true)
	List<QnaDTO> findByMemberId(String id);
	
	@Query(value = "UPDATE qna SET qna_category = :#{#qna.qnaCategory}, qna_title = :#{#qna.qnaTitle}, qna_content = :#{#qna.qnaContent}, qna_img = :#{#qna.qnaImg} WHERE qna_no = :#{#qna.qnaNo}", nativeQuery = true)
	void qnaUpdate(QnaDTO qna);
}
