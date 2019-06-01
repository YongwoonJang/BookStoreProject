<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<link rel = "stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href ="/BookMarket/resources/css/menucss.css">
<link rel = "stylesheet" href ="/BookMarket/resources/css/welcomeCss.css">
<link rel = "stylesheet" media="(max-width:900px)" href="/BookMarket/resources/css/responsiveCss.css">
<meta name = "viewport" content ="width=device-width, initial-scale=1">
<title>함께 하는 공간</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	
	<% 
		String greeting = "공간";
		String tagline = "지난주 저는 이렇게 지냈습니다.";
	%>
	
	<div class = "container-fluid" style="padding-left:0px;padding-right:0px;" >
		<div class = "jumbotron text-center greeting" style="padding-top:0px;padding-bottom:0px;" >
			<p><%= greeting %>
		</div>
	</div>
	<div class ="container-fluid">
		<div align="middle">
			<h3 class="mainText">
				<%= tagline %>
			</h3>		
		</div>
		<div class="youTubeIframe" align="middle">
			<div style="position:relative">
				<iframe src="https://www.youtube.com/embed/nbk71vDbSFA"
					frameborder="0" 
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen>
				</iframe>
			</div>
			<div style="position:relative;height:20%;" align="right">
				<%@include file="footer.jsp" %>	
			</div>
		</div>
	</div>
	
		
</body>
</html>




