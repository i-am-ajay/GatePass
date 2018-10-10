package com.sgrh.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sgrh.bean.Visitor;
import com.sgrh.localSessionFactory.VisitorSessionFactory;

@Repository
public class VisitorDAOImp {
	@Autowired
	private VisitorSessionFactory factory;
	
	public VisitorDAOImp() {
		System.out.println("VisitorDAOImp called.");
	}
	
	@Transactional
	public boolean saveVisitor(Visitor visitor) {
		boolean isSuccess = false;
		try {
			SessionFactory sFactory = factory.getObject();
			Session session = sFactory.openSession();
			session.save(visitor);
			isSuccess = true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			isSuccess = false;
		}
		return isSuccess;
	}
	
	@Transactional
	public Visitor getVisitor(int id) {
		Session session = null;
		try {
			SessionFactory sFactory = factory.getObject();
			session = sFactory.openSession();
		}
		catch(Exception ex) {
			System.out.println("Not able to get Object");
		}
		return session.get(Visitor.class,id);
	}
}
