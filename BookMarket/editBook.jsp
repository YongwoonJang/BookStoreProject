<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<script type="text/javascript">
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제합니다!!")==true)
			location.href = "./deleteBook.jsp?id="+id;
		else
			return;
	}
</script>
<title>상품 편집</title>
<%
	String edit = request.getParameter("edit");

%>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement ptmt = null;
				ResultSet rs = null;
				
				String sql = "select * from book";
				ptmt = conn.prepareStatement(sql);
				rs = ptmt.executeQuery();
				while(rs.next()){
			%>
			<div class="col-md-r">
				<img src="c:/upload/<%=rs.getString("b_fileName")%>" style ="width:100%">
				<h3><%=rs.getString("b_name") %></h3>
				<p><%=rs.getString("b_description") %>
				<p><%=rs.getString("b_unitPrice") %>
				<p><%
					if (edit.equals("update")){
					%>
					<a href="./updateProduct.jsp?id=<%=rs.getString("b_id")%>" class="btn btn-success" role=button">수정 &raquo;</a>
					<%
					} else if(edit.equals("delete")){
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("b_id")%>')" class="btn btn-danger" role="button" >삭제 &raquo;</a>
					<%
					}
					%>
			</div>
			<%
				}
				if (rs != null)
					rs.close();
				if (ptmt != null)
					ptmt.close();
				if (conn != null)
					conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>