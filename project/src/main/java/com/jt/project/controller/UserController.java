package com.jt.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jt.project.entity.User;
import com.jt.project.repository.UserDao;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UserController {
	
	@Autowired
	private UserDao obj;
	
	@RequestMapping("register")
	public ModelAndView registerpage(HttpServletRequest req) {
		User user = new User();
		user.setEmail(req.getParameter("email"));
		user.setMobile_no(Long.parseLong(req.getParameter("mobile")));
		user.setName(req.getParameter("name"));
		user.setPassword(req.getParameter("password"));
		obj.adduser(user);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		mv.addObject("msg", "SignUp Successful");
		mv.addObject("email", req.getParameter("email"));
		mv.addObject("password", req.getParameter("password"));
		return mv;
	}
	
	@RequestMapping("Login")
	public ModelAndView logincheck(HttpServletRequest req) {
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		return obj.check(email, pass);
	}
	
	@RequestMapping("logout")
	public String logout() {
		obj.logout();
		return "home";
	}
	
	@RequestMapping("viewprofile")
	public String viewprofile() {
		return "viewprofile";
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(HttpServletRequest req) {
		String email = req.getParameter("email");
		return obj.delete(email);
	}
	
	@RequestMapping("read")
	public ModelAndView read(HttpServletRequest req) {
		String email = req.getParameter("email");
		return obj.read(email);
	}
	
	@RequestMapping("update")
	public ModelAndView update(HttpServletRequest req) {
		String email = req.getParameter("email");
		int count = 0;
		if(req.getParameter("name") != "") {
			String name = req.getParameter("name");
			obj.updatename(email, name);
			count++;
		}
		if(req.getParameter("nemail") != "") {
			String nemail = req.getParameter("nemail");
			obj.updateemail(email, nemail);
			count++;
		}
		if(req.getParameter("mobile") != "") {
			Long mobile = Long.parseLong(req.getParameter("mobile"));
			obj.updatemobile(email, mobile);
			count++;
		}
		if(req.getParameter("password") != "") {
			String password = req.getParameter("password");
			obj.updatepassword(email, password);
			count++;
		}
		ModelAndView mv = new ModelAndView("viewprofile");
		if(count > 0) {
			mv.addObject("message", "Profile Updated Successful");
		}
		else {
			mv.addObject("message", "Failed to Update Profile, Please try Again.");
		}
		return mv;
	}
}
