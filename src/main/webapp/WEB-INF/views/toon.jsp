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
<title>Insert title here</title>
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
	<div class="container info">
		<div class="media">
			<img src='<c:url value="${img }" />' class="rounded-lg mr-3" alt="img" />
			<div class="media-body">
				<div class="row">
					&nbsp;&nbsp;<h5 class="mt-0">${id }</h5>
					&nbsp;&nbsp; <span class="mt-0">
						<c:forEach var="w" items="${writer }" varStatus="status">
							${w.name }
						</c:forEach>
					</span>
				</div>
				<div>
					<span>
						<c:forEach var="c" items="${category }">
							${c.category }
						</c:forEach>
					</span>
				</div>
				<div>
					<button id="favBtn" type="button" class="btn btn-outline-dark" onclick="addFunction(this)" style="padding:0; width: 120px">즐겨찾기</button>
					<p id="star_grade">
        				<a class="star" href="#" onclick="star(this)">★</a>
        				<a class="star" href="#" onclick="star(this)">★</a>
        				<a class="star" href="#" onclick="star(this)">★</a>
        				<a class="star" href="#" onclick="star(this)">★</a>
        				<a class="star" href="#" onclick="star(this)">★</a>
					</p>
				</div>
			</div>
		</div>


	</div>
	<div class="container" >
		<div>
			<ul class="list-group list-group-flush">
				<c:forEach var="webtoon" items="${list }" varStatus="status" >
					
					<li class="list-group-item" >
						<a style="color: black" onclick="watch(this);" target="_black"href="${webtoon.url }"> 
							<div class="row">
								<img src="<c:url value='${webtoon.img }'/>" /> 
								<p style="text-align:center; width:150px; overflow: hidden;text-overflow: ellipsis;"><c:out value='${webtoon.episode }' />
								</p>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="row justify-content-center"style="margin:0px;">
		<c:set var="page" value="${page }" />
		<c:if test="${prev }">
			<a
				href="toon?id=<c:out value='${id }'/>&page=<c:out value='${prevpage }'/>"
				style="color: black; margin: 3px;"><</a>
		</c:if>
		<c:forEach var="i" begin="${start }" end="${end }">
			<c:choose>
				<c:when test="${page eq i }">
					<a
						href="toon?id=<c:out value='${id }'/>&page=<c:out value='${i }'/>"
						style="color: black; font-weight: bolder; margin: 3px;"><c:out
							value="[${i+1 }]" /></a>
				</c:when>
				<c:otherwise>
					<a
						href="toon?id=<c:out value='${id }'/>&page=<c:out value='${i }'/>"
						style="color: black; margin: 3px;"><c:out value="[${i+1 }]" /></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${next }">
			<a
				href="toon?id=<c:out value='${id }'/>&page=<c:out value='${nextpage }'/>"
				style="color: black; margin: 3px;">></a>
		</c:if>
	</div>
	
</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
	var request = new XMLHttpRequest();
	var watchRequest = new XMLHttpRequest();
	var watchedRequest = new XMLHttpRequest();
	var ratingRequest = new XMLHttpRequest();
	var t = "";
	var w = "";
	var test = "";
	var form = document.getElementById('search');
	function check(){
	
		if(form.children[0].value==''){
			alert('빈칸 입니다.');
		}
		else{
			form.submit();
		}
	}
	function star(obj){
		if('${userId}'==''){
			window.open('login.do','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
		}else{
			for(var i=0;i<5;i++){
				obj.parentElement.children[i].style="";
			}
			for(var i=0;i<5;i++){
				if(obj.parentElement.children[i]==obj){
					for(var j=0;j<=i;j++){
						obj.parentElement.children[j].style="color:red;";
					}
				}
			}
			updateRating(j);
		}
	}
	function updateRating(rate){
		ratingRequest.open("Get", "./updateRating?id=${userId}&title=${id}&web=${web}&rating="+rate,true);
		ratingRequest.send(null);
	}
	function addFunction(obj) {
		if('${userId}'==''){
			window.open('login.do','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
		}else{
			request.open("Get", "./addMyPage?title=${id}&web=${web}",true);
			request.send(null);
		}
		if(obj.classList.length==3){
			obj.classList.remove('active');
		}else{
			obj.classList.add('active');
		}
	}

	function watch(obj){
		if('${userId}'!=''){
			watchRequest.open("Get", "/watch?title=${id}&episode="+encodeURIComponent(obj.innerText),true);
			watchRequest.onreadystatechange = watchProcess;
			watchRequest.send(null);
		}
	}
	function watchProcess(){
		if(watchRequest.readyState == 4 && watchRequest.status == 200){
			watched();
		}
	}
	function watched(){
		watchedRequest.open("Get", "/watched?webtoonId=${id}",true);
		watchedRequest.onreadystatechange = watchedProcess;
		watchedRequest.send(null);
	}
	function watchedProcess(){
		if(watchedRequest.readyState == 4 && watchedRequest.status == 200){
			w = JSON.parse(watchedRequest.responseText);
			opacity();
		}
	}
	function opacity(){
		t=document.getElementsByClassName("list-group-item");
		for(var i=0;i<t.length;i++){
			for(var j=0;j<w.length;j++){
				if(t[i].innerText==w[j]){
					t[i].style.opacity=0.5;
				}	
			}
		}
	}

	function favBool(){
		if('${fav}'==1){
			document.getElementById('favBtn').classList.add('active');
		}
	}
	
	window.onload = function(){
		watched();
		if('${userId}'!=''){
			favBool();
			if('${star}'!=''){
				var star=document.getElementById('star_grade');
				for(var i=0;i<Number('${star}');i++){
					star.children[i].style="color:red;";
				}
			}
		}
		
	}
	window.oncontextmenu = function () {
		  return false;
	}
	
</script>
</html>