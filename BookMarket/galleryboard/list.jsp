<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="mvc.model.GalleryBoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href ='<c:url value="/resources/css/bootstrap.min.css"/>'>
<title>GalleryBoard</title>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<%
		
		/*if(session.getAttribute("sessionId")==null){
			   response.sendRedirect("/BookMarket/member/loginMember.jsp");
		}
		*/
		ArrayList<GalleryBoardDTO> data = (ArrayList<GalleryBoardDTO>)request.getAttribute("data");//data receive.
		 
	%>
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3">
					갤러리 
				</h1>
			</div>
		</div>
		
		<div class="container">
			<div class="col-md-offset-4 justify-content-center">
				<p>
				<table class="table">
					<tbody>
					<%
						System.out.println("galleryboard_list.jsp:37 line null pointer execption test");
						int dataIndex = 0;
						if(!data.isEmpty()){	
							System.out.println("galleryboard_list.jsp:40 data is not empty");
							for(int i = 0; i<((data.size()-1)/3+1);i++){
								System.out.println("galleryboard_list.jsp:41 in the for loop i");
								System.out.println("galleryboard_list.jsp:42 data size is "+data.size());
					%>			
						<tr>
						<%
								for(int j = 0; j<3; j++){
									System.out.println("galleryboard_list.jsp:47 in the for loop j");
									if(dataIndex==data.size()){
										break;
										
									}
									
									String ref = "./GalleryBoardViewAction.do?num="+data.get(dataIndex).getNum()+"&pageNum="+request.getParameter("pageNum");
									String fileFullPath = "/resources/images/"+data.get(dataIndex).getFilename();
									System.out.println("galleryboard_list.jsp:54 fileFullPath "+fileFullPath);
						%>
							
									<td scope="row">
										<a href='<c:url value="<%=ref%>"/>'>
											<figure class="figure">
												<img src="<c:url value="<%=fileFullPath%>"/>" class="figure-img img-fluid rounded" alt="이미지가 없습니다.">
		  										<figcaption class="figure-caption"><%=data.get(dataIndex).getSubject()%></figcaption>
											</figure>
										</a>
									</td>
						<%		
									System.out.println("galleryboard_list.jsp:66 data.get("+dataIndex+") "+data.get(dataIndex).getSubject());
									dataIndex ++;
								}
						%>
						</tr>
					<%
							}
						}
					%>	
					</tbody>
				</table>
				<form action="<c:url value="/GalleryBoardWriteForm.do"/>" method="post">
					<input type="hidden" name="id" value="<%=session.getAttribute("sessionId")%>"/>
					<button type="submit" class="btn btn-primary">글 추가하기</button>
				</form>			
			</div>
		</div>

</body>
</html>
