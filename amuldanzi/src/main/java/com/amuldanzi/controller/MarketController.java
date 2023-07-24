package com.amuldanzi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amuldanzi.domain.MarketGoodsDTO;
import com.amuldanzi.service.LoginService;
import com.amuldanzi.service.MarketService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@CrossOrigin(origins = "http://192.168.0.69:3000")
@Controller
@RequestMapping("/market")
public class MarketController {

	@Autowired
	private LoginService loginService;

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private MarketService marketservice;
	

	// 페이지 이동
	@RequestMapping("/{step}")
	public String login(@PathVariable String step, Model m) {

		Map<String, Object> map = headerChange();
		m.addAttribute("id", map.get("id"));
		m.addAttribute("memberRole", map.get("memberRole"));

		return "/market/" + step;
	}

	// 페이지 이동시 회원역할에 따른 헤더 변경하기 함수
	private Map<String, Object> headerChange() {
		Map<String, Object> map = new HashMap<String, Object>();
		Cookie[] cookies = request.getCookies();
		String accessToken = null;

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("access_token".equals(cookie.getName())) {
					accessToken = cookie.getValue();
					break;
				}
			}
		}

		if (accessToken != null) {
			String id = (String) loginService.getClaims(accessToken).get("id");
			String memberRole = (String) loginService.getClaims(accessToken).get("memberRole");
			map.put("memberRole", memberRole);
			map.put("id", id);

		} else {
			map.put("memberRole", "");
			map.put("id", "");

		}
		return map;

	}// 페이지 이동시 회원역할에 따른 헤더 변경하기 끝
	
	@RequestMapping("carrot")
	public String carrot(@RequestParam(required = false, defaultValue = "0", value = "page") int pageNo, Model m) {
	    // headerChange() 메서드를 통해 헤더 정보를 가져옴
	    Map<String, Object> map = headerChange();
	    // 헤더 정보를 모델에 추가
	    m.addAttribute("id", map.get("id"));
	    m.addAttribute("memberRole", map.get("memberRole"));

	    // Pageable 객체를 생성하여 페이징 정보 설정
	    Pageable paging = PageRequest.of(pageNo, 12, Sort.by("goodsId").descending());

	    // marketservice를 사용하여 물품 목록을 페이징하여 가져옴
	    Page<MarketGoodsDTO> resultPage = marketservice.findMarketCate(paging);
	    List<MarketGoodsDTO> marketList = resultPage.getContent();

	    // 전체 페이지 수와 현재 페이지 번호를 가져옴
	    int totalPages = resultPage.getTotalPages();
	    int currentPage = resultPage.getNumber();

	    // 페이지 그룹 크기를 10으로 설정
	    int pageSize = 10;

	    // 현재 페이지가 속한 페이지 그룹의 첫 페이지와 마지막 페이지를 계산
	    int startPage = (currentPage / pageSize) * pageSize;
	    int endPage = Math.min(startPage + pageSize - 1, totalPages - 1);

	    // 모델에 물품 목록, 페이징 정보, 페이지 그룹 정보를 추가하여 JSP로 전달
	    m.addAttribute("marketList", marketList);
	    m.addAttribute("totalPages", totalPages);
	    m.addAttribute("currentPage", currentPage);
	    m.addAttribute("startPage", startPage);
	    m.addAttribute("endPage", endPage);

	    return "market/carrot"; // 여기에 JSP 페이지의 이름을 입력해주세요
	}
	
	@RequestMapping("dolbomiShop")
	public String dolbomiShop(@RequestParam(required = false, defaultValue = "0", value = "page") int pageNo, Model m) {
	    // headerChange() 메서드를 통해 헤더 정보를 가져옴
	    Map<String, Object> map = headerChange();
	    // 헤더 정보를 모델에 추가
	    m.addAttribute("id", map.get("id"));
	    m.addAttribute("memberRole", map.get("memberRole"));

	    // Pageable 객체를 생성하여 페이징 정보 설정
	    Pageable paging = PageRequest.of(pageNo, 12, Sort.by("goodsId").descending());

	    // marketservice를 사용하여 물품 목록을 페이징하여 가져옴
	    Page<MarketGoodsDTO> resultPage = marketservice.findDolbomiCate(paging);
	    List<MarketGoodsDTO> marketList = resultPage.getContent();

	    // 전체 페이지 수와 현재 페이지 번호를 가져옴
	    int totalPages = resultPage.getTotalPages();
	    int currentPage = resultPage.getNumber();

	    // 페이지 그룹 크기를 10으로 설정
	    int pageSize = 10;

	    // 현재 페이지가 속한 페이지 그룹의 첫 페이지와 마지막 페이지를 계산
	    int startPage = (currentPage / pageSize) * pageSize;
	    int endPage = Math.min(startPage + pageSize - 1, totalPages - 1);

	    // 모델에 물품 목록, 페이징 정보, 페이지 그룹 정보를 추가하여 JSP로 전달
	    m.addAttribute("marketList", marketList);
	    m.addAttribute("totalPages", totalPages);
	    m.addAttribute("currentPage", currentPage);
	    m.addAttribute("startPage", startPage);
	    m.addAttribute("endPage", endPage);

	    return "market/dolbomiShop"; // 여기에 JSP 페이지의 이름을 입력해주세요
	}
	



}
