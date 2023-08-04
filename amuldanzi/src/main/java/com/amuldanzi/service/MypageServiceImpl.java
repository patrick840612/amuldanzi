package com.amuldanzi.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amuldanzi.dao.BusinessDAO;
import com.amuldanzi.dao.LoginDAO;
import com.amuldanzi.dao.LoginPetDAO;
import com.amuldanzi.dao.LoginSocialDAO;
import com.amuldanzi.dao.QnaDAO;
import com.amuldanzi.dao.SitterDAO;
import com.amuldanzi.domain.BusinessDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.domain.MemberSocialDTO;
import com.amuldanzi.domain.QnaDTO;
import com.amuldanzi.domain.SitterDTO;
import com.amuldanzi.entity.OrderItemsEntity2;
import com.amuldanzi.persistence.OrderItemsRepository;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	LoginPetDAO loginPetDAO;
	
	@Autowired
	LoginSocialDAO loginSocialDAO;
	
	@Autowired
	LoginDAO loginDAO;
	
	@Autowired
	SitterDAO sitterDAO;
	
	@Autowired
	BusinessDAO businessDAO;
	
	@Autowired
	QnaDAO qnaDAO;
	
	@Autowired
	OrderItemsRepository orderItemsRepository;
	
	// pet 정보 가져오기(회원정보관리 입장시)
	@Override
	public List<MemberPetDTO> selectById(MemberInfoDTO member) {
		List<MemberPetDTO> petList = loginPetDAO.selectbyId(member);
		
        if (petList == null) {
            // Handle the case when no records are found
            return Collections.emptyList(); // or return null, throw an exception, etc.
        }
        return petList;
	}
	
	// 소셜가입 정보 가져오기(회원정보관리 입장시)
	@Override
	public List<MemberSocialDTO> selectSocialById(MemberInfoDTO member){
		List<MemberSocialDTO> socials = loginSocialDAO.selectSocialById(member);
		
        if (socials == null) {
            // Handle the case when no records are found
            return Collections.emptyList(); // or return null, throw an exception, etc.
        }
        return socials;
	}
	
	// 회원관리 체크박스 해제시 소셜로그인 삭제
	@Override
	public void deleteSocial(MemberSocialDTO memberSocial) {
		loginSocialDAO.deleteByMemberId(memberSocial);
	}
	
	// 회원정보 업데이트
	@Override
	@Transactional
	public void updateInfo(MemberInfoDTO member, List<MemberPetDTO> petList) {
		loginDAO.updateById(member);
		List<MemberPetDTO> dbPets = loginPetDAO.selectbyId(member);

		if (petList != null) {
			for (MemberPetDTO pet : petList) {
				if (pet.getMemberPetId() == 0) {
					// 1. petList에 있는 DTO의 memberPetId의 값이 0이면 save
					loginPetDAO.save(pet);
				} else {
					// 2. petList에 있는 DTO의 memberPetId의 값이 db에 있으면 수정
					loginPetDAO.updatePet(pet);

				}
			}
		}
	}

	// 반려동물 삭제
	@Override	
	public void deletePet(MemberPetDTO pet) {
		loginPetDAO.deletePet(pet.getMemberPetId());
	}
	
	// 반려동물 전체 삭제
	@Override
	public void petDel(MemberInfoDTO member) {
		loginPetDAO.petDel(member);
		loginDAO.changBloodGive(member);
	}
	
	// 돌보미 검색
	public Optional<SitterDTO> sitterFindById(String id) {
		return sitterDAO.findById(id);
	}
	
	// 돌보미 신청
	public void saveSitter(SitterDTO sitter) {
		sitterDAO.save(sitter);
	}
	
	// 돌보미 재신청을 위한 삭제
	public void sitterDeleteById(String id) {
		sitterDAO.deleteById(id);
	}
	
	// 쇼핑몰 검색
	public List<BusinessDTO> businessFindByMemberId(String id) {
		return businessDAO.findByMemberId(id);
	}
	
	// 쇼핑몰 신청
	public void saveBusiness(BusinessDTO business) {
		businessDAO.save(business);
	}
	
	// 쇼핑몰 검색(상세페이지용)
	public BusinessDTO businessFindByMemberRearId(String businessNumber) {
		   Optional<BusinessDTO> businessOptional = businessDAO.findById(businessNumber);
		    return businessOptional.orElse(null); // 객체가 있으면 해당 BusinessDTO를 반환하고, 없으면 null을 반환
	}
	
	// 쇼핑몰 수정
	public void businessUpdate(BusinessDTO business) {
		businessDAO.businessUpdate(business);
	}
	
	// 쇼핑몰 삭제
	public void businessDelete(BusinessDTO business) {
		businessDAO.delete(business);
	}
	
	// 문의 검색
	public List<QnaDTO> qnaFindByMemberId(String id) {
		return qnaDAO.findByMemberId(id);
	}
	
	// 문의 등록
	public void saveQna(QnaDTO qna) {
		qnaDAO.save(qna);
	}
	
	// 문의 검색(상세페이지용)
	public QnaDTO qnaFindByRearId(Integer qnaNo) {
		   Optional<QnaDTO> qnaOptional = qnaDAO.findById(qnaNo);
		    return qnaOptional.orElse(null); // 객체가 있으면 해당 DTO를 반환하고, 없으면 null을 반환
	}
	
	// 문의 수정
	public void qnaUpdate(QnaDTO qna) {
		qnaDAO.qnaUpdate(qna);
	}
	
	// 문의 삭제
	public void qnaDelete(QnaDTO qna) {
		qnaDAO.delete(qna);
	}
	
	public List<OrderItemsEntity2> orderOFindByMemberId(String id){
		List<Object[]> rawResult = orderItemsRepository.orderOFindByMemberId(id);
		OrderItemsEntity2 Entity2 = new OrderItemsEntity2();
	      List<OrderItemsEntity2> olist = new ArrayList<>();

	        for (Object[] row : rawResult) {
	            Integer count = (Integer) row[0];
	            Integer price = (Integer) row[1];
	            String trackingNumber = (String) row[2];
	            Timestamp payDate = (Timestamp) row[3];
	            String commerceName = (String) row[4];
	            String img = (String) row[5];

	            OrderItemsEntity2 orderItemsEntity2 = new OrderItemsEntity2(count, price, trackingNumber, payDate, commerceName, img);
	            olist.add(orderItemsEntity2);
	        }

	        return olist;
	}
	
	public List<OrderItemsEntity2> orderXFindByMemberId(String id){
		List<Object[]> rawResult = orderItemsRepository.orderXFindByMemberId(id);
		OrderItemsEntity2 Entity2 = new OrderItemsEntity2();
	      List<OrderItemsEntity2> olist = new ArrayList<>();

	        for (Object[] row : rawResult) {
	            Integer count = (Integer) row[0];
	            Integer price = (Integer) row[1];
	            String trackingNumber = (String) row[2];
	            Timestamp payDate = (Timestamp) row[3];
	            String commerceName = (String) row[4];
	            String img = (String) row[5];

	            OrderItemsEntity2 orderItemsEntity2 = new OrderItemsEntity2(count, price, trackingNumber, payDate, commerceName, img);
	            olist.add(orderItemsEntity2);
	        }

	        return olist;
	}
}
