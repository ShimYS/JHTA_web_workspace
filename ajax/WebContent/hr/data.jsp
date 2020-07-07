<%@page import="com.sample.hr.vo.Employee"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.hr.dao.EmployeeDao"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	int departmentId = NumberUtil.stringToInt(request.getParameter("deptid"));

	EmployeeDao employeeDao = new EmployeeDao();
	List<Employee> employees = employeeDao.getEmployeesByDept(departmentId);
	
	// Gson은 자바객체를 JSON 형식의 텍스트로 변환해준다.
	Gson gson = new Gson();
	String jsonContent = gson.toJson(employees);	// JSON text로 변환
	
	out.write(jsonContent);
%>