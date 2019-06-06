<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<link rel = "stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href ="/BookMarket/resources/css/menucss.css">
<link rel = "stylesheet" href ="/BookMarket/resources/css/welcomeCss.css">
<link rel = "stylesheet" media="(max-width:900px)" href="/BookMarket/resources/css/responsiveCss.css">
<meta name = "viewport" content ="width=device-width, initial-scale=1">
<title>Public Service Announcement</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	
	<% 
		String greeting = "공간";
		String tagline = "My week";
	%>
	
	<div class = "container-fluid" style="padding-left:0px;padding-right:0px;" >
		<div class = "jumbotron text-center greeting" style="padding-top:0px;padding-bottom:0px;" >
			<p><%= greeting %>
		</div>
	</div>
	<div class ="container-fluid navigator">	
		<div class="youTubeIframe" align="middle">
			<div style="position:relative">
				<ul class="slider">	
					<li>
						<input type="radio" id="slide_1" name="slideRadioGroup" class="state" checked="checked">
						<div class="wrap">
							<div class="slide">	
								<iframe 
									class="inneriframe"
									src="https://www.youtube.com/embed/Ccx9b_FHHK0"
									frameborder="0" 
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
									allowfullscreen>
								</iframe>
							</div>
							<nav class="nav">
								<label class="prev" for="slide_3">prev</label>
								<label class="next" for="slide_2">next</label>
							</nav>
						</div>
					</li>
					<li>
						<input type="radio" id="slide_2" name="slideRadioGroup" class="state">
						<div class="wrap">
							<div class="slide">
								<iframe 
									class="inneriframe"
									src="https://www.youtube.com/embed/nbk71vDbSFA"
									frameborder="0" 
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
									allowfullscreen>
								</iframe>
							</div>
							<nav class="nav">
								<label class="prev" for="slide_1">prev</label>
								<label class="next" for="slide_3">next</label>
							</nav>
						</div>
					</li>	
					<li>
						<input type="radio" id="slide_3" name="slideRadioGroup" class="state">
						<div class="wrap">
							<div class="slide">
								<iframe 
									class="inneriframe"
									src="https://www.youtube.com/embed/foRUbMTB0CY"
									frameborder="0" 
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
									allowfullscreen>
								</iframe>
							</div>
							<nav class="nav">
								<label class="prev" for="slide_2">prev</label>
								<label class="next" for="slide_1">next</label>
							</nav>
						</div>
					</li>						
				</ul>
			</div>
			<div style="position:relative;height:20%;" align="right">
				<div class="footer">
					<%@include file="footer.jsp" %>	
				</div>
			</div>
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




