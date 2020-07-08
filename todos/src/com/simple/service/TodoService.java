package com.simple.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.simple.dao.TodoDao;
import com.simple.dto.TodoDto;
import com.simple.vo.Todo;

import kr.co.jhta.util.pagination.Pagination;



public class TodoService {
	
	private TodoDao todoDao = new TodoDao();
	
	public List<TodoDto> getRecentTodos(int number) throws Exception {		
		return todoDao.getRecentTodos(number);
	}
	
	public TodoDto getTodoDetail(int todoNo) throws Exception {		
		return todoDao.getTodoByTodoNo(todoNo);
	}
	
	public TodoDto changeStatus(int todoNo, String status) throws Exception{
		
		Todo savedTodo = todoDao.getTodoByNo(todoNo);
		
		if("처리완료".equals(status)) {
			savedTodo.setCompleteDay(new Date());
		} else {
			savedTodo.setCompleteDay(null);
		}
		
		savedTodo.setStatus(status);
		
		todoDao.updateTodo(savedTodo);

		TodoDto todoDto = todoDao.getTodoByTodoNo(todoNo);
		
		return todoDto;
	}

	public Map<String, Object> getTodoList(String id, int pageNo, int rows, String status, String keyword)  throws Exception {
		// 조건에 맞는 객체의 갯수를 조회한다.
		int totalRows = todoDao.getTotalRows(id, status, keyword);
		
		// 페이지 내비게이션에 필요한 정보 생성하기
		// 현재 페이지번호, 화면에 표시할 행의 갯수, 전체 데이터의 갯수가 필요함
		Pagination pagination = new Pagination(pageNo, rows, totalRows);
		
		// 현재 페이지번호에 해당하는 데이터 조회에 필요한 구간 계산하기
		int beginIndex = (pageNo - 1)*rows + 1;
		int endIndex = pageNo * rows;
		
		// 조회조건을 만족하는 일정 조회하기
		List<TodoDto> todoDtos = todoDao.getTodos(id, status, keyword, beginIndex, endIndex);
		
		// 맵객체에 todo값과 pagination값을 따로 담는다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("todos", todoDtos);
		map.put("pagination", pagination);
		
		// 값을 컨트롤로러 전달한다.
		return map;
	}
	
	
	
}

