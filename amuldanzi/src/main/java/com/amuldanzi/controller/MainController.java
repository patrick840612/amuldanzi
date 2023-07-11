package com.amuldanzi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("/index")
	public void index() {
		//System.out.println("/main/index 확인");
	}
	
}
