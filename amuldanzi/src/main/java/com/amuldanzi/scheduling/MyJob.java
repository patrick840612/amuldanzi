package com.amuldanzi.scheduling;

import java.util.List;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amuldanzi.domain.JwtDTO;
import com.amuldanzi.service.LoginService;

@Component
public class MyJob implements Job {

	@Autowired
	LoginService loginService;
	

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
    	 JobDataMap jobDataMap = context.getMergedJobDataMap();
    	 
         // 유효기간 지난 토큰 데이터 삭제(1일 1회)
    	 LoginService loginService = (LoginService) jobDataMap.get("loginService");
    	 List<JwtDTO> jwtlist = loginService.findAll();
    
    }
}