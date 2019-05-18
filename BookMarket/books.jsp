<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" align="center">책 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				String sql = "select * from book;";
				PreparedStatement ptmt = null;
				ResultSet rs = null;
				
				try{
					ptmt = conn.prepareStatement(sql);
					System.out.println(sql);
					rs = ptmt.executeQuery();
				}catch(SQLException ex){
					System.out.println("sql message is " + ex.getMessage());	
				}
				while(rs.next()){
			%>
			<div class="col-md-4">
				<img src="file:///Users/jang-yong-un/Desktop/<%=rs.getString("b_fileName")%>" style="width: 100%">
				<h3><%=rs.getString("b_name")%></h3>
				<p><%=rs.getString("b_description")%>
				<p><%=rs.getString("b_unitPrice")%>원
				<a href="./book.jsp?id=<%=rs.getString("b_id")%>" class="btn btn-secondary">자세히 보기&raquo;</a>
			</div>
			<%
				}
				
				if(rs !=null)
					rs.close();
				if(ptmt !=null)
					ptmt.close();
				if(conn !=null);
					conn.close();
					
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>