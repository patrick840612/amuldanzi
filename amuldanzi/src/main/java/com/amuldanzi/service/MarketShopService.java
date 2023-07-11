package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.MarketDTO;

public interface MarketShopService {

	List<MarketDTO> getMarketShopList();

	MarketDTO marketshopList(MarketDTO dto);

	void marketShopUpdate(MarketDTO marketShop);


}
