package com.amuldanzi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amuldanzi.domain.MarketDTO;
import com.amuldanzi.service.MarketShopService;

@Controller
@RequestMapping("/marketShop")
public class MarketShopController {
	
	@Autowired
	MarketShopService marketShopService;
	
	@RequestMapping("/marketShop")
	public void marketShop(Model m) {
		List<MarketDTO> marketshopList = marketShopService.getMarketShopList();
		m.addAttribute("marketshopList", marketshopList);
	}
	
	@RequestMapping("/marketShopDetail")
	public void marketShopDetail(MarketDTO dto, Model m) {
		
		MarketDTO marketShop = marketShopService.marketshopList(dto);
		
		marketShop.setCount(marketShop.getCount()+1);
		marketShopService.marketShopUpdate(marketShop);
		
		m.addAttribute("marketShop", marketShop);
	}

}
