package com.amuldanzi.scheduling;

import java.util.List;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amuldanzi.domain.JwtDTO;
import com.amuldanzi.service.FileCleanupService;
import com.amuldanzi.service.LoginService;

@Component
public class MyJob implements Job {

	@Autowired
	LoginService loginService;
	
	@Autowired
	FileCleanupService fileCleanupService;

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
    	 JobDataMap jobDataMap = context.getMergedJobDataMap();
    	 
         // 유효기간 지난 토큰 데이터 삭제(1일 1회 : 매일 새벽 1시)
    	 LoginService loginService = (LoginService) jobDataMap.get("loginService");
    	 List<JwtDTO> jwtlist = loginService.findAll();
    	 
    	 // 돌보미, 쇼핑몰, 1:1문의 필요없는 파일 삭제
    	 FileCleanupService fileCleanupService = (FileCleanupService) jobDataMap.get("fileCleanupService");
    
    }
}