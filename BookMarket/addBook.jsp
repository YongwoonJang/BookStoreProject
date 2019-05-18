<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>도서 등록</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>'/>
	<fmt:bundle basename="bundle.message">
		<jsp:include page="menu.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3"><fmt:message key="title"/></h1>
			</div>
		</div>
		<div class="container">
			<p><a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
			<p><a href="./logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
			<form name="newBook" action="./processAddBook.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="bookId"/> :</label> 
					<div class="col-sm-3">
						<input type="text" name="bookId" class="form-control" id="bookId">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="name"/> :</label> 
					<div class="col-sm-3">
						<input type="text" name="name" class="form-control" id="name">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitPrice"/> :</label> 
					<div class="col-sm-3">
						<input type="text" name="unitPrice" class="form-control" id="unitPrice">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="author"/> :</label> 
					<div class="col-sm-3">
						<input type="text" name="author" class="form-control">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="Publisher"/> :</label> 
					<div class="col-sm-3">
						<input type="text" name="publisher" class="form-control">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="releaseDate"/> :</label> 
					<div class="col-sm-3">
						<input type="text" name="date" class="form-control">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="totalPages"/> :</label> 
					<div class="col-sm-3">
						<input type="text" name="totalapages" class="form-control">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="description"/> :</label> 
					<div class="col-sm-3">
						<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="category"/> :</label> 
					<div class="col-sm-3">
						<input type="text" name="category" class="form-control">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitsInStock"/> :</label> 
					<div class="col-sm-3">
						<input type="text" name="unitInStock" class="form-control" id="unitInStock">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="condition"/> :</label>
					<div class="col-sm-3">
						<input type="radio" name="condition" value="New"><fmt:message key="condition_New"/>
						<input type="radio" name="condition" value="Old"><fmt:message key="condition_Old"/>
						<input type="radio" name="condition" value="Ebook"><fmt:message key="condition_Refurbished"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="bookImage"/> :</label>
					<div class="col-sm-3">
						<input type="file" name="filename">
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" class="btn btn-primary" value=<fmt:message key="button"/> onclick="addBookValidation()">
					</div>
				</div>
					
			</form>
		</div>
	</fmt:bundle>
</body>
</html>