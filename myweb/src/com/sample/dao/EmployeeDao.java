package com.sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.util.ConnectionUtil;
import com.sample.vo.Employee;

public class EmployeeDao {
	
	/**
	 * 모든 사원정보를 반환한다.
	 * @return 모든 사원정보
	 * @throws SQLException
	 */
	public List<Employee> getAllEmployee() throws SQLException {
		List<Employee> employees = new ArrayList<Employee>();
		
		String sql = "select a.employee_id, a.first_name, a.last_name, a.job_id, b.department_id, b.department_name "
				+ "from employees A, departments B "
				+ "where a.department_id = b.department_id(+) "
				+ "order by a.employee_id asc";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Employee employee = new Employee();
			employee.setId(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setJobId(rs.getString("job_id"));
			employee.setDepartmentId(rs.getInt("department_id"));
			employee.setDepartmentName(rs.getString("department_name"));
			
			employees.add(employee);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return employees;
	}
	
	/**
	 * 지정된 범위내의 사원정보를 반환한다.
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @return 사원정보
	 * @throws SQLException
	 */
	public List<Employee> getEmployeesByRange(int beginNumber, int endNumber) throws SQLException{
		List<Employee> employees = new ArrayList<Employee>();
		
		String sql = "select a.employee_id, a.first_name, a.last_name, a.email, a.phone_number "  
					+ "     ,a.hire_date, a.job_id, a.salary, a.commission_pct, a.manager_id "  
					+ "    ,b.department_id, b.department_name " 
					+ "    ,c.first_name manager_first_name, c.last_name manager_last_name " 
					+ "from (select employee_id, first_name, last_name, email, phone_number, hire_date " 
					+ "            , job_id, salary, commission_pct, manager_id, department_id " 
					+ "            , row_number() over(order by employee_id asc) rownumber " 
					+ "      from employees) A " 
					+ "    , departments B " 
					+ "    , employees C " 
					+ "where a.department_id = b.department_id(+) " 
					+ "and a.manager_id = c.employee_id(+) " 
					+ "and rownumber >= ? and rownumber <= ? " 
					+ "order by a.employee_id asc ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Employee employee = new Employee();
			employee.setId(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setEmail(rs.getString("email"));
			employee.setPhoneNumber(rs.getString("phone_number"));
			employee.setHireDate(rs.getDate("hire_date"));
			employee.setJobId(rs.getString("job_id"));
			employee.setSalary(rs.getDouble("salary"));
			employee.setCommissionPct(rs.getDouble("commission_pct"));
			employee.setManagerId(rs.getInt("manager_id"));
			employee.setManagerFirstName(rs.getString("manager_first_name"));
			employee.setManagerLastName(rs.getString("manager_last_name"));	
			employee.setDepartmentId(rs.getInt("department_id"));
			employee.setDepartmentName(rs.getString("department_name"));
			
			employees.add(employee);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return employees;
	}
	
	/**
	 * 사원수를 반환한다.
	 * @return 
	 * @throws SQLException
	 */
	public int gerEmployeesCount() throws SQLException {
		int rowCount = 0;
		
		String sql = "select count(*) cnt from employees ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			rowCount = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return rowCount;
	}
	
	/**
	 * 지정된 사원번호에 해당하는 사원의 상세정보를 반환한다.
	 * @param employeeId 조회할 사원번호
	 * @return 사원번호에 해당하는 사원이 존재하지 않는 경우 null반환
	 * @throws SQLException
	 */
	public Employee getEmployeeById(int employeeId) throws SQLException {
		Employee employee = null;
		
		String sql = "select a.employee_id, a.first_name, a.last_name, a.email, a.phone_number "  
					+ "    ,a.hire_date, a.job_id, a.salary, a.commission_pct, a.manager_id " 
					+ "    ,b.department_id, b.department_name " 
					+ "    ,c.first_name manager_first_name, c.last_name manager_last_name " 
					+ "from employees A, departments B, employees C " 
					+ "where a.department_id = b.department_id(+) " 
					+ "and a.manager_id = c.employee_id(+) " 
					+ "and a.employee_id = ? " 
					+ "order by a.employee_id asc ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, employeeId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			employee = new Employee();
			employee.setId(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setEmail(rs.getString("email"));
			employee.setPhoneNumber(rs.getString("phone_number"));
			employee.setHireDate(rs.getDate("hire_date"));
			employee.setJobId(rs.getString("job_id"));
			employee.setSalary(rs.getDouble("salary"));
			employee.setCommissionPct(rs.getDouble("commission_pct"));
			employee.setManagerId(rs.getInt("manager_id"));
			employee.setManagerFirstName(rs.getString("manager_first_name"));
			employee.setManagerLastName(rs.getString("manager_last_name"));	
			employee.setDepartmentId(rs.getInt("department_id"));
			employee.setDepartmentName(rs.getString("department_name"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return employee;
	}
}
