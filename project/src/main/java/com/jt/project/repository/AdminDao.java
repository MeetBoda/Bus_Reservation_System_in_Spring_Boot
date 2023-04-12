package com.jt.project.repository;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import com.jt.project.entity.BusClass;
import com.jt.project.entity.BusRoute;
import jakarta.persistence.EntityManager;

@Repository
public class AdminDao {
	
	private EntityManager entityManager;
	
	@Autowired
	public AdminDao(EntityManager theEntityManager) {
		entityManager = theEntityManager;
	}
	
	@Transactional
	public ModelAndView addbusclass(BusClass obj) {
		Session currentSession = entityManager.unwrap(Session.class);
		currentSession.persist(obj);
		currentSession.close();
		ModelAndView mv = new ModelAndView("addbusclass");
		mv.addObject("message", "Bus Category added Successfully");
		return mv;
	}
	
	public ModelAndView busclasslist() {
		Session session = entityManager.unwrap(Session.class);
		ModelAndView mv = new ModelAndView("addroute");
		NativeQuery<BusClass> q = session.createNativeQuery("select * from bus_class ", BusClass.class);
		List<BusClass> list = q.list();	
		if (list.isEmpty())
			mv.addObject("message","No records found");
		else
			mv.addObject("list", list);
		session.close();
		return mv;
	}
	
	@Transactional
	public ModelAndView addroute(BusRoute obj, String bustype) {
		Session session = entityManager.unwrap(Session.class);
		ModelAndView mv = new ModelAndView("addroute");
		Query<BusClass> query = session.createQuery("from BusClass where bustype = '" + bustype + "'", BusClass.class);
		BusClass obj1 = query.getSingleResult();
		obj.setBus_class_id(obj1);
		session.persist(obj);
		mv.addObject("message", "Bus Route added Successfully");
		NativeQuery<BusClass> q = session.createNativeQuery("select * from bus_class ", BusClass.class);
		List<BusClass> list = q.list();
		mv.addObject("list", list);
		session.close();
		return mv;
	}
}
