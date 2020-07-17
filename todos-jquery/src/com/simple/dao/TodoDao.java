package com.simple.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Todo;

public class TodoDao {
	
	private Todo resultsetToTodo(ResultSet rs) throws Exception {
		Todo todo = new Todo();
		
		todo.setNo(rs.getInt("todo_no"));
		todo.setTitle(rs.getString("todo_title"));
		todo.setContent(rs.getString("todo_content"));
		todo.setDay(rs.getDate("todo_day"));
		todo.setCompletedDay(rs.getDate("todo_completed_day"));
		todo.setStatus(rs.getString("todo_status"));
		todo.setUserId(rs.getString("user_id"));
		todo.setCreatedDate(rs.getDate("todo_created_date"));
		
		return todo;
	}
	
	/**
	 * 새로 추가할 Todo의 시퀀스
	 * @param todo
	 * @throws SQLException
	 */
	public int getTodoSequence() throws SQLException {
		int sequence = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getTodoSequence"));
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			sequence = rs.getInt("seq");
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return sequence;
	}
	
	/**
	 * 지정된 Todo객체의 정보를 DB에 저장한다
	 * @param todo 새 일정 정보
	 * @throws SQLException
	 */
	public void insertTodo(Todo todo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.insertTodo"));
		pstmt.setInt(1, todo.getNo());
		pstmt.setString(2, todo.getTitle());
		pstmt.setString(3, todo.getContent());
		pstmt.setDate(4, new java.sql.Date(todo.getDay().getTime()));
		pstmt.setString(5, todo.getStatus());
		pstmt.setString(6, todo.getUserId());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 지정된 사용자가 등록한 모든 일정을 등록
	 * @throws Exception 
	 */
	public List<Todo> getTodosByUserId(String userId) throws Exception {
		List<Todo> todos = new ArrayList<Todo>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getTodosByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Todo todo = resultsetToTodo(rs);
			todos.add(todo);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return todos;
	}
	
	/**
	 * 지정된 일정번호에 해당하는 일정정보를 반환한다.
	 * @param todoNo 일정번호
	 * @return 일정 정보
	 * @throws Exception 
	 */
	public Todo getTodoByNo(int todoNo) throws Exception {
		Todo todo = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getTodoByNo"));
		pstmt.setInt(1, todoNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			todo = new Todo();
			todo = resultsetToTodo(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return todo;
	}
	
	/**
	 * 지정된 일정정보의 변경내용을 DB에 반영한다.
	 * @param todo 변경된 정보를 포함하고 있는 일정정보
	 * @throws SQLException
	 */
	public void updateTodo(Todo todo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.updateTodo"));
		pstmt.setString(1, todo.getTitle());
		pstmt.setString(2, todo.getContent());
		pstmt.setDate(3, (Date)todo.getDay());
		pstmt.setDate(4, (Date)todo.getCompletedDay());
		pstmt.setString(5, todo.getStatus());
		pstmt.setInt(6, todo.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}























