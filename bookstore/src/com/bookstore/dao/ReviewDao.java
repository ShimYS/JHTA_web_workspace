package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.ReviewDto;
import com.bookstore.vo.Review;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;

public class ReviewDao {
	
	public void insertReview(Review review) throws SQLException{
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.insertReview"));
		pstmt.setString(1, review.getContent());
		pstmt.setInt(2, review.getPoint());
		pstmt.setInt(3, review.getBookNo());
		pstmt.setString(4, review.getUserId());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<ReviewDto> getReviewByBookNo(int bookNo) throws SQLException {
		List<ReviewDto> reviews = new ArrayList<ReviewDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewByBookNo"));
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setNo(rs.getInt("review_no"));
			reviewDto.setUserName(rs.getString("user_name"));
			reviewDto.setContent(rs.getString("review_content"));
			reviewDto.setPoint(rs.getInt("review_point"));
			reviewDto.setRegisteredDate(rs.getDate("review_registered_date"));
			reviews.add(reviewDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return reviews;
	}
	
}





















