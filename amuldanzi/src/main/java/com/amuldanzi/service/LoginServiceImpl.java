package com.amuldanzi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.dao.LoginDAO;
import com.amuldanzi.domain.MemberInfoDTO;
import org.mindrot.jbcrypt.BCrypt;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDAO loginDAO;
	
	public void regist(MemberInfoDTO member) {
		String pw = BCrypt.hashpw(member.getUserPassword(), BCrypt.gensalt());
		member.setUserPassword(pw);
		System.out.println("==============================");
		System.out.println(member);
		loginDAO.save(member);
	}
}
