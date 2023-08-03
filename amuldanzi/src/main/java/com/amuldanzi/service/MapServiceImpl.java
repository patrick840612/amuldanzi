package com.amuldanzi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.persistence.MapRepository;

@Service
public class MapServiceImpl implements MapService{

	@Autowired
	private MapRepository mapRepository;
	 
	@Override
	public List<HashMap<String, Object>> getSeoulData() {
		List<Object[]> regionData = mapRepository.findByLocation("서울");

        List<HashMap<String, Object>> result = new ArrayList<>();
        for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("blood_tel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getBusanData() {
		List<Object[]> regionData = mapRepository.findByLocation("제주");

        List<HashMap<String, Object>> result = new ArrayList<>();
        for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getJejuData() {
		List<Object[]> regionData = mapRepository.findByLocation("부산");

        List<HashMap<String, Object>> result = new ArrayList<>();
        for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getDaeguData() {
		List<Object[]> regionData = mapRepository.findByLocation("대구");

        List<HashMap<String, Object>> result = new ArrayList<>();
        for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getIncheonDataData() {
		List<Object[]> regionData = mapRepository.findByLocation("인천");

        List<HashMap<String, Object>> result = new ArrayList<>();
        for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getGwangjuDataData() {
		List<Object[]> regionData = mapRepository.findByLocation("광주");

        List<HashMap<String, Object>> result = new ArrayList<>();
        for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getDaejeonDataData() {
		List<Object[]> regionData = mapRepository.findByLocation("대전");

        List<HashMap<String, Object>> result = new ArrayList<>();
        for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getUlsanData() {
		List<Object[]> regionData = mapRepository.findByLocation("울산");

        List<HashMap<String, Object>> result = new ArrayList<>();
        for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getSejongData() {
		List<Object[]> regionData = mapRepository.findByLocation("세종");

        List<HashMap<String, Object>> result = new ArrayList<>();
        for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}
 
	@Override
	public List<HashMap<String, Object>> getuleongData() {
		List<Object[]> regionData = mapRepository.findByLocation("울릉");

        List<HashMap<String, Object>> result = new ArrayList<>();
        for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> gwangwonData() {
		List<Object[]> regionData = mapRepository.findByLocation("강원");
		
		List<HashMap<String, Object>> result = new ArrayList<>();
		for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getChungnukData() {
		List<Object[]> regionData = mapRepository.findByLocation("충북");
		
		List<HashMap<String, Object>> result = new ArrayList<>();
		for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getChungnamData() {
		List<Object[]> regionData = mapRepository.findByLocation("충남");
		
		List<HashMap<String, Object>> result = new ArrayList<>();
		for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getJeonbukData() {
		List<Object[]> regionData = mapRepository.findByLocation("전북");
		
		List<HashMap<String, Object>> result = new ArrayList<>();
		for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getJeonnamData() {
		List<Object[]> regionData = mapRepository.findByLocation("전남");
		
		List<HashMap<String, Object>> result = new ArrayList<>();
		for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getGyungbukData() {
		List<Object[]> regionData = mapRepository.findByLocation("경북");
		
		List<HashMap<String, Object>> result = new ArrayList<>();
		for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	@Override
	public List<HashMap<String, Object>> getGyungnamData() {
		List<Object[]> regionData = mapRepository.findByLocation("경남");
		
		List<HashMap<String, Object>> result = new ArrayList<>();
		for (Object[] objArray : regionData) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("sido", objArray[0]);
            map.put("userTel", objArray[1]);
            map.put("whichPet", objArray[2]);
            map.put("petBlood", objArray[3]);
            result.add(map);
        }
		    
		    return result;
	}

	
}
