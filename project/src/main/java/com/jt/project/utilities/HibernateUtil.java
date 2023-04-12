package com.jt.project.utilities;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
	private static final SessionFactory sessionFactory = buildSessionFactory();

	private static SessionFactory buildSessionFactory() {
		try {
			StandardServiceRegistry standardRegistry = new StandardServiceRegistryBuilder()
					.configure("hibernate.cfg.xml").build();
			Metadata metadata = new MetadataSources(standardRegistry).getMetadataBuilder().build();
			return metadata.getSessionFactoryBuilder().build();

		} catch (HibernateException he) {
			System.out.println("Session Factory creation failure");
			throw he;
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}

//import org.hibernate.SessionFactory;
//import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
//import org.hibernate.cfg.Configuration;
//import com.jt.project.entity.User;
//import com.jt.project.entity.BusRoute;
//import com.jt.project.entity.Booking;
//import com.jt.project.entity.BusClass;
//
//public class HibernateUtil {
//    private static SessionFactory sessionFactory;
//
//    static {
//        try {
//            Configuration configuration = new Configuration();
//            configuration.configure("hibernate.cfg.xml");
//            configuration.addAnnotatedClass(User.class);
//            configuration.addAnnotatedClass(BusRoute.class);
//            configuration.addAnnotatedClass(Booking.class);
//            configuration.addAnnotatedClass(BusClass.class);
//            StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
//            sessionFactory = configuration.buildSessionFactory(builder.build());
//        } catch (HibernateException he) {
//			System.out.println("Session Factory creation failure");
//			throw he;
//		}
//    }
//
//    public static SessionFactory getSessionFactory() {
//        return sessionFactory;
//    }
//}

