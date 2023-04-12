package com.jt.project.controller;

import java.text.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.jt.project.repository.BusDao;
import com.jt.project.repository.UserDao;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class BusController {
	
	@Autowired
	private BusDao obj;
	
	@Autowired
	private UserDao userobj;
	
	@RequestMapping("search")
	public String search() {
		return "search";
	}
	
	@RequestMapping("SearchBus")
	public ModelAndView search(HttpServletRequest req) throws ParseException {
		String src = req.getParameter("src");
		String dest = req.getParameter("dest");
		String dat = req.getParameter("dat");
		int nseats = Integer.parseInt(req.getParameter("nseats"));
		if(nseats <= 0) {
			ModelAndView mv = new ModelAndView("home");
			mv.addObject("message", "Please, Enter Positive Value for No of Seats.");
			return mv;
		}
		return obj.searchbus(src, dest, dat, nseats);
	}
	
	@RequestMapping("book")
	public ModelAndView book(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("booking");
		if(userobj.getSess().getAttribute("user_id") != null) {
			int nseats = Integer.parseInt(req.getParameter("nseats"));
			int price = Integer.parseInt(req.getParameter("price"));
			int route_id = Integer.parseInt(req.getParameter("route_id"));
			mv.addObject("nseats", nseats);
			mv.addObject("price", price);
			mv.addObject("route_id", route_id);
			mv.addObject("totalcost", nseats*price);
//			mv.addObject("user_id", userobj.getSess().getAttribute("user_id"));
		}
		else {
			mv.setViewName("login");
			mv.addObject("msg", "Please, Login First");
		}
		return mv;
	}
	
	@RequestMapping("confirmbooking")
	public ModelAndView confirmbooking(HttpServletRequest req) {
		int route_id = Integer.parseInt(req.getParameter("route_id"));
		String payment_method = req.getParameter("payment_way");
		int nseats = Integer.parseInt(req.getParameter("nseats"));
		int price = Integer.parseInt(req.getParameter("price"));
		int user_id = (Integer)userobj.getSess().getAttribute("user_id");
//		userobj.getSess().invalidate();
		return obj.bookticket(route_id, payment_method, nseats, price, user_id);
	}
	
	@RequestMapping("managebookings")
	public ModelAndView managebookings() {
		if(userobj.getSess().getAttribute("user_id") == null) {
			ModelAndView mv = new ModelAndView("login");
			mv.addObject("message", "Please, Login First");
			return mv;
		}
		int user_id = (Integer)userobj.getSess().getAttribute("user_id");
		return obj.viewbookings(user_id);
	}
	
	@RequestMapping("cancel")
	public ModelAndView cancel(HttpServletRequest req) {
		int route_id = Integer.parseInt(req.getParameter("route_id"));
		int nseats = Integer.parseInt(req.getParameter("nseats"));
		int booking_id = Integer.parseInt(req.getParameter("booking_id"));
		int user_id = (Integer)userobj.getSess().getAttribute("user_id");
		return obj.cancel(route_id, nseats, booking_id, user_id);
	}
	
	@RequestMapping("admin")
	public String admin() {
		return "admin";
	}
	
}
