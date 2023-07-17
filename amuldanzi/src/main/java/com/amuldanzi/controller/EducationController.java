package com.amuldanzi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.service.EducationService;

@Controller
@RequestMapping("/education")
public class EducationController {
	
	@Autowired
	EducationService service;
	
	@RequestMapping("/education")
	public void education(Model m) {
		
		List<EducationDTO> eduList = service.geteduList();
		m.addAttribute("eduList", eduList);
		System.out.println(eduList);
		
	}

}
