package com.amuldanzi.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.amuldanzi.domain.CartDTO;
import com.amuldanzi.domain.CommerceDTO;
import com.amuldanzi.domain.JungoLikeDTO;
import com.amuldanzi.domain.MarketCategoryDTO;
import com.amuldanzi.domain.MarketGoodsDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.OrderItemsDTO;
import com.amuldanzi.domain.OrdersDTO;
import com.amuldanzi.entity.OrderItemsEntity;
import com.amuldanzi.persistence.CommerceRepository;
import com.amuldanzi.persistence.MemberRepository;
import com.amuldanzi.persistence.OrdersRepository;
import com.amuldanzi.service.LoginService;
import com.amuldanzi.service.MarketService;
import com.amuldanzi.util.MD5Generator;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;

@CrossOrigin(origins = "http://192.168.0.36:3000")
@Controller
@RequestMapping("/market")
public class MarketController {

	@Autowired
	private LoginService loginService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private MarketService marketservice;

	@Autowired
	private CommerceRepository commerceRepository;

	@Autowired
	private MemberRepository memberInfoRepository;

	@Autowired
	private OrdersRepository ordersRepository;

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
	@Transactional
	public void jungoDetail(MarketGoodsDTO dto, Model m) {

		// headerChange() 메서드를 통해 헤더 정보를 가져옴
		Map<String, Object> map = headerChange();
		// 헤더 정보를 모델에 추가
		m.addAttribute("id", map.get("id"));
		m.addAttribute("memberRole", map.get("memberRole"));

		MarketGoodsDTO result = marketservice.findById(dto.getGoodsId());
		result.setGoodsCount(result.getGoodsCount() + 1);
		marketservice.save(result);
		m.addAttribute("marketList", result);

		// DB에서 가져온 날짜
		Timestamp dbTime = result.getGoodsDate();

		// 현재 시간을 가져옴
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());

		// 두 시간 사이의 차이 계산
		long milliseconds = currentTime.getTime() - dbTime.getTime();
		int seconds = (int) milliseconds / 1000;

		// 초를 분, 시간, 일로 변환
		int minutes = seconds / 60;
		int hours = minutes / 60;
		int days = hours / 24;

		m.addAttribute("hours", hours);
		m.addAttribute("minutes", minutes);

		JungoLikeDTO likeCheck = marketservice.findByGoodsIdAndMemberId(dto.getGoodsId(), map.get("id"));

		if (likeCheck != null) {
			m.addAttribute("hasLike", 1);
		} else {
			m.addAttribute("hasLike", 0);
		}
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
			ResponseEntity<String> response = restTemplate.getForEntity("http://192.168.0.36:5000/viewer.html",
					String.class);
			iframeAccessible = response.getStatusCode() == HttpStatus.OK;
		} catch (Exception e) {
			iframeAccessible = false;
		}

		// iframe 접근 가능 여부를 모델에 추가
		m.addAttribute("iframeAccessible", iframeAccessible);

		// -------------------------------------------------------------------------------------------------------
		List<CommerceDTO> result = marketservice.findAllCommerce();
		m.addAttribute("commerceList", result);

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

	// 관심 버튼 구현
	@PostMapping("/like")
	@ResponseBody
	@Transactional
	public String CommLike(String goodsId, String memberId) {

		System.out.println("*-********* like 호출 ***************");
		System.out.println(memberId);
		System.out.println("***********************************");

		// 중고 글에 관심 정보 저장
		marketservice.saveLike(goodsId, memberId);
		marketservice.plusLikeByPk(goodsId);

		return "redirect:/community/communityDetail?comm_no=" + goodsId;

	}

	// 관심버튼 한번 더 누르면 관심 횟수 철회 구현
	@DeleteMapping("/unlike")
	@ResponseBody
	@Transactional
	public void CommUnlike(String goodsId, String memberId) {

		// 저장정보 삭제
		marketservice.deleteLike(goodsId, memberId);
		marketservice.minusLikeByPk(goodsId);

	}

	// 관심 수 구현
	@GetMapping("/likeCount")
	@ResponseBody
	public Map<String, Integer> getLikeCount(@RequestParam("goodsId") Integer goodsId) {

		Integer likeCount = marketservice.getLikeCount(goodsId);

		// 관심 갯수를 Map에 담아서 반환
		Map<String, Integer> result = new HashMap<>();
		result.put("likeCount", likeCount);

		System.out.println(likeCount);

		return result;
	}

	@RequestMapping("/amulDetail")
	public void amulDetail(@RequestParam(required = false, defaultValue = "0", value = "commerceId") int commerceId,
			Model m) {

		// headerChange() 메서드를 통해 헤더 정보를 가져옴
		Map<String, Object> map = headerChange();
		// 헤더 정보를 모델에 추가
		m.addAttribute("id", map.get("id"));
		m.addAttribute("memberRole", map.get("memberRole"));

		// -------------------------------------------------------------
		// commerceId가 없을 시 처리..
		CommerceDTO result = marketservice.findByCommerceId(commerceId);

		m.addAttribute("list", result);
		m.addAttribute("commmerceId", commerceId);

		if (result.getCommercePer() != 0) {
			m.addAttribute("price", result.getCommercePrice() - result.getCommercePrice() / result.getCommercePer());
		}

	}

	@RequestMapping(value = "/dolbomiSave", method = RequestMethod.POST)
	public String dolbomiSave(@RequestParam("file") MultipartFile file, MarketGoodsDTO dto, Model m) {
		// headerChange() 메서드를 통해 헤더 정보를 가져옴
		Map<String, Object> map = headerChange();
		// 헤더 정보를 모델에 추가
		m.addAttribute("id", map.get("id"));
		m.addAttribute("memberRole", map.get("memberRole"));

		MarketCategoryDTO cate = new MarketCategoryDTO();
		cate.setCateId(2);
		cate.setCateName("돌보미마켓");

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

		return "redirect:/market/dolbomiShop";

	}

	@RequestMapping("/dolbomiDetail")
	@Transactional
	public void dolbomiDetail(MarketGoodsDTO dto, Model m) {

		// headerChange() 메서드를 통해 헤더 정보를 가져옴
		Map<String, Object> map = headerChange();
		// 헤더 정보를 모델에 추가
		m.addAttribute("id", map.get("id"));
		m.addAttribute("memberRole", map.get("memberRole"));

		MarketGoodsDTO result = marketservice.findById(dto.getGoodsId());
		result.setGoodsCount(result.getGoodsCount() + 1);
		marketservice.save(result);
		m.addAttribute("marketList", result);

		// DB에서 가져온 날짜
		Timestamp dbTime = result.getGoodsDate();

		// 현재 시간을 가져옴
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());

		// 두 시간 사이의 차이 계산
		long milliseconds = currentTime.getTime() - dbTime.getTime();
		int seconds = (int) milliseconds / 1000;

		// 초를 분, 시간, 일로 변환
		int minutes = seconds / 60;
		int hours = minutes / 60;
		int days = hours / 24;

		m.addAttribute("hours", hours);
		m.addAttribute("minutes", minutes);

		JungoLikeDTO likeCheck = marketservice.findByGoodsIdAndMemberId(dto.getGoodsId(), map.get("id"));

		if (likeCheck != null) {
			m.addAttribute("hasLike", 1);
		} else {
			m.addAttribute("hasLike", 0);
		}
	}

	@PostMapping("/cartSave")
	public ResponseEntity<Map<String, String>> addCart(@RequestParam("commerceId") Integer commerceId,
			@RequestParam("id") String id) {
		CommerceDTO commerce = commerceRepository.findById(commerceId)
				.orElseThrow(() -> new IllegalArgumentException("Invalid commerce Id:" + commerceId));
		MemberInfoDTO member = memberInfoRepository.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid member Id:" + id));

		Map<String, String> response = new HashMap<>();

		if (marketservice.cartCheck(member, commerce)) {
			response.put("message", "이미 장바구니에 담긴 상품입니다.");
		} else {
			CartDTO cart = new CartDTO();
			cart.setCommerce(commerce);
			cart.setMemberInfo(member);
			cart.setCount(1); // default count is 1. Change this as needed.

			marketservice.cartSave(cart);
			response.put("message", "장바구니에 상품이 추가되었습니다.");
		}

		return ResponseEntity.ok(response);
	}

	@RequestMapping("/amulCart")
	public void amulCart(Model m) {

		// headerChange() 메서드를 통해 헤더 정보를 가져옴
		Map<String, Object> map = headerChange();
		// 헤더 정보를 모델에 추가
		m.addAttribute("id", map.get("id"));
		m.addAttribute("memberRole", map.get("memberRole"));

		Optional<MemberInfoDTO> memberDTOOptional = memberInfoRepository.findById((String) map.get("id"));

		if (memberDTOOptional.isPresent()) {
			MemberInfoDTO memberDTO = memberDTOOptional.get();
			m.addAttribute("member", memberDTO);
		}

		List<CartDTO> cartResult = marketservice.findCartById(map.get("id"));

		if (cartResult.isEmpty()) {
			m.addAttribute("cartList", null);
		} else {
			m.addAttribute("cartList", cartResult);
			int count = cartResult.size();
			m.addAttribute("cartCount", count);
		}

	}

	@RequestMapping("/cartDelete")
	public String cartDelete(@RequestParam(required = false, value = "cartId") int cartId, Model m) {

		// headerChange() 메서드를 통해 헤더 정보를 가져옴
		Map<String, Object> map = headerChange();
		// 헤더 정보를 모델에 추가
		m.addAttribute("id", map.get("id"));
		m.addAttribute("memberRole", map.get("memberRole"));

		// -------------------------------------------------------------
		marketservice.deleteCartByCartId(cartId);

		return "redirect:/market/amulCart";

	}

	@PostMapping("/updateCartCount")
	public ResponseEntity<Map<String, String>> updateCartCount(@RequestParam("id") String id,
			@RequestParam("commerceId") Integer commerceId, @RequestParam("count") Integer count) {
		CommerceDTO commerce = commerceRepository.findById(commerceId)
				.orElseThrow(() -> new IllegalArgumentException("Invalid commerce Id:" + commerceId));
		MemberInfoDTO member = memberInfoRepository.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid member Id:" + id));

		CartDTO cart = marketservice.findByMemberInfoAndCommerce(member, commerce)
				.orElseThrow(() -> new IllegalArgumentException("No cart found with given member Id and commerce Id"));
		cart.setCount(count);

		marketservice.cartSave(cart);

		Map<String, String> response = new HashMap<>();
		response.put("message", "장바구니 상품 수량이 업데이트 되었습니다.");

		return ResponseEntity.ok(response);
	}

	@PostMapping("/cartDelete")
	@ResponseBody
	public String cartDelete(@RequestBody Map<String, List<Integer>> requestBody) {
		List<Integer> cartIds = requestBody.get("cartIds");

		// headerChange() 메서드를 통해 헤더 정보를 가져옴
		Map<String, Object> map = headerChange();
		// 헤더 정보를 모델에 추가
		String userId = (String) map.get("id");

		for (int cartId : cartIds) {
			marketservice.cartDelete(cartId);
		}

		return "Success";
	}

	@PostMapping("/paySuccess")
	@ResponseBody
	public Integer processPayment(@RequestBody OrdersDTO dto) {
		// headerChange() 메서드를 통해 헤더 정보를 가져옴
		Map<String, Object> map = headerChange();

		MemberInfoDTO memberInfo = new MemberInfoDTO();
		memberInfo.setId((String) map.get("id"));
		dto.setMemberInfo(memberInfo);
		dto.setOrderStatus("결제완료");

		// 받은 결제 정보를 데이터베이스에 저장하는 로직
		Integer orderId = marketservice.ordersSave(dto);

		// 실제 환경에서는 서비스 클래스를 이용하여 비즈니스 로직을 처리합니다.

		// 처리가 성공적으로 끝났다면 클라이언트에게 성공 메시지를 보냅니다.
		return orderId;
	}

	@PostMapping("/saveProductInfo")
	@ResponseBody
	public String saveProductInfo(@RequestBody OrderItemsEntity entity) {
		
		// headerChange() 메서드를 통해 헤더 정보를 가져옴
		Map<String, Object> map = headerChange();
		    
		// commerceId를 사용하여 CommerceDTO 객체를 찾음
		CommerceDTO commerce = commerceRepository.findById(entity.getCommerceId()).get();
		    
		// orderId를 사용하여 OrdersDTO 객체를 찾음
		OrdersDTO orders = ordersRepository.findById(entity.getOrderId()).get();

		// OrderItemsDTO 객체를 생성하고 데이터를 설정
		OrderItemsDTO dto = new OrderItemsDTO();
		dto.setCommerce(commerce);
		dto.setOrders(orders);
		dto.setCount(entity.getCount());
		dto.setPrice(entity.getPrice());
	    
	    // OrderItemsDTO 객체를 데이터베이스에 저장
	    marketservice.saveOrderItems(dto);
	    
	    commerce.setCommerceStock(commerce.getCommerceStock()-entity.getCount());
	    marketservice.updateCommerce(commerce);
	    
	    marketservice.deleteCartByCartId(entity.getCartId());

	    return "Product info has been saved successfully";
	}
	
}
