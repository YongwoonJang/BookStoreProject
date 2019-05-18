<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="mvc.model.*,java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<link rel = "stylesheet" href ="<c:url value="./resources/css/bootstrap.min.css"/>">
	<title>Detail View</title>
	<script type="text/javascript">
		var clicked = 0;
		function edit(){
			 if (clicked == 0) {
			        document.getElementById('view').style.display = 'none';
			        document.getElementById('edit').style.display = 'block';
			        clicked++;
			        
			 } else {
			    	document.getElementById('view').style.display = 'block';
			        document.getElementById('edit').style.display = 'none';
			        clicked--;
			        
			 }
		}
	
	</script>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<%
		request.setCharacterEncoding("utf-8");
		GalleryBoardDTO data = (GalleryBoardDTO)request.getAttribute("data");//data receive.
		String fileFullPath = "./resources/images/"+data.getFilename();
	%>
	<div class="container">
		<div class="col-md-offset-5 justify-content-center">
			<div id="view" style="display:block">
				<table class="table">
						<thead class="justify-content-center">
							<tr>
								<figure class="figure">
										<img src="<c:url value="<%=fileFullPath%>"/>" class="figure-img img-fluid rounded" alt="이미지가 없습니다.">
			  							<figcaption class="figure-caption"><%=data.getSubject()%></figcaption>
								</figure>
							</tr>
							<tr>
								<th scope="col">제목</th>
								<th scope="col"><%=data.getSubject()%></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td scope="col">내용</td>
								<td scope="col"><%=data.getContent().replace("\n","<br>")%></td>
							</tr>
							<tr>
								<td scope="col">글쓴이</td>
								<td scope="col"><%=data.getName()%></td>
							</tr>
							<tr>
								<td scope="col">작성시간</td>
								<td scope="col"><%=data.getRegist_day()%></td>
							</tr>
							<tr>
								<td scope="col">조회수</td>
								<td scope="col"><%=data.getHit()%></td>
							</tr>
						</tbody>
				</table>
			</div>
			<div id="edit" style="display:none">
				<form method="post" action="<c:url value="/GalleryBoardUpdateAction.do"/>" enctype="multipart/form-data">
						<input name="num" type="hidden" value="<%=request.getParameter("num")%>"/>
						<input name="id" type="hidden" value="<%=session.getAttribute("sessionId")%>"/>
						<input name="pageNum" type="hidden" value="<%=request.getParameter("pageNum")%>"/>
						<table class="table">
							<thead class="justify-content-center">
								<tr>
									<figure class="figure">
										<img src="<c:url value="<%=fileFullPath%>"/>" class="figure-img img-fluid rounded" alt="이미지가 없습니다.">
			  							<figcaption class="figure-caption"><%=data.getSubject()%></figcaption>
									</figure>
								</tr>
								<tr>
									<td scope="row">파일 올리기</td>
									<td><input type="file" name="filename"></td>
								</tr>
								<tr>
									<th scope="col">제목</th>
									<th scope="col"><input size="102" type="text" name="subject" value="<%=data.getSubject()%>"/></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td scope="col">내용</td>
									<td scope="col"><textarea rows="10" cols="100" name="content"><%=data.getContent()%></textarea></td>
								</tr>
								<tr>
									<td scope="col">글쓴이</td>
									<td scope="col"><%=data.getName()%><input name="name" type="hidden" value="<%=data.getName()%>"/></td>
								</tr>
								<tr>
									<td scope="col">작성 시간</td>
									<td scope="col"><%=data.getRegist_day()%><input name="registDay" type="hidden" value="<%=data.getRegist_day()%>"/></td>
								</tr>
							</tbody>
						</table>
						<input type="hidden" name="id" value="<%=session.getAttribute("sessionId")%>"/>
						<button>수정 완료</button>
					</form>
			</div>
			<a type="button" href="<c:url value='GalleryBoardListAction.do?pageNum=1'/>">이전 페이지로 돌아가기</a>
			<% String url = "/GalleryBoardDeleteAction.do?num=" + data.getNum(); %>
			<a type="button" href='<c:url value="<%=url%>"/>'>삭제</a>
			<input type="submit" onClick="javascript:edit()" value="수정하기"/>
			
		</div>
	</div>
	
</body>
</html>