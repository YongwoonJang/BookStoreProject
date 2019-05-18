<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="dto.Book, dao.BookRepository" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String path = "c:/upload";
	int maxsize = 5*1024*1024;
	String enctype = "utf-8";
	MultipartRequest multi = new MultipartRequest(request, path, maxsize, enctype, new DefaultFileRenamePolicy());

	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("date");
	String totalpages = multi.getParameter("totalpages");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitInStock = multi.getParameter("unitInStock");
	String condition = multi.getParameter("condition");

	int price = 0;
	if(unitPrice != null){
		price = Integer.parseInt(unitPrice);
	}
	
	long pages = 0;
	if(totalpages != null){
		pages = Long.parseLong(totalpages);
	}
	
	int unitinstock = 0;
	if(unitInStock != null){
		unitinstock = Integer.parseInt(unitInStock);
	}
	
	Enumeration fname = multi.getFileNames();
	String filename = (String)fname.nextElement();
	filename = (String) multi.getFilesystemName(filename);
	
	PreparedStatement ptmt = null;
	
	String sql = "insert into book (b_id, b_name, b_unitPrice, b_author, b_publisher, b_releaseDate, "+
			"b_totalPage, b_description, b_category, b_unitsInStock, b_condition, b_fileName)"+ 
			"values(?,?,?,?,?,?,?,?,?,?,?,?)";
	ptmt = conn.prepareStatement(sql);
	ptmt.setString(1, bookId);
	ptmt.setString(2, name);
	ptmt.setInt(3, price);
	ptmt.setString(4, author);
	ptmt.setString(5, publisher);
	ptmt.setString(6, releaseDate);
	ptmt.setString(7, totalpages);
	ptmt.setString(8, description);
	ptmt.setString(9, category);
	ptmt.setInt(10, unitinstock);
	ptmt.setString(8, condition);
	ptmt.setString(9, filename);
	ptmt.executeUpdate();
	
	if(ptmt != null)
		ptmt.close();
	if(conn != null)
		conn.close();

	response.sendRedirect("books.jsp");
%>