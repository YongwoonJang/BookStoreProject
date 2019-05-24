<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<script type="text/javascript" src="../resources/js/validation.js"></script>
<script type="text/javascript">
function duplicateCheckFunction() {
	var url = "./checkMember.jsp?id="+document.newMember.id.value;
	
	var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : window.screenX;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : window.screenY;

    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var systemZoom = width/window.screen.availWidth;
	var left = (width-300)/2/systemZoom + dualScreenLeft;
	var top = (height-300)/2/systemZoom + dualScreenTop;

	window.open(url, "get", "width=200px,height=130px,"+"top="+top+",left="+left);
}
function resetIdInputElement(){
	document.newMember.duplicateCheck.value = false;
	document.newMember.duplicateCheckButton.value = "중복체크";
	var element = document.getElementById("duplicateCheckButton");
	element.className = element.className.replace(/\bbtn-success\b/g, "btn-outline-danger");
}
</script>
<title>회원 가입 페이지</title>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3 row justify-content-center">회원가입</h1>
		</div>
	</div>
	
	<sql:setDataSource 
		var="dataSource"
		url="jdbc:mysql://localhost:3306/BookMarketDB"
		driver="com.mysql.jdbc.Driver"
		user="root"
		password="new1234!"
	/>
	
	<sql:query var="resultSet" dataSource="${dataSource}">
			select id from member;
	</sql:query>
	
	<div class="container" align="center">
		<div class="col-md-9">
			<h3 class="form-signin-heading">가입 양식</h3>
			<br>
				<form class="form-signin" action="./processAddMember.jsp" method="post" name="newMember">
				<div class="form-group">
					<div class="form-row justify-content-md-center align-items-center">
						<div class="col-md-8">
							<label for="inputUserName" class="sr-only">아이디 : </label>	
							<input type="text" class="form-control" placeholder="ID" name="id" onkeypress="resetIdInputElement()" required autofocus>
						</div>
						<div class="col-md-2">
							<input type="hidden" name="duplicateCheck" id="duplicateCheck" value="true">
							<input type="button" name="duplicateCheckButton" id="duplicateCheckButton" class="btn btn-md btn-outline-danger" onclick="duplicateCheckFunction()" value="중복체크">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="form-row justify-content-md-left align-items-center">
						<div class="col-md-8 offset-md-1">
							<label for="inputPassword" class="sr-only">비밀번호 : </label>
							<input type="password" class="form-control" placeholder="Password" name="passwd" required>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="form-row justify-content-md-left align-items-center">
						<div class="col-md-8 offset-md-1">
							<label for="inputPassword" class="sr-only"> 이름 : </label>
							<input type="text" class="form-control" placeholder="Name" name="name" required>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-row justify-content-md-left align-items-center">
						<label for="inputPassword" class="sr-only">전화번호 : </label>
						<div class="col-md-2 offset-md-1">
							<select name="phone1" class="form-control">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="016">017</option>
							</select>
						</div>
						<div class="col-md-3">
							<input type="text" name="phone2" placeHolder="앞 네/세자리" class="form-control">
						</div>
						<div class="col-md-3">
							<input type="text" name="phone3" placeHolder="뒤 네자리" class="form-control">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-row justify-content-md-left align-items-center">
						<div class="offset-md-1 col-md-8">
							<label for="inputPassword" class="sr-only">주소 : </label>
							<input type="text" class="form-control" placeholder="Address" name="address" required>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="form-row justify-content-md-left align-items-center">
						<div class="col-md-10 row offset-md-1">
							<div class="col-md-5" style="padding-left:0px">
								<label for="inputPassword" class="sr-only">EMAIL</label>
							    <input type="text" id="emailId" class="form-control" name="emailId" placeholder="e-mail ID">
						    </div>
						    <div class="col-md-1" style="padding-left:0px">
		  				        <div class="input-group-prepend">
						          <div class="input-group-text">@</div>
						        </div>
						    </div>
						    <div class="col-md-4" style="padding-left: 0px;padding-right: 24px;">
						        <input type="text" class="form-control" name="emailDomain" id="emailDomainId" placeholder="domain.com">
					        </div>
				        </div>
				    </div>
				</div>
				<div class="form-group">
					<div class="form-row justify-content-md-left align-items-center">
						<div class="col-md-10 row offset-md-1 ">
							<div class="col-md-2">
									<label for="inputGender" style="margin-right:10px">Gender</label>
							</div>
						    <div class="col-md-3">
						        <div class="form-check">
						          <input class="form-check-input" type="radio" name="gender" id="genderMale" value="male" checked>
						          <label class="form-check-label" for="gender">
						            Male
						          </label>
						        </div>
						    </div>
						    <div class="col-md-3">
						        <div class="form-check">
						          <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="female">
						          <label class="form-check-label" for="gender">
						            Female
						          </label>
						        </div>
						    </div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="form-row justify-content-md-left align-items-center">
							<div class="col-md-10 row offset-md-1">
								<div class="col-md-2">
									<label for="inputBirthday" style="margin-right:10px">Birthday  </label>
								</div>
								<div class="col-md-3">
									<select name="birthYear" style="margin-right:10px" class="form-control" >
										<c:forEach begin="1900" end="2019" var="i">
											<option value="${i}">${i}
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2">
								<select name="birthMonth" style="margin-right:10px" class="form-control" >
									<c:forEach begin="1" end="12" var="i">
										<option value="${i}">${i}
									</c:forEach>
								</select>
								</div>
								<div class="col-md-2">
									<select name="birthDay" class="form-control" >
										<c:forEach begin="1" end="31" var="i">
											<option value="${i}">${i}
										</c:forEach>
									</select>
								</div>
							</div>
					</div>
				</div>
				<br>
				<div class="row justify-content-center">
					<button class="btn btn-success btn-block col-md-3" onclick="addMemberValidation()">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
