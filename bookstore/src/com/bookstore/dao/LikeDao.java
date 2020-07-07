package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.vo.Like;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;

public class LikeDao {
	public void insertLike(int bookNo, String userId) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("like.insertLike"));
		pstmt.setInt(1, bookNo);
		pstmt.setString(2, userId);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Like> getLikes (int bookNo, String userId) throws SQLException {
		List<Like> likes = new ArrayList<Like>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("like.getLikes"));
		pstmt.setInt(1, bookNo);
		pstmt.setString(2, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Like like = new Like();
			like.setBookNo(rs.getInt("book_no"));
			like.setUserId(rs.getString("user_id"));
			likes.add(like);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return likes;
	}
}
