package com.amuldanzi.config;

import org.quartz.JobDataMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.scheduling.quartz.SimpleTriggerFactoryBean;

import com.amuldanzi.scheduling.MyJob;
import com.amuldanzi.service.LoginService;



@Configuration
public class QuartzConfig {
	
	@Autowired
	LoginService loginService;

    // 쿼리를 실행할 Job 클래스를 생성합니다.
    @Bean
    public JobDetailFactoryBean myJobDetail() {
        JobDetailFactoryBean factoryBean = new JobDetailFactoryBean();
        factoryBean.setJobClass(MyJob.class); // MyJob은 실행할 쿼리를 포함하는 클래스입니다.
        factoryBean.setDurability(true);
        
        JobDataMap jobDataMap = new JobDataMap();
        jobDataMap.put("loginService", loginService);
        factoryBean.setJobDataMap(jobDataMap);
        
        return factoryBean;
    }

    // Job을 실행할 스케줄을 정의합니다.
/*    @Bean
    public SimpleTriggerFactoryBean myJobTrigger() {
        SimpleTriggerFactoryBean factoryBean = new SimpleTriggerFactoryBean();
        factoryBean.setJobDetail(myJobDetail().getObject());
        factoryBean.setRepeatInterval(86400000); // 24시간 (1일) 마다 실행
        return factoryBean;
    }
*/ 
    @Bean
    public CronTriggerFactoryBean myJobTrigger() {
        CronTriggerFactoryBean factoryBean = new CronTriggerFactoryBean();
        factoryBean.setJobDetail(myJobDetail().getObject());
        							// second minute hour day-of-month month day-of-week
        factoryBean.setCronExpression("0 0 1 * * ?"); // Run at 1:00 AM every day
        return factoryBean;
    }

    // 스케줄러 설정
    @Bean
    public SchedulerFactoryBean schedulerFactory() {
        SchedulerFactoryBean schedulerFactoryBean = new SchedulerFactoryBean();
        schedulerFactoryBean.setTriggers(myJobTrigger().getObject());
        return schedulerFactoryBean;
    }
}
