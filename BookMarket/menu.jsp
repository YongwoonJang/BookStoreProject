<%@page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class = "navbar navbar-expand">
	<div class = "container">
		<div class="navbar-nav">
			<li class="nav-item"><a href="<c:url value="/GalleryBoardListAction.do?pageNum=1"/>">I</a>&nbsp;&nbsp;</li>
			<li class="nav-item"><a href="<c:url value="/GalleryBoardListAction.do?pageNum=1"/>">like</a>&nbsp;&nbsp;</li>
			<li class="nav-item"><a href="<c:url value="/GalleryBoardListAction.do?pageNum=1"/>">something&nbsp;to&nbsp;make</a></li>
				
		</div>
	</div>
</nav>
