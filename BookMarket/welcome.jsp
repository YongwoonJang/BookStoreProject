<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<link rel = "stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href ="/BookMarket/resources/css/menucss.css">
<title>함께 공유해요</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	
	<% 
		String greeting = "공간";
		String tagline = "지난주 저는 이렇게 지냈습니다.";
	%>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3 text-center">
				<%= greeting %>
			</h1>
		</div>
	</div>
	<div class ="container-fluid">
		<div align="middle">
			<h3>
				<%= tagline %>
			</h3>		
		</div>
		<div style="position:relative;margin:auto;margin-top:30px;" align="middle">
			<iframe width="800" 
				height="500" 
				src="https://www.youtube.com/embed/ZZyQfPUss6g"
				frameborder="0" 
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
				allowfullscreen>
			</iframe>
			<div style="width:800px;" align="right">
				<%@include file="footer.jsp" %>	
			</div>
		</div>
	</div>
	
		
</body>
</html>




