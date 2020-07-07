package com.bookstore.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.vo.User;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;

public class UserDao {
	
	public void insertUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.insertUser"));
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPassword());
		pstmt.setString(3, user.getName());
	}
	
	public User getUserById(String userId) throws SQLException{
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			user = new User();
			user.setName(rs.getString("user_name"));
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setEmail(rs.getString("user_email"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
			user.setPoint(rs.getInt("user_point"));
		}
		
		return user;
	}
	
	public List<User> getNewUsers() throws SQLException{
		List<User> users = new ArrayList<User>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getNewUsers"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			User user = new User();
			user.setName(rs.getString("user_name"));
			user.setId(rs.getString("user_id"));
			user.setEmail(rs.getString("user_email"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
			users.add(user);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return users;
	}
	
	public List<User> getAllUsers() throws SQLException {
		List<User> users = new ArrayList<User>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getAllUsers"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			User user = new User();
			user.setName(rs.getString("user_name"));
			user.setId(rs.getString("user_id"));
			user.setEmail(rs.getString("user_email"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
			user.setPoint(rs.getInt("user_point"));
			users.add(user);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return users;
	}
}
