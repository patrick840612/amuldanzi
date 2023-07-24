package com.amuldanzi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class AmuldanziApplication {

	public static void main(String[] args) {
		SpringApplication.run(AmuldanziApplication.class, args);
	}

}
