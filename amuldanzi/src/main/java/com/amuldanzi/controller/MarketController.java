package com.amuldanzi.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.amuldanzi.domain.MarketCategoryDTO;
import com.amuldanzi.domain.MarketGoodsDTO;
import com.amuldanzi.service.LoginService;
import com.amuldanzi.service.MarketService;
import com.amuldanzi.util.MD5Generator;

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
	
	@RequestMapping("/carrot")
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
	
	@RequestMapping("/dolbomiShop")
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
	
	@RequestMapping("/jungoDetail")
	public void jungoDetail(MarketGoodsDTO dto, Model m) {
		
		// headerChange() 메서드를 통해 헤더 정보를 가져옴
	    Map<String, Object> map = headerChange();
	    // 헤더 정보를 모델에 추가
	    m.addAttribute("id", map.get("id"));
	    m.addAttribute("memberRole", map.get("memberRole"));
	    
	    MarketGoodsDTO result = marketservice.findById(dto.getGoodsId());
		m.addAttribute("marketList",result);
		
	}
	
	@RequestMapping("/gsHomeShop")
	public String gsHomeShop(Model m) {
	    // headerChange() 메서드를 통해 헤더 정보를 가져옴
	    Map<String, Object> map = headerChange();
	    // 헤더 정보를 모델에 추가
	    m.addAttribute("id", map.get("id"));
	    m.addAttribute("memberRole", map.get("memberRole"));

	    // iframe URL 접근 가능 여부 확인
	    RestTemplate restTemplate = new RestTemplate();
	    boolean iframeAccessible;

	    try {
	        ResponseEntity<String> response = restTemplate.getForEntity("http://192.168.0.69:5000/viewer.html", String.class);
	        iframeAccessible = response.getStatusCode() == HttpStatus.OK;
	    } catch (Exception e) {
	        iframeAccessible = false;
	    }

	    // iframe 접근 가능 여부를 모델에 추가
	    m.addAttribute("iframeAccessible", iframeAccessible);

	    return "market/gsHomeShop"; //
	}
	
	@RequestMapping(value = "/jungoSave", method = RequestMethod.POST)
	public String jungoSave(@RequestParam("file") MultipartFile file, MarketGoodsDTO dto, Model m) {
		// headerChange() 메서드를 통해 헤더 정보를 가져옴
	    Map<String, Object> map = headerChange();
	    // 헤더 정보를 모델에 추가
	    m.addAttribute("id", map.get("id"));
	    m.addAttribute("memberRole", map.get("memberRole"));
	    
	    MarketCategoryDTO cate = new MarketCategoryDTO();
	    cate.setCateId(1);
	    cate.setCateName("중고마켓");
	    
	    dto.setMarketCate(cate);
	    dto.setGoodsCount(0);
	    dto.setGoodsQuality("new");
		
	    try {
	        String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\market";

	        if (!new File(savePath).exists()) {
	            new File(savePath).mkdir(); // 이미지 폴더 생성
	        }

	        String oriFilename = file.getOriginalFilename();

	        if (oriFilename != null && !oriFilename.equals("")) {
	            String filename = new MD5Generator(oriFilename).toString();
	            String filepath = savePath + "\\" + filename;
	            file.transferTo(new File(filepath));

	            dto.setImg(filename);
	            dto.setImgPath(filepath);
	        }

	        // 데이터베이스에 저장
	        System.out.println(dto.toString());
	        marketservice.jungoSave(dto);
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        // 업로드 실패 처리
	        System.out.println("예외 메시지: " + ex.getMessage());
	        return "redirect:/admin/adminContentInsert?error";
	    }

	    return "redirect:/market/carrot";
			
	}
	
}
