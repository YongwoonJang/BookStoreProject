<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteMember</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/bookmarketdb"
		user="root"
		password="new1234!"
		driver="com.mysql.jdbc.Driver"
	/>
	<sql:update var="resultSet" dataSource="${dataSource}">
	delete from member where id = ?
		<sql:param value='<%=session.getAttribute("sessionId")%>'/>
	</sql:update>
	<%
		session.setAttribute("sessionId",null);
	%>
	<c:redirect url="/BookMarket/welcome.jsp"/>
</body>
</html>