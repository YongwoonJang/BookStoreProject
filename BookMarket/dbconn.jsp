<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/bookmarketdb?characterEncoding=UTF-8&serverTimezone=UTC";
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	try{
		conn = DriverManager.getConnection(url, "root", "new1234!");
		System.out.println("데이터베이스 연결에 성공했습니다.");
	}catch(SQLException ex){
		System.out.println("데이터베이스 연결에 실패했습니다.");
		System.out.println("SQLException:"+ex.getMessage());
		
	}


%>