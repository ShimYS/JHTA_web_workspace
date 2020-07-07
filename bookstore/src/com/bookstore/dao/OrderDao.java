package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.BookOrderDto;
import com.bookstore.vo.Order;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;

public class OrderDao {
	
	public List<BookOrderDto> getOrdersByGenre(String genre) throws SQLException {
		List<BookOrderDto> bookOrderDtos = new ArrayList<BookOrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByGenre"));
		pstmt.setString(1, genre);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BookOrderDto bookOrderDto = new BookOrderDto();
			bookOrderDto.setNo(rs.getInt("order_no"));
			bookOrderDto.setUserId(rs.getNString("user_id"));
			bookOrderDto.setBookNo(rs.getInt("book_no"));
			bookOrderDto.setPrice(rs.getInt("order_price"));
			bookOrderDto.setAmount(rs.getInt("order_amount"));
			bookOrderDto.setRegisteredDate(rs.getDate("order_registered_date"));
			bookOrderDto.setBookName(rs.getString("book_title"));
			bookOrderDtos.add(bookOrderDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return bookOrderDtos;
	}
	
	public List<BookOrderDto> getAllOrder() throws SQLException {
		List<BookOrderDto> bookOrderDtos = new ArrayList<BookOrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getAllOrders"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BookOrderDto bookOrderDto = new BookOrderDto();
			bookOrderDto.setNo(rs.getInt("order_no"));
			bookOrderDto.setUserId(rs.getNString("user_id"));
			bookOrderDto.setBookNo(rs.getInt("book_no"));
			bookOrderDto.setPrice(rs.getInt("order_price"));
			bookOrderDto.setAmount(rs.getInt("order_amount"));
			bookOrderDto.setRegisteredDate(rs.getDate("order_registered_date"));
			bookOrderDto.setBookName(rs.getString("book_title"));
			bookOrderDtos.add(bookOrderDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return bookOrderDtos;
	}

	public void insertOrder(Order order) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.insertOrder"));
		pstmt.setString(1, order.getUserId());
		pstmt.setInt(2, order.getBookNo());
		pstmt.setInt(3, order.getPrice());
		pstmt.setInt(4, order.getAmount());
		pstmt.executeUpdate();

		pstmt.close();
		connection.close();
	}
	
	public List<BookOrderDto> getOrderByUserId(String userId) throws SQLException {
		List<BookOrderDto> bookOrderDtos = new ArrayList<BookOrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BookOrderDto bookOrderDto = new BookOrderDto();
			bookOrderDto.setNo(rs.getInt("order_no"));
			bookOrderDto.setUserId(rs.getString("user_id"));
			bookOrderDto.setBookNo(rs.getInt("book_no"));
			bookOrderDto.setPrice(rs.getInt("order_price"));
			bookOrderDto.setAmount(rs.getInt("order_amount"));
			bookOrderDto.setRegisteredDate(rs.getDate("order_registered_date"));
			bookOrderDto.setBookName(rs.getString("book_title"));
			bookOrderDto.setCheckReview(rs.getInt("review_check") == -1 ? true : false);
			bookOrderDtos.add(bookOrderDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return bookOrderDtos;
	}
}
