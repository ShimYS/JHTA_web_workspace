<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.form.SearchForm"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// jsontext 형식의 요청 데이터 읽어오기
	BufferedReader in = request.getReader();
	String requestData = in.readLine();
	System.out.println("요청 데이터: " + requestData);
	
	// jsontext 형식의 데이터를 자바객체로 변환하기
	Gson gson = new Gson();
	SearchForm searchForm = gson.fromJson(requestData, SearchForm.class);
	
	// 응답데이터 조회하기
	List<Map<String, Object>> productList = new ArrayList<Map<String, Object>>();
	
	Map<String, Object> product1 = new HashMap<>();
	product1.put("name", "맥북프로");
	product1.put("price", 2700000);
	product1.put("stock", 10);
	
	Map<String, Object> product2 = new HashMap<>();
	product2.put("name", "애플워치5");
	product2.put("price", 570000);
	product2.put("stock", 100);
	
	productList.add(product1);
	productList.add(product2);
	
	// 자바객체(ArrayList<Map<String, Object>>)를 jsontext로 변환하기
	String jsonText = gson.toJson(productList);
	
	out.write(jsonText);
%>