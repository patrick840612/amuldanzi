package com.amuldanzi.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
