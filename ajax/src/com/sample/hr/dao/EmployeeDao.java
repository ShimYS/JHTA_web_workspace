package com.sample.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.hr.vo.Department;
import com.sample.hr.vo.Employee;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;

public class EmployeeDao {
	
	public List<Department> getAllDepartments() throws SQLException{
		List<Department> departments = new ArrayList<Department>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("hr.getAllDepartments"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Department department = new Department();
			department.setId(rs.getInt("department_id"));
			department.setName(rs.getString("department_name"));
			
			departments.add(department);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return departments;
	}
	
	public List<Employee> getEmployeesByDept(int departmentId) throws SQLException{
		List<Employee> employees = new ArrayList<Employee>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("hr.getEmployeesByDept"));
		pstmt.setInt(1, departmentId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Employee employee = new Employee();
			employee.setNo(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setPhoneNumber(rs.getString("phone_number"));
			employee.setJobId(rs.getString("job_id"));
			employee.setSalary(rs.getDouble("salary"));
			employee.setHireDate(rs.getDate("hire_date"));
			
			employees.add(employee);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return employees;
	}
	
	public Employee getEmployeeById(int employeeId) throws SQLException {
		Employee employee = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("hr.getEmployeeById"));
		pstmt.setInt(1, employeeId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			employee = new Employee();
			employee.setNo(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setPhoneNumber(rs.getString("phone_number"));
			employee.setJobId(rs.getString("job_id"));
			employee.setSalary(rs.getDouble("salary"));
			employee.setHireDate(rs.getDate("hire_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return employee;
	}
}

















