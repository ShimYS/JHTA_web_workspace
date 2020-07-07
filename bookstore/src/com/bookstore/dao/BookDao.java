package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.BookDetailDto;
import com.bookstore.vo.Book;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;

public class BookDao {
	
	public void insertBook(Book book) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.insertBook"));
		pstmt.setString(1, book.getTitle());
		pstmt.setString(2, book.getWriter());
		pstmt.setString(3, book.getGenre());
		pstmt.setString(4, book.getPublisher());
		pstmt.setInt(5, book.getPrice());
		pstmt.setInt(6, book.getDiscountPrice());
		pstmt.setInt(7, book.getStock());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Book> getBooksByGenre(String genre) throws SQLException {
		List<Book> books = new ArrayList<Book>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.getBooksByGenre"));
		pstmt.setString(1, genre);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Book book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPrice(rs.getInt("book_price"));
			book.setPoint(rs.getInt("book_point"));
			
			books.add(book);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return books;
	}
	
	public List<Book> getAllBooks() throws SQLException {
		List<Book> books = new ArrayList<Book>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.getAllBooks"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Book book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPrice(rs.getInt("book_price"));
			book.setPoint(rs.getInt("book_point"));
			
			books.add(book);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return books;
	}
	
	public BookDetailDto getBookByNo(int bookNo) throws SQLException {
		BookDetailDto bookDetailDto = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.getBookByNo"));
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			bookDetailDto = new BookDetailDto();
			bookDetailDto.setNo(rs.getInt("book_no"));
			bookDetailDto.setTitle(rs.getString("book_title"));
			bookDetailDto.setWriter(rs.getString("book_writer"));
			bookDetailDto.setPublisher(rs.getString("book_publisher"));
			bookDetailDto.setPoint(rs.getInt("book_point"));
			bookDetailDto.setReviewCnt(rs.getInt("review_cnt"));
			bookDetailDto.setPrice(rs.getInt("book_price"));
			bookDetailDto.setDiscountPrice(rs.getInt("book_discount_price"));
			bookDetailDto.setLikes(rs.getInt("book_likes"));
			bookDetailDto.setStock(rs.getInt("book_stock"));
		}
		return bookDetailDto;
	}
	
	public List<Book> getNewBooks() throws SQLException{
		
		List<Book> books = new ArrayList<Book>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.getNewBooks"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Book book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setPrice(rs.getInt("book_price"));
			
			books.add(book);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return books;
	}
	
	
}
