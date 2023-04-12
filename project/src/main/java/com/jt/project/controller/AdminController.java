package com.jt.project.controller;

import java.sql.Date;
import java.sql.Time;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.jt.project.entity.BusClass;
import com.jt.project.entity.BusRoute;
import com.jt.project.repository.AdminDao;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	
	@Autowired
	private AdminDao adminobj;

	@RequestMapping("route")
	public ModelAndView route() {
		return adminobj.busclasslist();
	}
	
	@RequestMapping("busclass")
	public String busclass() {
		return "addbusclass";
	}
	
	@RequestMapping("addbuscategory")
	public ModelAndView addbusclass(HttpServletRequest req) {
		BusClass obj = new BusClass();
		obj.setBustype(req.getParameter("busclass"));
		return adminobj.addbusclass(obj);
	}
	
	@RequestMapping("addbusroute")
	public ModelAndView addbusroute(HttpServletRequest req) {
		BusRoute obj = new BusRoute(); 
		obj.setDate(Date.valueOf(req.getParameter("dat")));
		obj.setDest(req.getParameter("dest"));
		obj.setPrice(Integer.parseInt(req.getParameter("price")));
		obj.setSeats_left(Integer.parseInt(req.getParameter("nseats")));
		obj.setSrc(req.getParameter("src"));
		StringBuilder tm = new StringBuilder(req.getParameter("time"));
		char[] sec = {':', '0', '0'};
		tm.append(sec);
		obj.setTime(Time.valueOf(tm.toString()));
		String bustype = req.getParameter("busclass");
		return adminobj.addroute(obj, bustype);
	}
}
