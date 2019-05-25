function addBookValidation(){
	var bookId = document.getElementById("bookId");
	var name = document.getElementById("name");
	var price = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitInStock");
	
	var regBookId = /^(ISBN)[1-9]+/
	var regUnitsInStock = /[0-9]+/;
	
	if(!regBookId.test(bookId.value)){
		alert("[도서코드]\nISBN과 숫자를 조합하여 5~12자까지 입력하세요.\n첫글자는 반드시 ISBN으로 시작하세요.");
		bookId.select();
		bookId.focus();
		return;
	}
	
	if(name.value.length <= 12 && name.value.length >= 5){
		alert("[도서명]\n문자 길이가 4~12자까지 입력하세요");
		name.select();
		name.focus();
		return;
	}
	
	if(price.value.length == 0){
		alert("[가격]\n가격을 입력하세요.");
		price.select();
		price.focus();
		return;
		
	}else if(price.value < 0){
		alert("[가격]\n가격은 0이상이어야 합니다.");
		price.select();
		price.focus();
		return;
	}
	
	if(!regUnitsInStock.test(unitsInStock.value)){
		alert("[재고]\n재고는 숫자이어야 합니다.");
		unitsInStock.select();
		unitsInStock.focus();
		return;
	}
	
	document.newBook.submit();
	
}

function addMemberValidation(){
	var duplicationCheck = document.getElementById("duplicateCheck");
	
	if(duplicationCheck.value== "false"){
		alert("중복 체크가 완료되지 않았습니다");
		return;
	}else{
		alert("중복 체크가 완료되었습니다.");
	}
	
	document.newMember.submit();
	
}

function addArticleValidation(){
	var title = document.getElementsByName("title");
	var content = document.getElementsByName("content");
	var filename = document.getElementsByName("filename");

	if(title[0].value.length == 0){
		alert("제목을 입력 해주세요.");
		title[0].select();
		title[0].focus();
		return;
	}
	if(content[0].value.length == 0){
		alert("내용을 입력 해주세요.");
		content[0].select();
		content[0].focus();
		return;
	}
	if(filename[0].value.length == 0){
		alert("파일을 업로드 해주세요.");
		filename[0].select();
		filename[0].focus();
		return;
	}	
	
	document.newArticle.submit();

}
