package com.simple.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simple.service.TodoService;
import com.simple.service.UserService;
import com.simple.util.NumberUtil;
import com.simple.vo.Todo;
import com.simple.vo.User;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class TodoController {
	
	private TodoService todoService = new TodoService();
	private UserService userService = new UserService();
	private JSONView jsonView = new JSONView();
	
	/*
	 * 신규회원 가입
	 * 요청방식 : POST
	 * 요청파리미터 
	 * 		id, name, password, email
	 * 응답 
	 * 		{status:"success", username:"홍길동"};
	 *		{status:"fail", message:"동일한 아이디가 이미 사용중입니다."}
	 */
	@RequestMapping("/register.hta")
	public ModelAndView registerUser(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Map<String, Object> dataMap = new HashMap<>();
		ModelAndView mav = new ModelAndView(); 
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String password = req.getParameter("password");
			String email = req.getParameter("email");
			
			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setPassword(password);
			user.setEmail(email);
			
			userService.addNewUser(user);
			
			dataMap.put("status", "success");
			dataMap.put("username", name);
		} catch(Exception e) {
			dataMap.put("status", "fail");
			dataMap.put("message", e);
		}
		
		return mav;
	}
	
	/*
	 * 	로그인
	 * 	요청방식 : POST
	 * 	요청파라미터
	 *		id, password
	 *	응답
	 *		{status:"success", username:"홍길동"}
	 *		{status:"fail", message:"아이디 혹은 비밀번호가 올바르지 않습니다"}
	 */
	@RequestMapping("/login.hta")
	public ModelAndView loginUser(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Map<String, Object> dataMap = new HashMap<>();
		ModelAndView mav = new ModelAndView(); 
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			
			User user = userService.getLoginUser(id, password);
			
			dataMap.put("status", "success");
			dataMap.put("username", user.getName());
			
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", user);
			session.setAttribute("logined", true);
		} catch (Exception e) {
			dataMap.put("status", "fail");
			dataMap.put("message", e);
		}
		
		return mav;
	}
	
	/*
	 * 	요청방식 : GET
	 * 	요청파라미터
	 *		없음
	 *	응답
	 *		{status:"success"}
	 */
	@RequestMapping("/logout.hta")
	public ModelAndView logoutUser(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Map<String, Object> dataMap = new HashMap<>();
		ModelAndView mav = new ModelAndView(); 
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			HttpSession session = req.getSession();
			session.invalidate();
			dataMap.put("status", "success");
		} catch (Exception e) {
			dataMap.put("status", "fail");
		}
		
		return mav;
	}
	
	/*
	 * 	요청방식 : GET
	 * 	요청파라미터
	 *		없음
	 *	응답
	 *		{status:"success", todos:"[{no:1, title:"장보기"},{no:2, title:"책기"},{}, ….]"}
	 */
	@RequestMapping("/mytodos.hta")
	public ModelAndView myTodos(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Map<String, Object> dataMap = new HashMap<>();
		ModelAndView mav = new ModelAndView(); 
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("loginUser");
			String userId = user.getId();
			
			List<Todo> todos = todoService.getMyTodos(userId);
			
			dataMap.put("status", "success");
			dataMap.put("todos", todos);
		} catch (Exception e) {
			dataMap.put("status", "fail");
			dataMap.put("message", e);
		}
		
		return mav;
	}
	
	/*
	 * 	요청방식 : GET
	 * 	요청파라미터
	 *		todoNo
	 *	응답
	 *		{status:"success", todo:{no:1, title:"장보기", content:"…"}}
	 */
	@RequestMapping("/todo.hta")
	public ModelAndView todoDetail(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Map<String, Object> dataMap = new HashMap<>();
		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			int todoNo = NumberUtil.stringToInt(req.getParameter("todono"));
			
			Todo todo = todoService.getTodoDetail(todoNo);
			
			dataMap.put("status", "success");
			dataMap.put("todo", todo);
		} catch (Exception e) {
			dataMap.put("status", "fail");
			dataMap.put("message", e);
		}

		return mav;
	}
	
	/*
	 * 	요청방식 : POST
	 * 	요청파라미터
	 *		title, content, day, 
	 *	응답
	 *		{status:"success", todo:{no:1, title:"장보기", content:"…"}
	 */
	@RequestMapping("/addTodo.hta")
	public ModelAndView addTodo(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Map<String, Object> dataMap = new HashMap<>();
		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String dayString = req.getParameter("day"); //날짜로 어떻해 받지?
			
			HttpSession session = req.getSession();
			User user = (User)session.getAttribute("loginUser");
			
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date day = transFormat.parse(dayString);
			
			
			Todo todo = new Todo();
			todo.setTitle(title);
			todo.setContent(content);
			todo.setDay(day);
			todo.setUserId(user.getId());
			todo.setStatus("처리예정");
			
			Todo newTodo = todoService.addNewTodo(todo);
			
			dataMap.put("status", "success");
			dataMap.put("data", newTodo);
		} catch (Exception e) {
			dataMap.put("status", "fail");
			dataMap.put("message", e);
		}
		
		return mav;
	}
	
	/*
	 * 	요청방식 : POST
	 * 	요청파라미터
	 *		no, title, content, day, status
	 *	응답
	 *		{status:"success", todo:{no:1, title:"장보기", content:"…"}
	 */
	@RequestMapping("/modifyTodo.hta")
	public ModelAndView modifyTodo(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Map<String, Object> dataMap = new HashMap<>();
		ModelAndView mav = new ModelAndView(); 
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			int no = NumberUtil.stringToInt(req.getParameter("no"));			
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String dayString = req.getParameter("day");
			String status = req.getParameter("status");
			
			
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date day = transFormat.parse(dayString);
			
			Todo todo = new Todo();
			todo.setNo(no);
			todo.setTitle(title);
			todo.setContent(content);
			todo.setDay(day);
			todo.setStatus(status);

			Todo updateTodo = todoService.updateTodo(todo);
			
			dataMap.put("status", "success");
			dataMap.put("todo", updateTodo);
		} catch (Exception e) {
			dataMap.put("status", "fail");
			dataMap.put("message", e);
		}
		
		return mav;
	}
}
















































