package com.jt.project.repository;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import com.jt.project.entity.Booking;
import com.jt.project.entity.BusRoute;
import com.jt.project.entity.User;
import jakarta.persistence.EntityManager;

@Repository
public class BusDao {
	
	private EntityManager entityManager;
	
	@Autowired
	public BusDao(EntityManager theEntityManager) {
		entityManager = theEntityManager;
	}
	
	public ModelAndView searchbus(String src, String dest, String dat, int nseats) {
		Session session = entityManager.unwrap(Session.class);
		ModelAndView mv = new ModelAndView("viewbus");
		Query<BusRoute> query = session.createQuery("from BusRoute where src = '" + src + "' and dest = '" + dest + "' and date = '" + dat + "'", BusRoute.class);
		List<BusRoute> routes = query.list();
		if (routes.isEmpty()) {
			mv.setViewName("home");
			mv.addObject("message", "No Bus Found!!");
			return mv;
		}
		int count = 0;
		Iterator<BusRoute> i = routes.iterator();
		while(i.hasNext()){
			BusRoute r = i.next();
			if(r.getSeats_left() >= nseats) {
				count++;
			}
		}
		if(count > 0) {
			mv.addObject("routes", routes);
			mv.addObject("nseats", nseats);
			String pattern = "yyyy-MM-dd";
			String dateInString =new SimpleDateFormat(pattern).format(new Date());
			mv.addObject("curr_date", dateInString);
		}
		else{
			mv.setViewName("home");
			mv.addObject("message", "No Bus Found with Required Number of Seats!!");
			System.out.println("2");
		}
		return mv;
	}
	
	@Transactional
	public ModelAndView bookticket(int route_id, String payment_method, int nseats, int price, int user_id) {
		Session session = entityManager.unwrap(Session.class);
		ModelAndView mv = new ModelAndView("home");
		Booking obj = new Booking();
		User userobj = (User)session.get(User.class, user_id);
		BusRoute busobj = (BusRoute)session.get(BusRoute.class, route_id);
		int curr_seats = busobj.getSeats_left();
		busobj.setSeats_left(curr_seats - nseats);
		session.merge(busobj);
		obj.setUser_id(userobj);
		obj.setSeats_booked(nseats);
		obj.setPayment_method(payment_method);
		obj.setRoute_id(busobj);
		obj.setAmount_paid(nseats * price);
		session.persist(obj);
		mv.addObject("msg", "Booking Successful");
		mv.addObject("username", userobj.getName());
		session.close();
		return mv;
	}
	
	public ModelAndView viewbookings(int user_id) {
		Session session = entityManager.unwrap(Session.class);
		ModelAndView mv = new ModelAndView("managebookings");
		User userobj = (User)session.get(User.class, user_id);
		Query<Booking> query = session.createQuery("from Booking where user_id = '" + userobj.getUser_id() + "'", Booking.class);
		List<Booking> bookings = query.list();
		if (bookings.isEmpty()) {
			mv.addObject("message", "No Booking Found!!");
		}
		else {
			mv.addObject("bookings", bookings);
			String pattern = "yyyy-MM-dd";
			String dateInString =new SimpleDateFormat(pattern).format(new Date());
			LocalTime time = LocalTime.now();
			mv.addObject("curr_date", dateInString);
			mv.addObject("curr_time", "time");
		}
		return mv;
	}
	
	@Transactional
	public ModelAndView cancel(int route_id, int nseats, int booking_id, int user_id) {
		Session session = entityManager.unwrap(Session.class);
		ModelAndView mv = new ModelAndView("home");
		BusRoute busobj = (BusRoute)session.get(BusRoute.class, route_id);
		int curr_seats = busobj.getSeats_left();
		busobj.setSeats_left(curr_seats + nseats);
		session.merge(busobj);
		Booking obj = (Booking)session.get(Booking.class, booking_id);
		session.remove(obj);
		User userobj = (User)session.get(User.class, user_id);
		mv.addObject("message", "Ticket Cancelled Successfully");
		mv.addObject("username", userobj.getName());
		session.close();
		return mv;
	}
}
