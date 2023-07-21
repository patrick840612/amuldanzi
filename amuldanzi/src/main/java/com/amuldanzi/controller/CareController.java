package com.amuldanzi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.service.CareService;

@Controller
@RequestMapping("/care")
public class CareController {
	
	@Autowired
	CareService service;
	
	@RequestMapping("/care")
	public void care(Model m) {
		
		List<CareDTO> careList = service.getCareList();
		m.addAttribute("careList", careList);
		System.out.println(careList);
		
	}
	
	@RequestMapping("/careDetail")
	public void careDetail(@RequestParam("id") Integer careId, Model m) {
		CareDTO care = service.getCareByCareId(careId);
		m.addAttribute("care", care);
	}

}
