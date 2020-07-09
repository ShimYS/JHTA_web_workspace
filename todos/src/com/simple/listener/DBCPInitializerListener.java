package com.simple.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbcp2.BasicDataSource;

import com.simple.util.ConnectionUtil;


public class DBCPInitializerListener implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		// <context-param>의 설정값을 담고 있는 ServletContext 객체 획득
		ServletContext sc = sce.getServletContext();		
		// <context-param>갑 조회하기
		String url = sc.getInitParameter("db.url");
		String driverClassName = sc.getInitParameter("db.driverClassName");
		String userName = sc.getInitParameter("db.username");
		String password = sc.getInitParameter("db.password");

		// DataBase Connection Pool 생성하기
		BasicDataSource ds = new BasicDataSource();
		ds.setUrl(url);
		ds.setDriverClassName(driverClassName);
		ds.setUsername(userName);
		ds.setPassword(password);
		
		// 생성된 커넥셔눌 객체를 ConnectionUtil의 dataSource 변수에 저장한다.
		ConnectionUtil.setDataSource(ds);
	}
}
