<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>회원 목록</title>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3 row justify-content-center">회원가입</h1>
		</div>
	</div>
	
	<sql:setDataSource 
		var="dataSource"
		url="jdbc:mysql://localhost:3306/bookmarketdb"
		driver="com.mysql.jdbc.Driver"
		user="root"
		password="new1234!"
	/>
	
	<sql:query var="resultSet" dataSource="${dataSource}">
			select id, name, phone, address, regist_day from member;
	</sql:query>

	<div class="container">
		<div class="row justify-content-md-center">
			<table class="table">
				<thead class="thead-dark">
					<c:forEach begin="0" end="${fn:length(resultSet.columnNames)-1}" var="i">
						<th scope="col">
							<c:out value="${resultSet.columnNames[i]}"/>
						</th>
					</c:forEach>	
						<th scope="col">
							<c:out value="비고"/>
						</th>
				</thead>
				<c:forEach begin="0" end="${fn:length(resultSet.rowsByIndex)-1}" var="i">
					<tr>
						<c:forEach begin="0" end="${fn:length(resultSet.rowsByIndex[i])-1}" var="j">
							<td>
								<c:out value="${resultSet.rowsByIndex[i][j]}"/>
							</td>
						</c:forEach>
							<td>
								<form method="post" action="./detailMember.jsp">
									<input type="hidden" value="${resultSet.rowsByIndex[i][0]}" name="id">
									<input type="submit" class="btn btn-danger btn-sm" value="상세보기"> 
								</form>
							</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
</body>
</html>