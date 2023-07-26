package com.amuldanzi.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amuldanzi.dao.LoginDAO;
import com.amuldanzi.dao.LoginPetDAO;
import com.amuldanzi.dao.LoginSocialDAO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.domain.MemberSocialDTO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	LoginPetDAO loginPetDAO;
	
	@Autowired
	LoginSocialDAO loginSocialDAO;
	
	@Autowired
	LoginDAO loginDAO;
	
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
	
}
