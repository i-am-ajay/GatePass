package com.sgrh.localSessionFactory;

import java.io.IOException;

import org.springframework.orm.hibernate5.LocalSessionFactoryBean;


public class VisitorSessionFactory extends LocalSessionFactoryBean{
	public void init(){
		System.out.println("Visitor Session Factory Created");
		
		try {
			this.afterPropertiesSet();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(this.getMetadataSources().toString());
	}
	public void destroy() {
		System.out.println("Visitor Session Factory Destoryed");
	}
}
