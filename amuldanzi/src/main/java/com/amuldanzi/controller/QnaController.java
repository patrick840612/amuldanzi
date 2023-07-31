package com.amuldanzi.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amuldanzi.service.LoginService;

import jakarta.servlet.http.HttpServletRequest;



@Controller
@RequestMapping("/qna")
public class QnaController {
	
	
	@RequestMapping("/{step}")
	public String login(@PathVariable String step) {
		return "/qna/"+step;
	}

	
	
	@RequestMapping("/header")
	public void header() {
		
	}
	
	@RequestMapping("/index")
	public void index() {
		
	}
	
	@RequestMapping("/login")
	public void login() {
		
	}
	
	@RequestMapping("/mainSearch")
	public void mainSearch() {
	
	}
	
	@RequestMapping("/viewBasic")
	public void viewBasic() {
		
	}
	@RequestMapping("/eduList")
	public void eduList() {
		
	}
	@RequestMapping("/basicInsert")
	public void basicInsert() {
		
	}
	
	@RequestMapping("/write")
	public void write() {
		
	}
	
	@RequestMapping("/qnalist")
	public void qnalist() {
		
	}
	
	@RequestMapping("/register")
	private void register() {
		// TODO Auto-generated method stub

	}

}
