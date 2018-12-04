package com.sgrh.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sgrh.bean.User;
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
	
	@Transactional
	public User getUser(String username) {
		Session session = null;
		try {
			SessionFactory sFactory = factory.getObject();
			session = sFactory.openSession();
			//session.get(User.class, username);
		}
		catch(Exception ex) {
			System.out.println("Not a valid user");
		}
		return session.get(User.class, username);
	}
	
	@Transactional
	public List<Visitor> getSearchResult(String queryParam) {
		Session session = null;
		List<Visitor> visitorList = null;
		try {
			SessionFactory sFactory = factory.getObject();
			session = sFactory.openSession();
			String query = "FROM Visitor WHERE ";
			query = query.concat(queryParam);
			System.out.println(query);
			Query<Visitor> executionQuery = session.createQuery(query, Visitor.class);
			visitorList = executionQuery.getResultList();
			for(Visitor visitor : visitorList) {
				System.out.println(visitor.getName());
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return visitorList;
	}
	
}
