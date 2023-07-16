package com.amuldanzi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amuldanzi.service.ClinicService;

@Controller
@RequestMapping("/clinic")
public class ClinicController {
	
	@Autowired
	ClinicService service; 
	
	@RequestMapping("/clinicInfo")
	public void clinicPage() {
		
		System.out.println("clinicDetail호출");
		
	}
	
	@GetMapping("/clinicMarker")
	@ResponseBody
	public List<HashMap<String, Object>> clinicDetail(Model model) {
		
		System.out.println("clinicDetail호출");
		List<HashMap<String, Object>> clinic = service.getAllClinics(); 
		System.out.println(clinic);
		
        return clinic; 
		
	}

	
	@GetMapping("/searchAll")
	@ResponseBody
	public List<Map<String, String>> searchAll(Model m) {
		
		System.out.println("searchAll 요청");
		
		List<Map<String, String>> clinicAll = service.getAllHospital();
		m.addAttribute("searchAll",clinicAll); 
	
		return clinicAll;
	}
	
	@GetMapping("/searchByLocation")
	@ResponseBody
	public List<HashMap<String, Object>> searchByLocation(@RequestParam("location") String location) {
		
		System.out.println("searchByLocation 요청");
		
		List<HashMap<String, Object>> Data = service.searchByLocation(location);
	
		return Data;
	}
	
	
	
}
