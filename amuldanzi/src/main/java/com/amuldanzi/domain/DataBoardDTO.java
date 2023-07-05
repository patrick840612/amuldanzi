package com.amuldanzi.domain;

import lombok.Data;

@Data
public class DataBoardDTO {

	// 케어정보
	private Integer careseq;
	private String careanimal;
	private String caretitle;
	private String carevideo;
	private String carevideoPath;
	private String careimg;
	private String careimgPath;
	private String careinfo;
	
	// 병원정보
	private Integer clinicId;
	private String clinicName;
	private String clinicTel;
	private String clinicMajor;
	private String clinicAddr;
	private String clinicLat;
	private String clinicLng;
	private String clinicOpen;
	private String clinicClose;
	
	// 마켓정보
	private Integer marketId;
	private String marketName;
	private String marketTel;
	private String marketSale;
	private String marketAddr;
	private String marketLat;
	private String marketLng;
	private String marketOpen;
	private String marketClose;
	
	// 교육정보
	private Integer eduId;
	private String eduanimal;
	private String edutitle;
	private String edustep;
	private String educontent;
	private String edulevel;
	private String eduimg;
	private String eduimgPath;
	private String eduvideo;
	private String eduvideoPath;
	

	
	
}
