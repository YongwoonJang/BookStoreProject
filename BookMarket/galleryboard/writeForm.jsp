<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="mvc.model.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<title>글 작성 하기</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>

<%
   String name = (String)request.getAttribute("name");//data receive.
   
   long time = System.currentTimeMillis();
   SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
  
%>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				Gallery
			</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="col-md-offset-4 justify-content-center">
			<p>
				<form action="<c:url value="/GalleryBoardWriteAction.do"/>" method="post" enctype="multipart/form-data">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">제목</th>
								<th scope="col"><input size="102" type="text" name="title"/></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td scope="row">내용</td>
								<td><textarea rows="10" cols="100" name="content"></textarea></td>
							</tr>
							<tr>
								<td scope="row">파일 올리기</td>
								<td><input type="file" name="filename"></td>
							</tr>
							<tr>
								<td scope="col">글쓴이</td>
								<td scope="col"><%=name%><input name="name" type="hidden" value="<%=name%>"/></td>
							</tr>
							<tr>
								<td scope="col">작성 시간</td>
								<td scope="col"><%=date.format(new Date(time))%><input name="registDay" type="hidden" value="<%=date.format(new Date(time))%>"/></td>
							</tr>
						</tbody>
					</table>
					<button type="submit" class="btn btn-primary">작성 완료</button>
				</form>
			<p>
		</div>
	</div>
</body>
</html>