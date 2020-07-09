package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.dto.TodoDto;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Todo;

public class TodoDao {
	
	// 싱글턴 객체
	private static TodoDao self = new TodoDao(); // 정적변수 self에 TodoDao객체를 담아둔다. (static이 없으면 객체마다 생성하게 된다. 따라서 뀩 설쟁해야함)
	private TodoDao() {} // 생성자의 외부 접근을 차단한다.
	public static TodoDao getInstance() {
		return self;
	}
	
	private TodoDto resultSetToTodos(ResultSet rs) throws Exception {
		TodoDto todoDto = new TodoDto();
		todoDto.setNo(rs.getInt("todo_no"));
		todoDto.setTitle(rs.getString("todo_title"));
		todoDto.setContent(rs.getString("todo_content"));
		todoDto.setDay(rs.getDate("todo_day"));
		todoDto.setCompletedDay(rs.getDate("todo_completed_day"));
		todoDto.setStatus(rs.getString("todo_status"));
		todoDto.setUserId(rs.getString("user_id"));
		todoDto.setCreatedDate(rs.getDate("todo_created_date"));
		todoDto.setUserName(rs.getString("user_name"));
		
		return todoDto;
	}
	
	public List<TodoDto> getRecentTodos(int number) throws Exception {
		List<TodoDto> todoDtos = new ArrayList<TodoDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getRecentTodos"));
		pstmt.setInt(1, number);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			TodoDto todoDto = resultSetToTodos(rs);		
			todoDtos.add(todoDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return todoDtos;
	}
	
	public TodoDto getTodoByTodoNo(int todoNo) throws Exception {
		TodoDto todoDto = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getTodoByTodoNo"));
		pstmt.setInt(1, todoNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			todoDto = resultSetToTodos(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return todoDto;
	}
	
	public void updateTodo(Todo todo) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.updateTodo"));
		pstmt.setString(1, todo.getTitle());
		pstmt.setString(2, todo.getContent());
		pstmt.setDate(3, new java.sql.Date(todo.getDay().getTime()));
		pstmt.setDate(4, todo.getCompleteDay() != null ? new java.sql.Date(todo.getCompleteDay().getTime()) : null);
		pstmt.setString(5, todo.getStatus());
		pstmt.setInt(6, todo.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public Todo getTodoByNo(int todoNo) throws Exception{
		Todo todo = null;
		 
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getTodoByNo"));
		pstmt.setInt(1, todoNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			todo = new Todo();
			todo.setNo(rs.getInt("todo_no"));
			todo.setTitle(rs.getString("todo_title"));
			todo.setContent(rs.getString("todo_content"));
			todo.setDay(rs.getDate("todo_day"));
			todo.setCompleteDay(rs.getDate("todo_completed_day"));
			todo.setStatus(rs.getString("todo_status"));
			todo.setUserId(rs.getString("user_id"));
			todo.setCreateDate(rs.getDate("todo_created_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return todo;
	}
	
	public int getTotalRows(String userId, String status, String keyword) throws SQLException {
		String sql = "select count(*) ";
			   sql +="from sample_todos ";
			   sql +="where user_id = '"+userId+"' ";
		if(!"전체".equals(status)) {
			   sql +="and todo_status = '"+status+"' ";
		}
		if(!keyword.isEmpty()) {
			   sql +="and todo_title like '%' || '"+keyword+"' || '%' ";
		}
			   
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		int totalRows = rs.getInt(1);
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return totalRows;
		
	}
	
	public List<TodoDto> getTodos(String userId, String status, String keyword, int beginIndex, int endIndex) throws Exception {
		String sql = "select * ";
		       sql +="from (select a.*, row_number() over(order by a.todo_no desc) rn ";
		       sql +="		from sample_todos a ";
		       sql +="		where a.user_id = '"+userId+"' ";
		    if(!"전체".equals(status)) {
		       sql +="      and a.todo_status = '"+status+"' ";
			}
			if(!keyword.isEmpty()) {
			   sql +="      and a.todo_title like '%' || '"+keyword+"' || '%' ";
			}
			   sql +=" ) where rn >= ? and rn <= ? ";
		
	   Connection connection = ConnectionUtil.getConnection();
	   PreparedStatement pstmt = connection.prepareStatement(sql);
	   pstmt.setInt(1, beginIndex);
	   pstmt.setInt(2, endIndex);
	   ResultSet rs = pstmt.executeQuery();
	
	   List<TodoDto> todoDtos = new ArrayList<TodoDto>();
	   
	   while(rs.next()) {
		   TodoDto todoDto = new TodoDto();
		   todoDto.setNo(rs.getInt("todo_no"));
		   todoDto.setTitle(rs.getString("todo_title"));
		   todoDto.setStatus(rs.getString("todo_status"));
		   todoDto.setDay(rs.getDate("todo_day"));
		   todoDtos.add(todoDto);
	   }
	   
	   rs.close();
	   pstmt.close();
	   connection.close();
		
	   return todoDtos;
	}
}












