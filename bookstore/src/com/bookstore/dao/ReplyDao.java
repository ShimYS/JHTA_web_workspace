package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.vo.Reply;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;

public class ReplyDao {
	
	public void insertReply (Reply reply) throws SQLException {
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.insertReply"));
		pstmt.setInt(1, reply.getBoardNo());
		pstmt.setString(2, reply.getContent());
		pstmt.setString(3, reply.getWriter());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Reply> getReplyByNo (int boardNo) throws SQLException {
		List<Reply> replys = new ArrayList<Reply>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getReplyByNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Reply reply = new Reply();
			reply.setNo(rs.getInt("reply_no"));
			reply.setBoardNo(rs.getInt("board_no"));
			reply.setContent(rs.getString("reply_content"));
			reply.setWriter(rs.getString("reply_writer"));
			reply.setRegisteredDate(rs.getDate("reply_registered_date"));
			replys.add(reply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return replys;
	}
	
}
