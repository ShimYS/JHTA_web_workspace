package com.simple.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simple.dto.TodoDto;
import com.simple.service.TodoService;
import com.simple.util.NumberUtil;
import com.simple.util.StringUtil;
import com.simple.vo.Todo;
import com.simple.vo.User;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.jhta.util.pagination.Pagination;

@Controller
public class HomeController {
	
	JSONView jsonView = new JSONView();
	private TodoService service = new TodoService();
	
	@RequestMapping("/home.hta")
	public ModelAndView recent(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String pageNum = req.getParameter("pagenum");
		int number = (int) (6 * (pageNum == null ? NumberUtil.stringToDouble("1") : NumberUtil.stringToDouble(pageNum)));
		
		List<TodoDto> todos = service.getRecentTodos(number);
		
		mav.addAttribute("todos", todos);
		mav.setViewName("/home.jsp");
		
		return mav;
	}
	
	@RequestMapping("/detail.hta")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		int todoNo = NumberUtil.stringToInt(req.getParameter("todono"));
		TodoDto todoDto = service.getTodoDetail(todoNo);
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("loginUser");
		if(user != null && user.getId().equals(todoDto.getUserId())) {
			todoDto.setCanModify(true);
		}
		
		mav.addAttribute("todo", todoDto);
		mav.setView(jsonView);
		
		return mav;
	}
	
	@RequestMapping("/status.hta")
	public ModelAndView status(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int todoNo = NumberUtil.stringToInt(req.getParameter("no"));
		String status = req.getParameter("status");
		
		TodoDto statusClass = service.changeStatus(todoNo, status); 
				
		mav.addAttribute("statusclass", statusClass);
		mav.setView(jsonView);
		
		return mav;
	}
	
	@RequestMapping("/list.hta")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		// 로그인 여부 확인을 위해 세션객체의 유저정보를 조회한다.
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("loginUser");
		
		// 폼에서 입력된 값을 조회한다.
		int pageNo = NumberUtil.stringToInt(req.getParameter("pageNo"), 1);
		int rows = NumberUtil.stringToInt(req.getParameter("rows"), 5);
		String status = StringUtil.nullToValue(req.getParameter("status"), "전체");
		String keyword = StringUtil.nullToBlank(req.getParameter("keyword"));
		
		// 위에서 조회한 값을 서비스 로직으로 전달한다.
		Map<String, Object> map = service.getTodoList(user.getId(), pageNo, rows, status, keyword);
		
		// 로직에 의해 조회횐 값을 받는다.
		Pagination pagination = (Pagination) map.get("pagination");
		List<TodoDto> todos = (List<TodoDto>) map.get("todos"); 
		
		// 값을 mav에 담고, 이동할 url을 설정한다.
		mav.addAttribute("todos", todos);
		mav.addAttribute("pagination", pagination);
		mav.setViewName("todos.jsp");
		
		// 설정한 url로 mav를 보낸다.
		return mav;
	}
}





























