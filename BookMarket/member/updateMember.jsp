<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<title>개인 정보 갱신</title>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">개인 정보 갱신</h1>
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
			select * from member where id=?
			<sql:param value='<%=session.getAttribute("sessionId")%>'/>
	</sql:query>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">가입 양식</h3>
				<form class="form-signin" action="processUpdateMember.jsp" method="post" name="newMember">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">아이디 : </label>
					<input type="text" class="form-control" placeholder="ID" name="id" value="${resultSet.rowsByIndex[0][0]}" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호 : </label>
					<input type="password" class="form-control" placeholder="Password" name="passwd" value="${resultSet.rowsByIndex[0][1]}" required>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">이름 : </label>
					<input type="text" class="form-control" placeholder="Name" name="name" value="${resultSet.rowsByIndex[0][2]}" required>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">성별 : </label>
					<input type="text" class="form-control" placeholder="Gender" name="gender" value="${resultSet.rowsByIndex[0][3]}" required>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">생일 : </label>
					<input type="text" class="form-control" placeholder="Birthday" name="birth" value="${resultSet.rowsByIndex[0][4]}" required>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">이메일 : </label>
					<input type="text" class="form-control" placeholder="E-mail" name="mail" value="${resultSet.rowsByIndex[0][5]}" required>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">전화번호 : </label>
					<input type="text" class="form-control" placeholder="Phone" name="phone" value="${resultSet.rowsByIndex[0][6]}" required>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">주소 : </label>
					<input type="text" class="form-control" placeholder="Address" name="address" value="${resultSet.rowsByIndex[0][7]}" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div>
</body>
</html>