package com.amuldanzi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class MemberPetEntity {


	private String memberPetId;
	private String petName;
	private String whichPet;
	private String petBlood;
	private String gps;
	
	
}
