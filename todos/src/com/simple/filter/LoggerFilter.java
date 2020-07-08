package com.simple.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LoggerFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}
	
	@Override
	public void destroy() {}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 전처리 작업
		// ServletRequest는 HttpServletRequest의 부모이다. 요청을 알고싶으면 형변환해서 꺼내야 한다.
		HttpServletRequest httpReq = (HttpServletRequest)request;
		String requestURI = httpReq.getRequestURI();
		String ipAddr = httpReq.getRemoteAddr();
		
		long startTime = System.currentTimeMillis();
		System.out.println("["+ipAddr+"] 클라이언트의 요청을 받음");
		System.out.println("["+requestURI+"] 요청에 대한 처리를 시작함");
		
		chain.doFilter(request, response); // 다음번 필터와 연결, 다음 필터가 없으면 톰캣이 서블릿/JSP를 실행시킨다.
		
		// 후처리 작업
		long endTime = System.currentTimeMillis();
		
		long workingTime = endTime - startTime;
		
		System.out.println("소요시간 : "+ workingTime + "밀리초");
		System.out.println("["+requestURI+"] 요청에 대한 처리를 종료함\n");
	}
}
