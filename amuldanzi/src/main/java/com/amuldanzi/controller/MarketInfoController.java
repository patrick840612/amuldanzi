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

import com.amuldanzi.service.MarketInfoService;

@Controller
@RequestMapping("/marketinfo")
public class MarketInfoController {


	@Autowired
	MarketInfoService service; 
	
	@RequestMapping("/marketInfo")
	public void clinicPage() {
		
		System.out.println("marketInfo호출");
		
	}
	
	@GetMapping("/marketMarker")
	@ResponseBody
	public List<HashMap<String, Object>> clinicDetail(Model model) {
		
		System.out.println("marketMarker호출");
		List<HashMap<String, Object>> market = service.getAllmarket(); 
		System.out.println(market);
		
        return market; 
		
	}

	
	@GetMapping("/searchAll")
	@ResponseBody
	public List<Map<String, String>> searchAll(Model m) {
		
		System.out.println("searchAll 요청");
		
		List<Map<String, String>> marketAll = service.getAllmarketInfo();
		m.addAttribute("searchAll",marketAll); 
	
		return marketAll;
	}
	
	@GetMapping("/searchByLocation")
	@ResponseBody
	public List<HashMap<String, Object>> searchByLocation(@RequestParam("location") String location) {
		
		System.out.println("searchByLocation 요청");
		
		List<HashMap<String, Object>> Data = service.searchByLocation(location);
	
		return Data;
	}
	
	
	
}
