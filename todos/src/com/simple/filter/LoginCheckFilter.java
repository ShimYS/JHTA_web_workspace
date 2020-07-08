package com.simple.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.simple.vo.User;

public class LoginCheckFilter implements Filter {
	
	private String loginCheckUrl;
	private String loginUnCheckUrl;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		loginCheckUrl = filterConfig.getInitParameter("checkURL");
		loginUnCheckUrl = filterConfig.getInitParameter("uncheckURL");
		
		System.out.println("로그인 체크 URL : "+loginCheckUrl);
		System.out.println("로그인 언체크 URL : "+loginUnCheckUrl);
	}
	
	@Override
	public void destroy() {}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpReq = (HttpServletRequest)request;
		String requestUrl = httpReq.getRequestURI();
		
		// 요청 url이 로그인체크 url과 일치하는 경우 
		if(requestUrl.equals(loginCheckUrl)) {
			// 로그인 여부를 확인한다.
			HttpSession  session = httpReq.getSession();
			User user =  (User) session.getAttribute("loginUser");
			// 로그인이 되어 있지 않으면 에러페이지로 보낸다.
			if(user==null) {
				httpReq.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
				return;
			}		
		} 
		// 요청 url과 로그인체크 url이 일치하지 않는 경우
		// 로그인여부를 체크할 필요가 없으므로 다음번 필터나 서블릿을 실행한다.
		chain.doFilter(request, response);
				
	}
}
























