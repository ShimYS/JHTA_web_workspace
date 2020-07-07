package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.dto.BoardDto;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Board;

import oracle.net.aso.p;

public class BoardDao {
	public List<BoardDto> getBoardById(String userId) throws SQLException {
		List<BoardDto> boards = new ArrayList<BoardDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardDto board = new BoardDto();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setWriterName(rs.getString("user_name"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setCnt(rs.getInt("board_reply_cnt"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setCreateDate(rs.getDate("board_create_date"));
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public BoardDto getBoardByNo(int boardNo) throws SQLException {		
		BoardDto board = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			board = new BoardDto();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setWriterName(rs.getString("user_name"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setCnt(rs.getInt("board_reply_cnt"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setCreateDate(rs.getDate("board_create_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return board;
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
			board.setHit(rs.getInt("board_hit"));
			board.setCnt(rs.getInt("board_reply_cnt"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setCreateDate(rs.getDate("board_create_date"));
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<BoardDto> getAllBoardByRange(int beginRowNumber, int endRowNumber) throws SQLException {
		List<BoardDto> boards = new ArrayList<BoardDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getAllBoardByRange"));
		pstmt.setInt(1, beginRowNumber);
		pstmt.setInt(2, endRowNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardDto board = new BoardDto();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setWriterName(rs.getString("user_name"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setCnt(rs.getInt("board_reply_cnt"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setCreateDate(rs.getDate("board_create_date"));
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public void increaseHit (int boardNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.increaseHit"));
		pstmt.setInt(1, boardNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateBoard (BoardDto board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.updateBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setInt(3, board.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void insertBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.insertBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContent());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void deleteBoard (int boardNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.deleteBoard"));
		pstmt.setInt(1, boardNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public int getBoardCount () throws SQLException {
		int boardCnt = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardCnt"));
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			boardCnt = rs.getInt("cnt");
		}
		
		pstmt.close();
		connection.close();
		
		return boardCnt;
	}
}



























