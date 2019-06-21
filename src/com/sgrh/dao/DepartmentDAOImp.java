package com.sgrh.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.DependsOn;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

@Repository
public class DepartmentDAOImp {
	
	@Qualifier("deptSessionFactory")
	@Autowired
	LocalSessionFactoryBean sessionFactoryBean;
	SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<String> getDeptList(){
		Session session = null;
		List<String> deptList = null;
		try {
			System.out.println("Dept List method called.");
			SessionFactory factory = sessionFactoryBean.getObject();
			session = factory.openSession();
			deptList = session.
					createSQLQuery("SELECT Description FROM ProdigiousDB..CommonCodes(NOLOCK) WHERE Type='Department' AND STATUS = 'ACTIVE' ORDER BY Description").
					list();
			System.out.println(deptList.get(1));
			
			return deptList;
		}
		catch(Exception ex) {
			
		}
		finally {
			if(session != null)
				session.close();
		}
		return deptList;
	}
	
	// set session factory
	
	// 
}
