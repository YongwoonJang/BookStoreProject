<%@page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class = "navbar navbar-expand navbar-dark bg-dark">
	<div class = "container">
		<div class = "navbar-header">
			<a class = "navbar-brand" href="/BookMarket/welcome.jsp">Home</a>
		</div>
		<div class="navbar-nav mr-auto">
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value="/member/addMember.jsp"/>'>회원 가입</a></li>
				</c:when>
				<c:otherwise>
					<li style="padding-top: 7px; color:white">[<%=sessionId%>]님]</li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그 아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원 수정</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/member/deleteMember.jsp"/>">회원 탈퇴</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${sessionId == 'admin' }">
					<li class="nav-item"><a class="nav-link" href="<c:url value="#"/>">회원 목록</a></li>
				</c:when>
			</c:choose>
				<li class="nav-item"><a class="nav-link" href="/BookMarket/books.jsp">공유되고 있는 것들</a></li>
				<li class="nav-item"><a class="nav-link" href="/BookMarket/addBook.jsp">공유하고 싶은 것들 </a></li>
				<!-- <li class="nav-item"><a class="nav-link" href="/BookMarket/editBook.jsp?edit=update">상품 수정</a></li> -->
				<!-- <li class="nav-item"><a class="nav-link" href="/BookMarket/editBook.jsp?edit=delete">상품 삭제</a></li> -->
				<li class="nav-item"><a class="nav-link" href="<c:url value="/GalleryBoardListAction.do?pageNum=1"/>">글과 사진으로  소통하기</a></li>
		</div>
	</div>
</nav>
