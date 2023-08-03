package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.CharacterDTO;
import com.amuldanzi.domain.MemberInfoDTO;

public interface CharacterService {
	public List<CharacterDTO> selectByMemberId(String id);
	public void cpointupdate(MemberInfoDTO member);
	public void random(MemberInfoDTO member, CharacterDTO character);
	public void selectCharacter(MemberInfoDTO member);
	public MemberInfoDTO findById(String id);
	public void evolveCharacter(MemberInfoDTO member, CharacterDTO character);
	public void minusCpoint(MemberInfoDTO member);
}
