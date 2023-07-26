package com.amuldanzi.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberUpdateDTO {

    private MemberInfoDTO member;
    private List<MemberPetDTO> pets;
	
}
