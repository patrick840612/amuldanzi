package com.amuldanzi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/pet")
public class PetController {

	
	@RequestMapping("/gps")
	public void gps() {
		
		System.out.println("gps페이지요청");
		
	} 
	
	
	@RequestMapping("/emotion")
	public void emotion() {
		
		System.out.println("emotion페이지요청");
		
	} 
	
}
