package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmptyController implements Controller {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("HomeController.process(req, res) 실행됨");
		
		req.setAttribute("message", "텅빈, 공허한");
		
		return "empty.jsp";
	}
	
}
