<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	StringBuilder sb = new StringBuilder();
	sb.append("<?xml version='1.0' encoding='UTF-8' ?>");
	sb.append("<book>");
	sb.append("		<title>자바의 정석</title>");
	sb.append("		<writer>남궁 성</writer>");
	sb.append("		<publisher>도우 출판사</publisher>");
	sb.append("		<price>36,000 원</price>");
	sb.append("		<pubdate>2019.12.21</pubdate>");
	sb.append("</book>");
	
	String text = sb.toString();
	out.write(text);
%>