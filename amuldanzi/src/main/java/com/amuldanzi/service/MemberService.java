package com.amuldanzi.service;

import com.amuldanzi.domain.MemberInfoDTO;

public interface MemberService {

	MemberInfoDTO findById(String memberId);

	MemberInfoDTO getMemberInfoById(String commMemberId);
	
}
