<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<title>회원가입 완료</title>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">가입 내역</h1>
			</div>
		</div>
		<%
			request.setCharacterEncoding("utf-8");
			String id =request.getParameter("id");
		%>
		<sql:setDataSource var="dataSource"
			url="jdbc:mysql://localhost:3306/BookMarketDB"
			driver="com.mysql.jdbc.Driver" user="root" password="new1234!"/>
		<sql:query var="resultSet" dataSource="${dataSource}">
			Select * from Member where id=<%=id%>
		</sql:query>
		
		<div class="container" align="center">
			<div class="col-md-4 col-md-offset-4">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">항 목</th>
							<th scope="col">값</th>
						</tr>
					</thead>
					<c:set var="columnName" value="${resultSet.columnNames}"/>
					<c:set var="columnValue" value="${resultSet.rowsByIndex[0]}"/>
					<tbody>
						<c:forEach begin="0" end="${fn:length(columnName)-1}" var="i">
							<tr>
								<th scope="row"> ${columnName[i]}</th> 
								<td> ${columnValue[i]}</td>
							</tr> 
						</c:forEach>
					</tbody>
				</table>
				<a href="../welcome.jsp" style="text-decoration:none"><button class="btn btn btn-lg btn-success btn-block">확 인</button></a>
			</div>
		</div>
</body>
</html>