package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.BookBoardDto;
import com.bookstore.vo.Board;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;

public class BoardDao {
	
	public BookBoardDto getBoardByNo(int boardNo) throws SQLException {		
		BookBoardDto bookBoardDto = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			bookBoardDto = new BookBoardDto();
			bookBoardDto.setNo(rs.getInt("board_no"));
			bookBoardDto.setTitle(rs.getString("board_title"));
			bookBoardDto.setWriter(rs.getString("board_writer"));
			bookBoardDto.setContent(rs.getString("board_content"));
			bookBoardDto.setPassword(rs.getInt("board_password"));
			bookBoardDto.setHit(rs.getInt("board_hit"));
			bookBoardDto.setIsdel(rs.getString("board_del_yn"));
			bookBoardDto.setRegistered_date(rs.getDate("board_registered_date"));
			bookBoardDto.setReplyCount(rs.getInt("reply_count"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return bookBoardDto;
	}
	
	public List<Board> getAllBoards() throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getAllBoards"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setPassword(rs.getInt("board_password"));
			board.setHit(rs.getInt("board_hit"));
			board.setIsdel(rs.getString("board_del_yn"));
			board.setRegistered_date(rs.getDate("board_registered_date"));
			boards.add(board);
		}
		
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getBoardsByTitle(String title) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardsByTitle"));
		pstmt.setString(1, title);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setPassword(rs.getInt("board_password"));
			board.setHit(rs.getInt("board_hit"));
			board.setIsdel(rs.getString("board_del_yn"));
			board.setRegistered_date(rs.getDate("board_registered_date"));
			boards.add(board);
		}
		
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getBoardsByWriter(String writer) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardsByWriter"));
		pstmt.setString(1, writer);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setPassword(rs.getInt("board_password"));
			board.setHit(rs.getInt("board_hit"));
			board.setIsdel(rs.getString("board_del_yn"));
			board.setRegistered_date(rs.getDate("board_registered_date"));
			boards.add(board);
		}
		
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getBoardsByContent(String content) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardsByContent"));
		pstmt.setString(1, content);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setPassword(rs.getInt("board_password"));
			board.setHit(rs.getInt("board_hit"));
			board.setIsdel(rs.getString("board_del_yn"));
			board.setRegistered_date(rs.getDate("board_registered_date"));
			boards.add(board);
		}
		
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public void insertBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.insertBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContent());
		pstmt.setInt(4, board.getPassword());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.updateBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setString(3, board.getIsdel());
		pstmt.setInt(4, board.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}








































