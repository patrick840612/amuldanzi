package com.amuldanzi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.persistence.MemberRepository;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	
	@Autowired
	MemberRepository memberRepository;
	
	@Override
	public MemberInfoDTO findById(String memberId) {  
		 
		return  memberRepository.findId(memberId);
	}

}
