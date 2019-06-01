<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="mvc.model.*,java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<link rel = "stylesheet" href ="<c:url value="./resources/css/bootstrap.min.css"/>">
	<link rel = "stylesheet" href="/BookMarket/resources/css/viewcss.css">
	<link rel = "stylesheet" media="(max-width:375px)" href="/BookMarket/resources/css/responsiveViewCss.css">
	<title>자세히 보기</title>
	<script type="text/javascript">
		var clicked = 0;
		function edit(){
			 if (clicked == 0) {
			        document.getElementById('view').style.display = 'none';
			        document.getElementById('viewbutton').style.display = 'none';
			        document.getElementById('edit').style.display = 'block';
			        clicked++;
			        
			 } else {
			    	document.getElementById('view').style.display = 'block';
			    	document.getElementById('viewbutton').style.display = 'block';
			        document.getElementById('edit').style.display = 'none';
			        clicked--;
			        
			 }
		}
	
	</script>
	<script type="text/javascript" src="/BookMarket/resources/js/validation.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<%
		request.setCharacterEncoding("utf-8");
		GalleryBoardDTO data = (GalleryBoardDTO)request.getAttribute("data");//data receive.
		String fileFullPath = "./resources/images/"+data.getFilename();
	%>
	<div class="container-fluid" style="margin-top:10px;">
		<div id="viewdetail" style="position:relative;margin:auto;" align="middle">	
			<div id="view" style="display:block">
				<table class="table">
					<tbody>
						<tr>
							<div>
								<figure class="figure">
									<img src="<c:url value="<%=fileFullPath%>"/>" class="figure-img img-fluid rounded" alt="이미지가 없습니다.">
									<figcaption class="figure-caption"><%=data.getSubject()%></figcaption>
								</figure>
							</div>
						</tr>
						<tr>
							<td scope="col" class="text-center font-weight-bold">제목</th>
							<td scope="col"><%=data.getSubject()%></th>
						</tr>
						<tr>
							<td scope="col" class="text-center font-weight-bold">내용</td>
							<td scope="col"><%=data.getContent().replace("\n","<br>")%></td>
						</tr>
						<tr>
						<!--	<td scope="col" class="text-center font-weight-bold">글쓴이</td>
							<td scope="col"><%=data.getName()%></td>-->
						</tr>
						<tr>
							<td scope="col" class="text-center font-weight-bold">작성일</td>
							<td scope="col"><%=data.getRegist_day()%></td>
						</tr>
						<tr>
							<td scope="col" class="text-center font-weight-bold">조회수</td>
							<td scope="col"><%=data.getHit()%></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="edit" style="display:none">
				<form method="post" name="newArticle" action="<c:url value="/GalleryBoardUpdateAction.do"/>" enctype="multipart/form-data">
						<input name="num" type="hidden" value="<%=request.getParameter("num")%>"/>
						<input name="id" type="hidden" value="<%=session.getAttribute("sessionId")%>"/>
						<input name="pageNum" type="hidden" value="<%=request.getParameter("pageNum")%>"/>
						<table class="table">
							<tbody>	
								<tr>
									<div>
										<figure class="figure">
											<img src="<c:url value="<%=fileFullPath%>"/>" class="figure-img img-fluid rounded" alt="이미지가 없습니다.">
			  								<figcaption class="figure-caption"><%=data.getSubject()%></figcaption>
										</figure>
									</div>
								</tr>
								<tr>
									<td scope="col" class="text-center font-weight-bold">파일 올리기</td>
									<td><input type="file" name="filename" style="width:100%"/><input type="hidden" name="originfilename" value="<%=data.getFilename()%>"/><input type="hidden" name="originfilesize" value="<%=data.getFilesize()%>"/></td>
								</tr>
								<tr>
									<td scope="col" class="text-center font-weight-bold">제목</td>
									<td scope="col"><input style="width:100%" type="text" name="title" value="<%=data.getSubject()%>"/></td>
								</tr>
							
								<tr>
									<td scope="col" class="text-center font-weight-bold">내용</td>
									<td scope="col"><textarea rows="10" style="width:100%" name="content"><%=data.getContent()%></textarea></td>
								</tr>
							<!--	<tr>
									<td scope="col" class="text-center font-weight-bold">글쓴이</td>
									<td scope="col"><%=data.getName()%><input name="name" type="hidden" value="<%=data.getName()%>"/></td> 
								</tr>-->
								<tr>
									<td scope="col" class="text-center font-weight-bold">작성 시간</td>
									<td scope="col"><%=data.getRegist_day()%><input name="registDay" type="hidden" value="<%=data.getRegist_day()%>"/></td>
								</tr>
							</tbody>
						</table>
						<input type="hidden" name="id" value="<%=session.getAttribute("sessionId")%>"/>
						<button type="button" class="btn btn-primary" onClick="addArticleValidation()">수정 완료</button>
				</form>
			</div>
			<div id="viewbutton" style="display:block;">
				<a href="<c:url value='GalleryBoardListAction.do?pageNum=1'/>"><button type="submit" class="btn btn-primary">이전 페이지로 돌아가기</button></a>
				<% String url = "/GalleryBoardDeleteAction.do?num=" + data.getNum(); %>
				<button type="submit" class="btn btn-primary" formaction='<c:url value="<%=url%>"/>'>삭제</button>
				<button type="button" class="btn btn-primary" onClick="javascript:edit()">수정하기</button>
			</div>
		</div>
	</div>
	
</body>
</html>
