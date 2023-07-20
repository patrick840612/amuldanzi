package com.amuldanzi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		List<CareDTO> careList = service.getCareList();  // Assuming you have a method to get the care list
		List<Map<String, String>> items = new ArrayList<>();

		for (CareDTO item : careList) {
			Map<String, String> map = new HashMap<>();
			map.put("image"	, item.getImg());
			map.put("title", item.getTitle());
			items.add(map);
		}
		m.addAttribute("items", items);
		
		
		
	}

}
