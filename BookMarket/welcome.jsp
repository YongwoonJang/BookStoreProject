<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Date,java.lang.reflect.Array" %>
<html>
<head>
<link rel = "stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href ="/BookMarket/resources/css/menucss.css">
<link rel = "stylesheet" href ="/BookMarket/resources/css/welcomeCss.css">
<link rel = "stylesheet" media="(max-width:900px)" href="/BookMarket/resources/css/responsiveCss.css">
<meta name = "viewport" content ="width=device-width, initial-scale=1">
<title>용운의 즐거운 세상</title>
</head>
<body>	
	<% 
		String tagline = "My week";
		String[] youtubeAddress = new String[7];
		
		Array.set(youtubeAddress, 6, "https://www.youtube.com/embed/A6VqtuCe0no");
		Array.set(youtubeAddress, 5, "https://www.youtube.com/embed/RJvY30axRzA");
		Array.set(youtubeAddress, 4, "https://www.youtube.com/embed/dC8W84c4Exk");
		Array.set(youtubeAddress, 3, "https://www.youtube.com/embed/lLuk2OyFLRo");	
		Array.set(youtubeAddress, 2, "https://www.youtube.com/embed/Ccx9b_FHHK0");
		Array.set(youtubeAddress, 1, "https://www.youtube.com/embed/nbk71vDbSFA");
		Array.set(youtubeAddress, 0, "https://www.youtube.com/embed/foRUbMTB0CY");
		//sorting
	%>
	
	<div class = "container-fluid" style="padding-left:0px;padding-right:0px;" >
		<div class = "jumbotron text-center greeting" >
			J World<br>
			<jsp:include page="./menu.jsp"/>
		</div>
	</div>
	<div class ="container-fluid navigator">	
		<div class="youTubeIframe" align="middle">
			<div style="position:relative">
				<ul class="slider">	
					<% 
						int youtubeAddressLength = youtubeAddress.length;
						
						for(int i = 0; i<youtubeAddressLength; i++){
							int older = i-1;
							int newer = i+1;
							if(newer >= youtubeAddressLength){
								newer = 0;
							}
							if(older < 0){
								older = youtubeAddressLength-1;
							}
						
					%>
						<li>
							<input type="radio" id="slide_<%=i%>" name="slideRadioGroup" class="state" checked="checked">
							<div class="wrap">
								<div class="slide">	
									<iframe 
										class="inneriframe"
										src="<%=youtubeAddress[i]%>"
										frameborder="0" 
										allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
										allowfullscreen>
									</iframe>
								</div>
								<nav class="nav">
									<label class="prev" for="slide_<%=newer%>">AFTER</label>
									<label class="next" for="slide_<%=older%>">BEFORE</label>
								</nav>
							</div>
						</li>
					<%
						}

					%>							
				</ul>
			</div>
		</div>
	</div>	
	<div style="position:relative;height:20%;" align="right">
		<div class="footer">
			<%@include file="footer.jsp" %>	
		</div>
	</div>
</body>
<script>
	var slideIndex = 1;
//	showDivs(slideIndex);
	
	function plusDivs(n){
		showDivs(slideIndex += n);
	}
	
	function showDivs(n){
		var i;
		var x = document.getElementsByClassName("mySlides");

		if(n>x.length){slideIndex = 1}
		if(n==0){slideIndex = x.length}

	
		for (i=0;i<x.length;i++){
			x[i].style.display = "none";

		}
		x[slideIndex-1].style.display = "block";

	}

</script>
</html>




