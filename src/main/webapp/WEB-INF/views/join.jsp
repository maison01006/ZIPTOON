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
<div class="container" style="padding:0;">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/">ZIPTOON</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="webtoon">모든 웹툰<span class="sr-only"></span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" onclick="minilogin(this)" href="mywebtoon">나의 웹툰</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          고객센터
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/introduction">사이트 설명</a>
          <a class="dropdown-item" onclick="minilogin(this)" href="/qna">문의하기</a>
          <a class="dropdown-item" onclick="minilogin(this)" href="/myqnalist?userId=${userId }">내 문의내역</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" id="search" action="/search" method="get">
      <input class="form-control mr-sm-2" type="search" name="id" placeholder="Search" aria-label="Search">
      <button id="searchBtn" class="btn btn-outline-dark my-2 my-sm-0" type="button" onclick="check()">Search</button>
    </form>
  </div>
</nav>
</div>

	<div class="container" style="margin-top: 5%; border: 1px solid;">
	<form id="joinForm" action="join.do" method="post">
		<div class="container" style="text-align: center;margin-top:10px;">
			<h4><span class="font-weight-bolder">회원가입</span></h4>
		</div>
		<div class="input-group col-5 container" style="margin-top: 5%;">
  			<div class="input-group-prepend">
    			<span class="input-group-text" style="width:120px; " id="basic-addon1">아이디</span>
  			</div>
  			<input id="id" type="text" class="form-control" name="id" style="min-width: 100px;" placeholder="id" onclick="re()">
  			<button type="button" onclick="checkFunction()">중복 확인</button>
		</div>
		<div class="input-group col-5 container">
  			<div class="input-group-prepend">
    			<span class="input-group-text" style="width:120px;">비밀번호</span>
  			</div>
  			<input type="password" class="form-control" id="pw1" name="password" placeholder="password" style="min-width: 120px;">
		</div>
		<div class="input-group col-5 container" style="margin-bottom: 10px;">
  			<div class="input-group-prepend">
    			<span class="input-group-text" style="width:120px;">비밀번호 확인</span>
  			</div>
  			<input type="password" class="form-control" id="pw2" onchange="passwordCheck()" placeholder="password" style="min-width: 120px;">
		</div>
		<div class="container col-4 alert alert-danger" role="alert" id="danger" style="margin-bottom: 10px; text-align: center; display: none;">
  			비밀번호가 다릅니다.
		</div>
		<div class="container" style="text-align: center;">
		<span>자신이 좋아하는 웹툰을 골라주세요</span>
			<div >
				<ul class="row">
				<c:forEach var="w" items="${webtoon }" varStatus="status">
						<li style="list-style:none; margin-right:10px;">
							<div onclick="likeCheck(this)">
								<img src='<c:url value="${w.img}"/>' class="rounded-lg" style="width: 120px; height: 101px; border: 3px solid #dddddd;"/>
								
								<c:choose>
									<c:when test="${w.id.length()>7 }">
											<p><c:out value="${w.id.substring(0,7) }"/>...</p>
									</c:when>
									<c:otherwise>
										<p><c:out value="${w.id }"/></p>
									</c:otherwise>
								</c:choose>
								<input type="hidden" id="webtoon-title" value='<c:out value="${w.id }"/>' />					
							</div>
						</li>
						</c:forEach>
				</ul>
			</div>
		</div>
    	<div class="row text-center" style="width: 100%; margin-bottom: 10px;">
			<div style="width: 30%; float:none; margin:0 auto" >
				<button class="btn btn-secondary btn-round" type="button" style="width: 100%" onclick="searchcheck()">회원가입</button>
			</div>
		</div>

	</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
var danger = document.getElementById('danger');
var id = document.getElementById('id');
var p1 = document.getElementById('pw1');
var p2 = document.getElementById('pw2');
var webtoonList = new Array();
var z="";
var form = document.getElementById('joinForm');
var t=false;
var request = new XMLHttpRequest();
var searchform = document.getElementById('search');
function searchcheck(){

	if(searchform.children[0].value==''){
		alert('빈칸 입니다.');
	}
	else{
		searchform.submit();
	}
}
function re(){
		t=false;
	} 
	function passwordCheck(){

		if(p1.value != p2.value){	
			danger.style.display="";

		}else{
			danger.style.display="none";
		}
	}
	function check(){
		if((p1.value=='')||(p2.value=='')||(id.value=='')){

			alert("빈칸을 채워주세요");
		}
		else if(p1.value != p2.value){

			alert("비밀번호가 틀립니다");
		}
		
		else if(t){
			var like;
			for(var i=0;i<webtoonList.length;i++){
				like = document.createElement("input");

				like.type = "hidden";

				like.name = "like";

				like.value = webtoonList[i];
			    form.appendChild(like);      
			}
			
				form.submit();
		}
		else if(!t){
			alert("중복확인을 눌러주세요");
		}
	}
	
	function checkFunction() {
		if(id.value=='') {
			alert("아이디를 입력해주세요");
			return ;
		}else if(id.value.length>15){
			alert("아이디는 15자리 미만입니다.");
			return ;
		}
		request.open("Get", "./check?id="+encodeURIComponent(id.value), true);
		request.onreadystatechange = checkProcess;
		request.send(null);
	}
	function checkProcess() {
		if (request.readyState == 4 && request.status == 200) {
			d = request.responseText;
			if(d=="true"){
				t=true;
				alert("아이디 사용가능합니다.");
			}else{
				alert("이미 아이디를 사용중입니다.");
			}
		}
	}
	function likeCheck(obj){
		if(obj.style.opacity==0.5){
			obj.style.opacity=1;
			webtoonList.pop(obj.children[2].value);
		}else{
			obj.style.opacity=0.5;
			webtoonList.push(obj.children[2].value);
		}
	}
	
</script>
</html>