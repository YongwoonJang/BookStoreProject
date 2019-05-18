<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="dto.Book" %>
<%
	String id = request.getParameter("cartId");
	
	if(id == null||id.trim().equals("")){
		response.sendRedirect("./cart.jsp");
		return;
	}
	
	session.invalidate();
	
	response.sendRedirect("./cart.jsp");

%>