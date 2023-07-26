package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.domain.MemberSocialDTO;

public interface MypageService {
	public List<MemberPetDTO> selectById(MemberInfoDTO member);
	public List<MemberSocialDTO> selectSocialById(MemberInfoDTO member);
	public void deleteSocial(MemberSocialDTO memberSocial);
	public void updateInfo(MemberInfoDTO member, List<MemberPetDTO> petList);
	public void deletePet(MemberPetDTO pet);
	public void petDel(MemberInfoDTO member);
	
}
