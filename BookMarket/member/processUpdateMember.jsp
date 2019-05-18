<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<title>SQL Update</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
	
	%>
	<sql:setDataSource var="dataSource" 
	url="jdbc:mysql://localhost:3306/bookmarketdb"
	driver="com.mysql.jdbc.Driver"
	user="root"
	password="new1234!"
	/>
	<sql:update var="resultSet" dataSource="${dataSource}">
		UPDATE member SET password = ?, name = ?, gender = ?, birth = ?, mail = ?, phone = ?, address = ? where id =?
		<sql:param value="<%=passwd%>"/>
		<sql:param value="<%=name%>"/>
		<sql:param value="<%=gender%>"/>
		<sql:param value="<%=birth%>"/>
		<sql:param value="<%=mail%>"/>
		<sql:param value="<%=phone%>"/>
		<sql:param value="<%=address%>"/>
		<sql:param value='<%=session.getAttribute("sessionId")%>'/>
	</sql:update>
	<%
		response.sendRedirect("../welcome.jsp");
	%>
	
</body>
</html>