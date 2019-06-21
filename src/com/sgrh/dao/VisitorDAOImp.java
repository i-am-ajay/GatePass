package com.sgrh.dao;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Strings;
import com.sgrh.bean.User;
import com.sgrh.bean.Visitor;
import com.sgrh.bean.VisitorEntry;
import com.sgrh.localSessionFactory.VisitorSessionFactory;

@Repository
public class VisitorDAOImp {
	@Autowired
	private VisitorSessionFactory factory;
	
	public VisitorDAOImp() {
		
	}
	
	@Transactional
	public long saveVisitor(Visitor visitor, boolean oldVisitor, VisitorEntry en) {
		boolean isSuccess = false;
		try {
			SessionFactory sFactory = factory.getObject();
			Session session = sFactory.getCurrentSession();
			try {
				session.setHibernateFlushMode(FlushMode.MANUAL);
				session.saveOrUpdate(visitor);
				en.setVisitor(visitor);
				visitor.getVisitorEntryList().add(en);
				session.save(en);
				session.flush();
			}
			
			catch(Exception ex) {
				ex.printStackTrace();
			}
			finally {
				session.setHibernateFlushMode(FlushMode.AUTO);
			}
			
			isSuccess = true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			isSuccess = false;
		}
		long gatePass = en.getPassNo();
		return gatePass;
	}
	
	@Transactional
	public Visitor getVisitor(int id) {
		Session session = null;
		Visitor vis = null;
		try {
			SessionFactory sFactory = factory.getObject();
			session = sFactory.openSession();
			vis = session.get(Visitor.class,id);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			session.close();
		}
		
		return vis;
	}
	
	@Transactional
	public User getUser(String username) {
		Session session = null;
		User user = null;
		try {
			SessionFactory sFactory = factory.getObject();
			session = sFactory.openSession();
			user = session.get(User.class, username);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			if(session != null) {
				session.close();
			}
		}
		return user;
	}
	
	@Transactional
	public int getLastPassNo() {
		Session session = null;
		int passNo = 0;
		try {
			SessionFactory sFactory = factory.getObject();
			session = sFactory.getCurrentSession();
			NativeQuery<Integer> query = session.createSQLQuery("SELECT MAX(Pass_no) FROM visitorentry");
			List<Integer> list = query.getResultList();
			passNo = list.get(0);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return passNo; 
	}
	
	@Transactional
	public List<Object[]> getSearchResult(String queryParam) {
		Session session = null;
		List<Object[]> visitorList = null;
		try {
			SessionFactory sFactory = factory.getObject();
			session = sFactory.openSession();
			String query = "SELECT Pass_No,ID,Name,Address,Contact,email,Company,VISIT_DEPARTMENT,VISIT_DATE,VISIT_TIME,image_path,\r\n" + 
					"	id_image_path, entry_date\r\n" + 
					"FROM \r\n" + 
					"	visitor INNER JOIN visitorentry ON 1=1 AND visitor.id = visitorentry.V_ID\r\n" + 
					"WHERE ";
			query = query.concat(queryParam);
			query = query.concat(" ORDER BY VISIT_DATE DESC,VISIT_TIME DESC");
			NativeQuery executionQuery = session.createSQLQuery(query);
			visitorList = executionQuery.list();
			
			for(Object[] obj : visitorList ) {
					obj[8] = obj[8].toString().substring(0,10);
					obj[9]= obj[9].toString().substring(0,5);
				}
			}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			session.close();
		}
		return visitorList;
	}
	
	@Transactional
	public void captuerEntryTime(int passNo,String user) {
		Session session = null;
		try {
			SessionFactory sFactory = factory.getObject();
			session = sFactory.openSession();
			VisitorEntry entry = session.get(VisitorEntry.class, passNo);
			String entryUserName = Strings.nullToEmpty(entry.getEntryUser());
			if(entryUserName.equals("")) {
				entry.setEntryUser(user);
				entry.setEntryTime(LocalDateTime.now());
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			if(session != null) {
				session.close();
			}
		}
	}
}
