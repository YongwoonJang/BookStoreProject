<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="mvc.model.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<script type="text/javascript" src="/BookMarket/resources/js/validation.js"></script> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
			<h1 class = "display-3 text-center">
				Space
			</h1>
		</div>
	</div>
	
	<div class="container-fulid">
		<div style="position:relative;margin:auto;width:90%;" align="middle">
			<p>
				<form action="<c:url value="/GalleryBoardWriteAction.do"/>" method="post" enctype="multipart/form-data" accept-charset="utf-8" name="newArticle">
					<table class="table">
						<tbody>
							<tr>
								<th scope="col" class="text-center font-weight-bold">제목</th>
								<th scope="col"><input type="text" name="title" style="width:100%;"/></th>
							</tr>
							<tr>
								<td scope="row" class="text-center font-weight-bold">내용</td>
								<td><textarea rows="15" style="width:100%;" name="content"></textarea></td>
							</tr>
							<tr>
								<td scope="row" class="text-center font-weight-bold">파일 올리기</td>
								<td><input type="file" name="filename"></td>
							</tr>
						<!--	<tr>
								<td scope="col" class="text-center font-weight-bold">글쓴이</td>
								<td scope="col"><%=name%><input name="name" type="hidden" value="<%=name%>"/></td>
							</tr>-->
							<tr>
								<td scope="col" class="text-center font-weight-bold">작성 시간</td>
								<td scope="col"><%=date.format(new Date(time))%><input name="registDay" type="hidden" value="<%=date.format(new Date(time))%>"/></td>
							</tr>
						</tbody>
					</table>
					<button type="button" class="btn btn-primary" onclick="addArticleValidation()">작성 완료</button>
				</form>
			<p>
		</div>
	</div>
</body>
</html>
