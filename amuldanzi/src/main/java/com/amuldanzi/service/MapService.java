package com.amuldanzi.service;

import java.util.HashMap;
import java.util.List;

public interface MapService {

	// 서울 데이터 검색결과 호출 함수 
	List<HashMap<String, Object>> getSeoulData();
	
	// 부산 데이터 검색결과 호출 함수 
	List<HashMap<String, Object>> getBusanData();

	// 제주 데이터 검색결과 호출 함수 
	List<HashMap<String, Object>> getJejuData();

	// 대구 데이터 검색결과 호출 함수 
	List<HashMap<String, Object>> getDaeguData();

	// 인천 데이터 검색결과 호출 함수 
	List<HashMap<String, Object>> getIncheonDataData();

	// 광주 데이터 검색결과 호출 함수 
	List<HashMap<String, Object>> getGwangjuDataData();

	// 대전 데이터 검색결과 호출 함수 
	List<HashMap<String, Object>> getDaejeonDataData();

	// 울산 데이터 검색결과 호출 함수 
	List<HashMap<String, Object>> getUlsanData();

	// 세종 데이터 검색결과 호출 함수 
	List<HashMap<String, Object>> getSejongData();

	List<HashMap<String, Object>> getChungnukData();

	List<HashMap<String, Object>> getChungnamData();

	List<HashMap<String, Object>> getJeonbukData();

	List<HashMap<String, Object>> getJeonnamData();

	List<HashMap<String, Object>> getGyungbukData();

	List<HashMap<String, Object>> getGyungnamData();

	// 울릉도 데이터 검색결과 호출 함수 
	List<HashMap<String, Object>> getuleongData();

	// 강원도 데이터 검색결과 호출 함수
	List<HashMap<String, Object>> gwangwonData();

	List<HashMap<String, Object>> getKyungkiData();

	
 
 
}
