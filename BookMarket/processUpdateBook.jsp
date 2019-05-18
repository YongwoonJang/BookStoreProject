<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String filename="";
	String realFolder = "c:\\upload";
	String encType = "utf-8";
	int maxSize = 5 * 1024 * 1024;		
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String author = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	String publisher = multi.getParameter("publisher");
	String totalPages = multi.getParameter("totalPages");
	String releaseDate = multi.getParameter("releaseDate");
	
	Integer price;
	
	if(unitPrice.isEmpty()){
			price = 0;
	}else{
			price = Integer.valueOf(unitPrice);
	}
	
	long stock; 
	
	if(unitsInStock.isEmpty()){
			stock = 0;
	}else{
			stock = Long.valueOf(unitsInStock);
	}
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement ptmt = null;
	ResultSet rs = null;
	
	String sql = "select * from book where b_id = ?";
	ptmt = conn.prepareStatement(sql);
	ptmt.setString(1, bookId);
	rs = ptmt.executeQuery();
	
	if (rs.next()){
		if(fileName != null){
			sql = "UPDATE book set b_name=?, b_unitPrice=?,b_description=?,b_author=?,b_category=?,b_unitsInStock=?,b_condition=?,b_file=?,b_publisher=?,b_totalpages=?,b_releaseDate=? where b_id=?";
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, name);
			ptmt.setInt(2, price);
			ptmt.setString(3, description);
			ptmt.setString(4, author);
			ptmt.setString(5, category);
			ptmt.setLong(6, stock);
			ptmt.setString(7, condition);
			ptmt.setString(8, fileName);
			ptmt.setString(9, bookId);
			ptmt.setString(10, publisher);
			ptmt.setString(11, totalPages);
			ptmt.setString(12, releaseDate);
			ptmt.executeUpdate();
			
		}else{
			sql = "UPDATE book set b_name=?, b_unitPrice=?,b_description=?,b_manufacturer=?,b_category=?,b_unitsInStock=?,b_condition=?,b_publisher=?,b_totalpages=?,b_releaseDate=? where p_id=?";
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, name);
			ptmt.setInt(2, price);
			ptmt.setString(3, description);
			ptmt.setString(4, author);
			ptmt.setString(5, category);
			ptmt.setLong(6, stock);
			ptmt.setString(7, condition);
			ptmt.setString(8, bookId);
			ptmt.setString(9, publisher);
			ptmt.setString(10, totalPages);
			ptmt.setString(11, releaseDate);
			ptmt.executeUpdate();
			
		}
	}
	
	if (rs != null){
			rs.close();
	}
	if (ptmt != null){
			ptmt.close();
	}
	if (conn != null){
			conn.close();
	}
	
	response.sendRedirect("editBook.jsp?edit=update");

%>