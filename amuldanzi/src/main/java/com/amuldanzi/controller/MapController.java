package com.amuldanzi.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amuldanzi.domain.MapDTO;
import com.amuldanzi.service.MapService;

@Controller
@RequestMapping("/pet")
public class MapController {

	 @Autowired
	    private MapService mapService;
	    
	
	@RequestMapping("/blood")
    public void hospital() {
		
        System.out.println("blood 요청");  
    }
	
		// 서울 데이터 요청 
	    @GetMapping("/seoulData")
	    @ResponseBody
	    public List<HashMap<String,Object>> getSeoulData(Model m) {
	    	List<HashMap<String,Object>> seoulData = mapService.getSeoulData();
	        System.out.println(seoulData); 
	     return seoulData;   
	        
	    }
	    // 제주 데이터 요청 
	       @GetMapping("/jejuData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getJejuData(Model m) {
	           List<HashMap<String,Object>> jejuData = mapService.getJejuData();
	           System.out.println(jejuData); 
	        return jejuData;   
	           
	       }
	       
	       // 부산 데이터 요청 
	       @GetMapping("/busanData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getBusanData(Model m) {
	           List<HashMap<String,Object>> busanData = mapService.getBusanData();
	           System.out.println(busanData); 
	        return busanData;   
	           
	       }
	       
	       // 대구 데이터 요청 
	       @GetMapping("/daeguData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getDaeguData(Model m) {
	           List<HashMap<String,Object>> daeguData = mapService.getDaeguData();
	           System.out.println(daeguData); 
	        return daeguData;   
	           
	       }
	       
	       // 인천 데이터 요청
	       @GetMapping("/incheonData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getIncheonDataData(Model m) {
	           List<HashMap<String,Object>> incheonData = mapService.getIncheonDataData();
	           System.out.println(incheonData); 
	        return incheonData;   
	           
	       }
	       
	       // 광주 데이터 요청
	       @GetMapping("/gwangjuData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getGwangjuDataData(Model m) {
	           List<HashMap<String,Object>> gwangjuData = mapService.getGwangjuDataData();
	           System.out.println(gwangjuData); 
	        return gwangjuData;   
	           
	       }
	       
	       // 대전 데이터 요청
	       @GetMapping("/daejeonData")
	       @ResponseBody
	       public List<HashMap<String, Object>> getDaejeonDataData(Model m) {
	           List<HashMap<String,Object>> daejeonData = mapService.getDaejeonDataData();
	           System.out.println(daejeonData); 
	        return daejeonData;   
	           
	       }
	       
	       // 울산 데이터 요청
	       @GetMapping("/ulsanData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getUlsanData(Model m) {
	           List<HashMap<String,Object>> ulsanData = mapService.getUlsanData();
	           System.out.println(ulsanData); 
	        return ulsanData;   
	           
	       }
	       
	       // 세종 데이터 요청 
	       @GetMapping("/sejongData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getSejongData(Model m) {
	           List<HashMap<String,Object>> sejongData = mapService.getSejongData();
	           System.out.println(sejongData); 
	        return sejongData;   
	           
	       }
	       
	       // 충청도 데이터 요청
	       @GetMapping("/chungcheongData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getChungcheongData(Model m) {
	           List<HashMap<String,Object>> chungcheongData = mapService.getChungcheongData();
	           System.out.println(chungcheongData); 
	        return chungcheongData;   
	           
	       }
	       
	       // 전라도 데이터 요청  
	       @GetMapping("/jeonlaData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getJeonlaData(Model m) {
	           List<HashMap<String,Object>> jeonlaData = mapService.getJeonlaData();
	           System.out.println(jeonlaData); 
	        return jeonlaData;   
	           
	       } 
	       
	       // 경상도 데이터 요청
	       @GetMapping("/gyungsangData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getGyungsangData(Model m) {
	           List<HashMap<String,Object>> gyungsangData = mapService.getGyungsangData();
	           System.out.println(gyungsangData); 
	        return gyungsangData;   
	           
	       }
	       
	       // 울릉도 데이터 요청
	       @GetMapping("/uleongData")
	       @ResponseBody
	       public List<HashMap<String,Object>> getuleongData(Model m) {
	           List<HashMap<String,Object>> uleongData = mapService.getuleongData();
	           System.out.println(uleongData); 
	        return uleongData;   
	           
	       }
	       
	       // 강원도 데이터 요청
	       @GetMapping("/gwangwonData")
	       @ResponseBody
	       public List<HashMap<String,Object>> gwangwonData(Model m) {
	           List<HashMap<String,Object>> gwangwonData = mapService.gwangwonData();
	           System.out.println(gwangwonData); 
	        return gwangwonData;   
	           
	       }
}




