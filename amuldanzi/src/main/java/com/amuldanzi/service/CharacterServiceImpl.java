package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.dao.CharacterDAO;
import com.amuldanzi.dao.LoginDAO;
import com.amuldanzi.domain.CharacterDTO;
import com.amuldanzi.domain.MemberInfoDTO;

@Service("characterService")
public class CharacterServiceImpl implements CharacterService {
	
	@Autowired
	private CharacterDAO characterDAO;
	
	@Autowired
	private LoginDAO loginDAO;
	
	public List<CharacterDTO> selectByMemberId(String id) {
		return characterDAO.selectByMemberId(id);
	}
	
	// 포인트 업데이트
	public void cpointupdate(MemberInfoDTO member) {
		
		loginDAO.cpointupdate(member);
	}
	
	// 캐릭터 뽑기
	public void random(MemberInfoDTO member, CharacterDTO character) {
		loginDAO.cpointminus(member);
		characterDAO.save(character);
	}

}
