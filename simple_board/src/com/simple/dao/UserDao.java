package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.User;

public class UserDao {
	
	public List<User> getAllUsers () throws SQLException {
		List<User> users = new ArrayList<User>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getAllUsers"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			User user = new User();
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setPassword(rs.getString("user_password"));
			user.setEmail(rs.getString("user_email"));
			user.setDisabled(rs.getString("user_disabled"));
			user.setCreateDate(rs.getDate("user_create_date"));
			users.add(user);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return users;
	}
	
	public User getUserById(String userId) throws SQLException {
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			user = new User();
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setPassword(rs.getString("user_password"));
			user.setEmail(rs.getString("user_email"));
			user.setDisabled(rs.getString("user_disabled"));
			user.setCreateDate(rs.getDate("user_create_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	public void insertUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.insertUser"));
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getPassword());
		pstmt.setString(4, user.getEmail());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}




























