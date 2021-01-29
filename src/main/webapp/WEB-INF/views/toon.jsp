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
								<div class="col row justify-content-center">
									<p style="text-align:center; overflow: hidden;text-overflow: ellipsis;"><c:out value='${webtoon.episode }' />
								</div>
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
<div id="footer" class="row col" style="margin:0px;bottom: 0px;position: fixed;z-index: 999999;padding: 0;">
<div class="col" style="text-align: center;border-right: 1px solid #dddddd;margin-top:5px;background-color: white;">
	<a style="color:black;" onclick="activeFunc(this)" href="/">
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
  <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
</svg>
	<p>메인</p>
	</a>
	</div>
	<div class="col active"  style="text-align: center;margin-top:5px;background-color: white;">
	<a href="webtoon" onclick="activeFunc(this)">
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-emoji-smile" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path fill-rule="evenodd" d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683z"/>
  <path d="M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
</svg>
	<p>웹툰</p>
	</a>
	</div>
	
	<div class="col" style="text-align: center;border-right: 1px solid #dddddd;margin-top:5px;background-color: white;">
	<c:choose>
      	<c:when test="${empty userId}">
      		<a href="login">
      	</c:when>
      	<c:otherwise>
      		<a href="mywebtoon" onclick="activeFunc(this)">
      	</c:otherwise>
      </c:choose>
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-archive" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path fill-rule="evenodd" d="M0 2a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 12.5V5a1 1 0 0 1-1-1V2zm2 3v7.5A1.5 1.5 0 0 0 3.5 14h9a1.5 1.5 0 0 0 1.5-1.5V5H2zm13-3H1v2h14V2zM5 7.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
	</svg>
	<p>my</p>
	</a>
	</div>
	
	<div class="col" style="text-align: center;border-right: 1px solid #dddddd;margin-top:5px;background-color: white;">
		<a href="search" onclick="activeFunc(this)">
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
</svg>
	<p>찾기</p>
	</a>
	</div>
	
	<div class="col"  style="text-align: center;margin-top:5px;background-color: white;">
	<a href="setting" onclick="activeFunc(this)">
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z"/>
  <path fill-rule="evenodd" d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z"/>
</svg>
	<p>설정</p>
	</a>
	</div>
</div>
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