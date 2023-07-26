package com.amuldanzi.controller;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amuldanzi.service.LoginService;
import com.amuldanzi.socket.Client;
import com.amuldanzi.util.MD5Generator;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UploadController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private HttpServletRequest request;
	
 
    @RequestMapping("/uploadForm")
    public String uploadForm(Model m) {
    	
    	Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
    	
        return "pet/emotion";
    }

 // 페이지 이동시 회원역할에 따른 헤더 변경하기 함수
 	private Map<String,Object> headerChange() {
 			Map<String,Object> map = new HashMap<String, Object>();
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

 				if(accessToken != null) {
 			        String id = (String)loginService.getClaims(accessToken).get("id");
 			        String memberRole = (String)loginService.getClaims(accessToken).get("memberRole");
 			        map.put("memberRole", memberRole);
 			        map.put("id", id);

 				}else {
 			        map.put("memberRole", "");
 			        map.put("id", "");

 				}
 				return map;
 				
 			}// 페이지 이동시 회원역할에 따른 헤더 변경하기 끝
    
    @PostMapping("/upload")
    @ResponseBody
    public String uploadFile(@RequestParam("imageFile") MultipartFile file,
                             RedirectAttributes redirectAttributes) throws IOException, NoSuchAlgorithmException{
        
    	// 업로드할 파일이 선택되지 않는 경우 다시 원래의 Form으로 반환 
    	if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload.");
            return "redirect:/uploadForm";
        }

    	// 업로드할 파일이 선택된 경우
        try {
        	
        	String origgilename = file.getOriginalFilename();
        	
        	// 원본 피일 이름을 정리 안전한 파일 경로 생성 
            String fileName =  new MD5Generator(origgilename).toString(); 
            // 현재 작업 디렉토리 + 하위 디렉토리 경로 설정 이미지가 저장되도록 
            String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\pet\\upload";
             
            // savePath 가 존재하지 않으면 해당 디렉토리 생성
            if(!new File(savePath).exists()) { 
				 new File(savePath).mkdir(); 
			 }
            // 최종 파일경로 생성 
            String filepath = savePath + "\\" + fileName;
            file.transferTo(new File(filepath));
            
            // 클라이언트에 저장된 함수 불러오기
            Client c = new Client();
            // filepath 를 인자로 전달하여 클라이언트측의 check 함수 호출 해당 파일 분석결과 반환
            String result =  c.check(filepath);
             
            // 결과값 리턴
            System.out.println(result); 
            System.out.println(fileName); 
                      
            return result;
        } catch (IOException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "Failed to upload the file.");
        } 
        	return "redirect:/uploadForm";
    }
	
}
