package com.amuldanzi.service;

import java.util.List;
import java.util.Optional;

import com.amuldanzi.domain.BusinessDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.domain.MemberSocialDTO;
import com.amuldanzi.domain.SitterDTO;

public interface MypageService {
	public List<MemberPetDTO> selectById(MemberInfoDTO member);
	public List<MemberSocialDTO> selectSocialById(MemberInfoDTO member);
	public void deleteSocial(MemberSocialDTO memberSocial);
	public void updateInfo(MemberInfoDTO member, List<MemberPetDTO> petList);
	public void deletePet(MemberPetDTO pet);
	public void petDel(MemberInfoDTO member);
	public void saveSitter(SitterDTO sitter);
	public Optional<SitterDTO> sitterFindById(String id);
	public void sitterDeleteById(String id);
	public List<BusinessDTO> businessFindByMemberId(String id);
	public void saveBusiness(BusinessDTO business);
	public BusinessDTO businessFindByMemberRearId(String businessNumber);
	public void businessUpdate(BusinessDTO business);
	public void businessDelete(BusinessDTO business);

}
