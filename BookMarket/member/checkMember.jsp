<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	System.out.println("The id is " + id);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<title>Duplicate text</title>
<script>
	function duplicateCheck(i){
		opener.document.newMember.duplicateCheck.value = i;
		if(i == true){
			var element, name, arr;
			element = opener.document.getElementById("duplicateCheckButton");
			element.className = element.className.replace(/\bbtn-outline-danger\b/g, "btn-success");
			element.value="체크완료"
		}
		window.close();
	}
</script>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/bookmarketdb"
		driver="com.mysql.jdbc.Driver"
		user="root"
		password="new1234!"
	/>
	<sql:query dataSource="${dataSource}" var="resultSet">
		select * from member where id = ?
		<sql:param value="<%=id%>"/>
	</sql:query>
	<c:set var="id" value="<%=id%>"/>
	<div class="container-fluid">
		<c:choose>
			<c:when test="${resultSet.rowsByIndex[0] != null}">
				<div class="row justify-content-center">
    				<div>
    					<br>
						<p>중복된 아이디 입니다.
					</div>
				</div>
				<div class="row justify-content-center">
    				<div>
						<p><input type="button" class="btn btn-sm btn-danger" value="다시입력" onclick="duplicateCheck(false)">
					</div>
				</div>
			</c:when>
			<c:when test="${empty id}">
				 <div class="row justify-content-center">
    				<div>
    					<br>
						<p> 아이디를 입력하세요.
					</div>
				</div>
				<div class="row justify-content-center">
    				<div>
						<p> <input type="button" class="btn btn-sm btn-danger" value="다시입력" onclick="duplicateCheck(false)">
					</div>
				</div>			
			</c:when>
			<c:otherwise>
				<div class="row justify-content-center">
    				<div>
    					<br>
						<p> 아이디를 사용할 수 있습니다.
					</div>
				</div>
				<div class="row justify-content-center">
    				<div>
						<p><input type="button" class="btn btn-sm btn-success" value="확인" onclick="duplicateCheck(true)">
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>