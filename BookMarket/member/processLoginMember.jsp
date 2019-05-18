<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<title>Login 처리 결과</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String originURL = request.getParameter("originURL");
		
		if(originURL.equals("null")){
			originURL = "../welcome.jsp";

		}
		
		System.out.println("[1][processLoginMember] originURL is "+originURL);
	%>
	<sql:setDataSource var="dataSource" 
		url="jdbc:mysql://localhost:3306/bookmarketdb"
		driver="com.mysql.jdbc.Driver"
		user="root"
		password="new1234!"
	/>
	<sql:query var="resultSet" dataSource="${dataSource}">
		 select * from member where id = ? and password = ? 
		 <sql:param value="<%=id%>"/>
		 <sql:param value="<%=passwd%>"/>
	</sql:query>
	<c:choose>
		<c:when test="${resultSet.rowsByIndex[0]!=null}">
			<% 
				session.setAttribute("sessionId", id);
				session.setAttribute("originURL", null);
				
				System.out.println("[processLoginMember] originURL is "+originURL);
			%>
			<c:redirect	url = "<%=originURL%>"/>
		</c:when>
		<c:otherwise>
			<p> 아이디가 없습니다. 재시도 해주세요.
			<%
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/member/loginMember.jsp");
				dispatcher.forward(request, response);
			%>
		</c:otherwise>
	</c:choose>
</body>
</html>