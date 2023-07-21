package com.amuldanzi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

@CrossOrigin(origins = "http://192.168.0.69:3000")
@Controller
@RequestMapping("/market")
public class MarketController {
	
	@RequestMapping("/main")
	public void main() {
		
	}
	
	@RequestMapping("/gsHomeShop")
	public void gsHomeShop() {
		
	}
	
	@RequestMapping("/carrot")
	public void carrot() {
		
	}
	
	@RequestMapping("/carrotShop")
	public void carrotShop() {
		
	}
	
	@RequestMapping("/jungoDetail")
	public void jungoDetail() {
		
	}
	
	@RequestMapping("/shopDetail")
	public void shopDetail() {
		
	}
	
	@RequestMapping("/shopDetail2")
	public void shopDetail2() {
		
	}
	
	@RequestMapping("/dolbomiShop")
	public void dolbomiShop() {
		
	}
	
}
