package com.jt.project.repository;

import org.hibernate.Session;
import org.hibernate.query.MutationQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import com.jt.project.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpSession;

@Repository
public class UserDao {
	private EntityManager entityManager;
	private HttpSession sess;
	
	@Autowired
	public UserDao(EntityManager entityManager, HttpSession sess) {
		super();
		this.entityManager = entityManager;
		this.sess = sess;
	}

	public HttpSession getSess() {
		return sess;
	}

	public void setSess(HttpSession sess) {
		this.sess = sess;
	}

	@Transactional
	public void adduser(User record) {
		Session currentSession = entityManager.unwrap(Session.class);
		currentSession.persist(record);
		currentSession.close();
	}
	
	public ModelAndView check(String email, String pass) {
		Session session = entityManager.unwrap(Session.class);
		ModelAndView mv = new ModelAndView("home");
		Query<User> query = session.createQuery("from User where email = '" + email + "'", User.class);
		try {
			User obj = query.getSingleResult();
			if(obj.getPassword().equals(pass)) {
//				mv.setViewName("home");
				mv.addObject("message", "Login Successful");
				mv.addObject("username", obj.getName());
				sess.setAttribute("user_id", obj.getUser_id());
			}
			else {
				mv.setViewName("login");
				mv.addObject("message", "Incorrect Password");
			}
		} 
		catch (jakarta.persistence.NoResultException e) {
			mv.setViewName("login");
			mv.addObject("message", "Invalid Email ID!! Please try again.");
		}
		session.close();
		return mv;
	}
	
	public void logout() {
		sess.invalidate();
	}
	
	@Transactional
	public ModelAndView delete(String email) {
		Session session = entityManager.unwrap(Session.class);
		ModelAndView mv = new ModelAndView("login");
		Query<User> query = session.createQuery("from User where email = '" + email + "'", User.class);
		try {
			User obj = query.getSingleResult();
			MutationQuery sql = session.createMutationQuery("delete from Booking where user_id=:i");
			sql.setParameter("i", obj);
			sql.executeUpdate();
			session.remove(obj);
		} 
		catch (jakarta.persistence.NoResultException e) {
			mv.setViewName("viewprofile");
			mv.addObject("message", "Invalid Email ID!! Please try again.");
		}
		session.close();
		return mv;
	}
	
	@Transactional
	public ModelAndView read(String email) {
		Session session = entityManager.unwrap(Session.class);
		ModelAndView mv = new ModelAndView("showdetails");
		Query<User> query = session.createQuery("from User where email = '" + email + "'", User.class);
		try {
			User obj = query.getSingleResult();
			mv.addObject("userobj", obj);
		} 
		catch (jakarta.persistence.NoResultException e) {
			mv.setViewName("viewprofile");
			mv.addObject("message", "Invalid Email ID!! Please try again.");
		}
		session.close();
		return mv;
	}
	
	@Transactional
	public void updatename(String email, String name){
		Session session = entityManager.unwrap(Session.class);
		MutationQuery query = session.createMutationQuery("update User set name=:n where email=:i");
		query.setParameter("n", name);
		query.setParameter("i", email);
		query.executeUpdate();
		session.close();
	}
	
	@Transactional
	public void updateemail(String email, String nemail){
		Session session = entityManager.unwrap(Session.class);
		Query<User> query = session.createQuery("from User where email = '" + email + "'", User.class);
		try {
			User obj = query.getSingleResult();
			obj.setEmail(nemail);
			session.merge(obj);
		} 
		catch (jakarta.persistence.NoResultException e) {
			System.out.println(e);
		}
		session.close();
	}
	
	@Transactional
	public void updatemobile(String email, Long mobile){
		Session session = entityManager.unwrap(Session.class);
		MutationQuery query = session.createMutationQuery("update User set mobile_no=:n where email=:i");
		query.setParameter("n", mobile);
		query.setParameter("i", email);
		query.executeUpdate();
		session.close();
	}
	
	@Transactional
	public void updatepassword(String email, String password){
		Session session = entityManager.unwrap(Session.class);
		MutationQuery query = session.createMutationQuery("update User set password=:n where email=:i");
		query.setParameter("n", password);
		query.setParameter("i", email);
		query.executeUpdate();
		session.close();
	}
}
