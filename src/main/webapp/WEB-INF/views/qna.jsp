<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/ziptoon.css">
<title>집툰</title>
</head>
<body>
<div class="container" style="padding:0;" id="pcNav">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/">ZIPTOON</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">모든 웹툰<span class="sr-only"></span></a>
      </li>
      <li class="nav-item">
      <c:choose>
      	<c:when test="${empty userId}">
      		<a class="nav-link" href="login">나의 웹툰</a>
      	</c:when>
      	<c:otherwise>
      		<a class="nav-link" href="mywebtoon">나의 웹툰</a>
      	</c:otherwise>
      </c:choose>
        
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          고객센터
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/introduction">사이트 설명</a>
          <c:choose>
      		<c:when test="${empty userId}">
      			 <a class="dropdown-item"href="login">문의하기</a>
      		</c:when>
      		<c:otherwise>
      			 <a class="dropdown-item" href="/qna">문의하기</a>
      		</c:otherwise>
      	</c:choose>
      	<c:choose>
      		<c:when test="${empty userId}">
      			 <a class="dropdown-item" href="login">내 문의내역</a>
      		</c:when>
      		<c:otherwise>
	      		 <a class="dropdown-item" href="/myqnalist?userId=${userId }">내 문의내역</a>
    	  	</c:otherwise>
      	</c:choose>
      	
        </div>
      </li>
      <c:choose>
      		<c:when test="${empty userId}">
      			<li class="nav-item">
      			 	<a class="nav-link" href="login">로그인</a>
      			 </li>
      		</c:when>
      		<c:otherwise>
      			<li class="nav-item">
	      			<p class="nav-link" style="margin:0px;">${userId }</p>
	      		</li>
	      		<li class="nav-item">
	      		 	<a class="nav-link" href="logout">로그아웃</a>
	      		</li>
    	  	</c:otherwise>
      	</c:choose>
      
    </ul>
    <form class="form-inline my-2 my-lg-0" id="search" action="/search" method="get">
      <input class="form-control mr-sm-2" type="search" name="id" placeholder="Search" aria-label="Search">
      <button id="searchBtn" class="btn btn-outline-dark my-2 my-sm-0" type="button" onclick="check()">Search</button>
    </form>
  </div>
</nav>
</div>
<div style="margin-top: 50px;">
<div class="col-8" style="margin: auto;">
	<div style="text-align: center;">
		<p> 웹툰 혹은 웹툰사이트의 추가를 원하시면 웹툰 혹은 웹툰사이트의 주소를 같이 적어주세요. </p>
	</div>
</div>
<form action="/insertQna.do" method="get" class="col-8" style="margin: auto;">
	<div class="row" style="margin: 0;">
  		<div class="form-group row col-9">
  			<input class="form-control" type="text" name="title" id="title" placeholder="제목">
  		</div>
  		<div class="form-group col-3">
    		<select class="form-control" name="type">
    			<option value="ask">문의사항</option>
      			<option value="err">오류</option>
      			<option value="web">웹툰</option>
      			<option  value="etc">기타</option>
    		</select>
  		</div>
  	</div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">내용</label>
    <textarea class="form-control" id="text" name="text" rows="6"></textarea>
  </div>
  <div style="text-align: center;">
  	<button class="btn btn-dark" type="button" onclick="typeCheck()">작성 완료</button>
  </div>
</form>
</div>

</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
	var form = document.getElementsByTagName('form')[1];
	var searchform = document.getElementById('search');
	function check(){
	
		if(searchform.children[0].value==''){
			alert('빈칸 입니다.');
		}
		else{
			searchform.submit();
		}
	}
	function typeCheck(){
		var select = document.getElementsByTagName('select');
		var title = document.getElementById('title');
		var text = document.getElementById('text');
		if(title.value==""){
			alert("제목을 정해주세요");
		}else if(select[0].selectedOptions[0].text=="문의사항"){
			alert("문의사항을 정해주세요");
		}else if(text.value==""){
			alert("내용을 정해주세요");
		}else{
			form.submit();
		}
	}
</script>