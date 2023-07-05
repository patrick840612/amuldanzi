package com.amuldanzi.domain;

import java.time.LocalDate;
import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {

	// 공지사항
	private Integer noticeNo;
	private String noticeCategory;
	private String noticeTitle;
	private String noticeContent;
	private Date noticedate;
	private Integer noticeReadCount;
}
