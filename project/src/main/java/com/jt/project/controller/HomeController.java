package com.jt.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String homepage() {
		return "home";
	}
	
	@RequestMapping("login")
	public String loginpage() {
		return "login";
	}
}
