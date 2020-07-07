package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.dto.ReplyDto;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Reply;

import sun.reflect.generics.visitor.Reifier;

public class ReplyDao {
	public void insertReply(Reply reply) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.insertReply"));
		pstmt.setString(1, reply.getWriter());
		pstmt.setString(2, reply.getContent());
		pstmt.setInt(3, reply.getBoardNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<ReplyDto> getReplyByBoardno (int boardNo) throws SQLException {
		List<ReplyDto> replies = new ArrayList<ReplyDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getReplyByBoardno"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReplyDto reply = new ReplyDto();
			reply.setNo(rs.getInt("reply_no"));
			reply.setWriter(rs.getString("reply_writer"));
			reply.setWriterName(rs.getString("user_name"));
			reply.setContent(rs.getString("reply_content"));
			reply.setDelYn(rs.getString("reply_del_yn"));
			reply.setCreateDate(rs.getDate("reply_create_date"));
			reply.setBoardNo(rs.getInt("board_no"));
			replies.add(reply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return replies;
	}
	
	public List<Reply> getReplyByWriter (String Writer) throws SQLException {
		List<Reply> replies = new ArrayList<Reply>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getReplyByWriter"));
		pstmt.setString(1, Writer);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Reply reply = new Reply();
			reply.setNo(rs.getInt("reply_no"));
			reply.setWriter(rs.getString("reply_writer"));
			reply.setContent(rs.getString("reply_content"));
			reply.setDelYn(rs.getString("reply_del_yn"));
			reply.setCreateDate(rs.getDate("reply_create_date"));
			reply.setBoardNo(rs.getInt("board_no"));
			replies.add(reply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return replies;
	}
	
	public void updateReply(Reply reply) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.updateReply"));
		pstmt.setString(1, reply.getDelYn());
		pstmt.setString(2, reply.getContent());
		pstmt.setInt(3, reply.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public Reply getReplyByNo(int replyNo) throws SQLException {
		Reply reply = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getReplyByNo"));
		pstmt.setInt(1, replyNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			reply = new Reply(); 
			reply.setDelYn(rs.getString("reply_del_yn"));
			reply.setContent(rs.getString("reply_content"));
			reply.setNo(rs.getInt("reply_no"));
			reply.setWriter(rs.getString("reply_writer"));
			reply.setCreateDate(rs.getDate("reply_create_date"));
			reply.setBoardNo(rs.getInt("board_no"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return reply;
	}
 }


















