<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page errorPage="exceptionNoBookId.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 정보</title>
<script type="text/javascript">
	function addToCart(){
		if(confirm("책을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="./menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%@include file="dbconn.jsp"%>
	<%
		
		ResultSet rs = null;
		String id = request.getParameter("id");
		String sql = "select * from book where b_id='"+id+"'";
	
		Statement stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="col-md-5">
					<img src="file:///Users/jang-yong-un/Desktop/<%=rs.getString("b_fileName")%>" style="width:100%">
				</div>
				<h3><%=rs.getString("b_name")%></h3>
				<p><%=rs.getString("b_description")%>
				<p><b>상품 코드 :</b><span class="badge badge-danger">
					<%=rs.getString("b_id")%>
				</span>
				<p><b>제조사</b> : <%=rs.getString("b_publisher")%>
				<p><b>분류</b> : <%=rs.getString("b_category") %>
				<p><b>제고수</b> : <%=rs.getString("b_unitsInStock")%>
				<h4><%=rs.getString("b_unitPrice")%>원</h4>
				<form name="addForm" action="./addCart.jsp?id=<%=rs.getString("b_id")%>" method="post">
					<p><a href="#" class="btn btn-info" onClick="addToCart()">상품 주문 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="./books.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
				</form>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>