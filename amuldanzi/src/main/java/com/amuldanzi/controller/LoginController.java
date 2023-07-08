package com.amuldanzi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.amuldanzi.config.ConfigUtils;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private ConfigUtils util;

	@RequestMapping("/login2")
	public void login() {
		
	}
	
	@RequestMapping(value="/google_login", method = {RequestMethod.GET, RequestMethod.POST})
	public void googleLogin(@RequestParam@PathVariable String code, Model m) {
//		String email = mainService.googleLogin(code);
		
	}
}
