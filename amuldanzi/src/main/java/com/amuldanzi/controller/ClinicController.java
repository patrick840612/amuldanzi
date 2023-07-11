package com.amuldanzi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.service.ClinicService;

@Controller
@RequestMapping("/clinic")
public class ClinicController {
	
	@Autowired
	ClinicService service;

	@RequestMapping("/clinic")
	public void clinicShop(Model m) {
		List<ClinicDTO> clinicList = service.getClinicList();
		m.addAttribute("clinicList", clinicList);
	}
	
	@RequestMapping("/clinicDetail")
	public void clinicDetail(ClinicDTO dto, Model m) {
		
		ClinicDTO clinic = service.clinicList(dto);
		
		clinic.setCount(clinic.getCount()+1);
		service.clinicUpdate(clinic);
		
		m.addAttribute("clinic", clinic);
	}

}
