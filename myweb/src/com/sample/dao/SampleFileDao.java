package com.sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.util.ConnectionUtil;
import com.sample.vo.SampleFile;

public class SampleFileDao {
	
	public void insertFile(SampleFile sampleFile) throws SQLException {
		String sql = "insert into sample_files " 
				+ "values(sample_file_seq.nextval, ?, ?, sysdate) ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, sampleFile.getTitle());
		pstmt.setString(2, sampleFile.getName());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<SampleFile> getAllFiles() throws SQLException {
		List<SampleFile> files = new ArrayList<SampleFile>();
		
		String sql = "select * from sample_files order by file_no desc" ;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			SampleFile file = new SampleFile();
			file.setNo(rs.getInt("file_no"));
			file.setTitle(rs.getString("file_title"));
			file.setName(rs.getString("file_name"));
			file.setCreateDate(rs.getDate("file_create_date"));
			files.add(file);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return files;
	}
	
	public SampleFile getFileByno(int fileNo) throws SQLException {
		SampleFile file = null;
		
		String sql = "select * from sample_files where file_no = ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, fileNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			file = new SampleFile();
			file.setNo(rs.getInt("file_no"));
			file.setTitle(rs.getString("file_title"));
			file.setName(rs.getString("file_name"));
			file.setCreateDate(rs.getDate("file_create_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return file;
	}
}




























