<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">확인</h1>
			</div>
		</div>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		String emailId = request.getParameter("emailId");
		String emailDomain = request.getParameter("emailDomain");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String address = request.getParameter("address");
		
		long time = System.currentTimeMillis(); 
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		String birth = birthYear+birthMonth+birthDay;
		String mail = emailId+"@"+emailDomain;
		String phone = phone1+"-"+phone2+"-"+phone3;
		
		
		String queryId = '"'+id+'"';
	%>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/bookmarketdb"
		user="root"
		password="new1234!"
		driver="com.mysql.cj.jdbc.Driver"
	/>
	
	<sql:query dataSource="${dataSource}" var="resultSet">
		SELECT * FROM MEMBER WHERE ID=?
		<sql:param value="<%=queryId%>"/>
	</sql:query>		

	<c:choose>
		<c:when test="${empty resultSet.rowsByIndex[0]}">
			<sql:update dataSource="${dataSource}" var="resultSet">
				INSERT INTO MEMBER(id, password, name, gender, birth, mail, phone, address, regist_day) values(?,?,?,?,?,?,?,?,?);
				<sql:param value="<%=id%>"/>
				<sql:param value="<%=passwd%>"/>
				<sql:param value="<%=name%>"/>
				<sql:param value="<%=gender%>"/>
				<sql:param value="<%=birth%>"/> 
				<sql:param value="<%=mail%>"/>
				<sql:param value="<%=phone%>"/>
				<sql:param value="<%=address%>"/>
				<sql:param value="<%=date.format(new Date(time))%>"/>
			</sql:update>
			<c:redirect url="resultMember.jsp">
				<c:param name="id" value="<%=queryId%>"></c:param>
            </c:redirect>
		</c:when>
		<c:otherwise>
			<div class="jumbotron">
				<div class="container">
					<h2 class="alert alert-danger">아이디가 중복되었습니다. 아래 링크로 이전 페이지 안내됩니다.</h2>
				</div>
			</div>
			<div class="container">
				<p><%=request.getRequestURL()%></p>
				<p><a href="<c:url value="/member/addMember.jsp"/>" class="btn btn-secondary">회원 가입 &raquo;</a>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>