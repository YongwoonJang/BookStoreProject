<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String bookId = request.getParameter("id");

	PreparedStatement ptmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product";
	ptmt = conn.prepareStatement(sql);
	rs = ptmt.executeQuery();
	
	if(rs.next()){
		sql = "delete from product where p_id = ?";
		ptmt = conn.prepareStatement(sql);
		ptmt.setString(1,bookId);
		ptmt.executeUpdate();
		
	}else{
		out.println("일치하는 상품이 없습니다");
		
	}
	
	if(rs != null)
		rs.close();
	if(ptmt != null)
		ptmt.close();
	if(conn != null)
		conn.close();

	response.sendRedirect("editBook.jsp?edit=delete");




%>