<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.css?version=1">
<link rel="stylesheet" href="resources/css/ziptoon.css?version=5">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
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
        <a class="nav-link" href="webtoon">모든 웹툰<span class="sr-only"></span></a>
      </li>
      <li class="nav-item">
      <c:choose>
      	<c:when test="${empty userId}">
      		<a class="nav-link" href="login">나의 웹툰</a>
      	</c:when>
      	<c:otherwise>
      		<a class="nav-link" href="/">나의 웹툰</a>
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
	      		 	<a class="nav-link" href="logout.do">로그아웃</a>
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

<div style="text-align: center;margin-top: 15px;">
	<p class="font-weight-bolder" style="font-size:30px;">나의 웹툰 보기</p>
</div>

<div class="container">
	<div class="row" id="days">
		<button type="button" class="col btn btn-outline-primary active">월</button>
		<button type="button" class="col btn btn-outline-primary">화</button>
		<button type="button" class="col btn btn-outline-primary">수</button>
		<button type="button" class="col btn btn-outline-primary">목</button>
		<button type="button" class="col btn btn-outline-primary">금</button>
		<button type="button" class="col btn btn-outline-primary">토</button>
		<button type="button" class="col btn btn-outline-primary">일</button>
	</div>
	<div>
	<ul class="row justify-content-center"style="list-style: none;padding: 0;margin: 0;">
		<li style="height:74px;" >
			<button class="btn active btn-outline-success" style=" display: inline-block;"onclick="viewNaver(this)">네이버</button>
		</li>
		<li style="height:74px;">
			<button class="btn active btn-outline-warning" style="width:74px;text-align:center display: inline-block;"onclick="viewDaum(this)">다음</button>
		</li>
	</ul>
</div> 
	<div id="webtoon">
	</div>
</div>

</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
var request = new XMLHttpRequest();
var days = ["월","화","수","목","금","토","일"];
var type=[1,1,-1];
var webtoonDiv = document.getElementById('webtoon');
var d="";
var form = document.getElementById('search');
function check(){

	if(form.children[0].value==''){
		alert('빈칸 입니다.');
	}
	else{
		form.submit();
	}
}
	function myPageFunction() {
		request.open("Get", "./getMyWebToon?id="+'${userId}', true);
		request.onreadystatechange = myPageProcess;
		request.send(null);
	}
	function myPageProcess(){
		if(request.readyState == 4 && request.status == 200){
			d = JSON.parse(request.responseText);
			
			if(window.innerWidth<1000){
					webtoonDiv.innerHTML="";
				   webtoonDiv.append(phon(d));
				 var swiper = new Swiper('.swiper-container');
				 swiper.on('slideChange',function(){
					 var day = document.getElementById('days');
					 for(var i=0;i<day.childElementCount;i++){
						 day.children[i].classList.remove('active');
					 }
					 day.children[swiper.activeIndex].classList.add('active');
				 });
				 swiper.init();
			}else{
				pc()
			}
		}
	}
	function phon(data){
			var div1 = document.createElement('div');
			var div2 = document.createElement('div');
			var div3 = document.createElement('div');
			div1.classList.add('swiper-container');
			div1.style="height:"+(window.innerHeight-350)+"px";
			div2.classList.add('swiper-wrapper');
			
			for(var i=0;i<7;i++){
				var outdiv = document.createElement('div');
				outdiv.classList.add('swiper-slide');
				outdiv.style="width:100%;"
				
				
				var ul = document.createElement('ul');
				ul.style="text-align:center;padding:0;margin:0 10px 0 10px;";
				ul.classList.add("row");
				if(data[i].length==0){
				
					var li = document.createElement('li');
					li.style="list-style: none;margin:auto;";
					var p = document.createElement('p');
					
					p.innerText=days[i]+"요일의 즐겨찾는 웹툰이 없습니다."
					
					li.append(p);
					ul.append(li);
				}
				for(var j=0;j<data[i].length;j++){
					var title = d[i][j]["title"];
					var imgUrl = d[i][j]["img"]
					
					if(title.length>7){
						title = title.substring(0,7);
						title+="...";
					}
					
					var li = document.createElement('li');
					li.style="list-style: none; width:30%;";
					
					
					
					var a = document.createElement('a');
					a.href="toon?id='"+title+"'&page=0";
					a.style="color: black";
					
					var img = document.createElement('img');
					img.src=imgUrl;
					img.classList.add("rounded-lg");
					img.classList.add("border");
					
					if(data[i][j]['web']=='naver'){
						img.classList.add("border-success");
						li.classList.add("naverli");
					}else if(data[i][j]['web']=='daum'){
						img.classList.add("border-warning");
						li.classList.add("daumli");
					}
										
					var p = document.createElement('p');
					p.style='"margin:0; font-size:11px;" text-align ="center"';
					p.innerText=title;
					
					a.append(img);
					a.append(p);
					li.append(a);
					ul.append(li);
				}
				outdiv.append(ul);
				div2.append(outdiv);
			}
			div1.append(div2);
			return div1;
		}
	function pc(){
		
		
		var div1 = document.createElement('div');
		var innerDiv = document.createElement('div');
		innerDiv.classList.add("row");
			for(var i=0;i<7;i++){
				var ul = document.createElement('ul');
				ul.style="text-align:center;padding:0;margin:0 10px 0 10px;";
				ul.classList.add("col");
				var li=""
				var h4 = document.createElement('h4');
				h4.innerText=days[i];
				for(var j=0;j<d[i].length;j++){
					var title = d[i][j]["title"];
					var img = d[i][j]["img"]
					if(title.length>7){
						title = title.substring(0,7);
						title+="...";
					}
					if(type[0]==1&&d[i][j]["web"]=='naver'){
						li+='<li style="list-style: none; width:130px; margin-left:auto;margin-right:auto;"><a href="toon?id='+d[i][j]["title"]+'&page=0" style="color: black;"> <img src="'+img+'" class="rounded-lg border border-success" style="width:130px;height:101px;" ><p style="margin:0; font-size:11px;" align = "center">'+title+'</p></a></li>';
					}else if(type[1]==1&&d[i][j]["web"]=='daum'){
						li+='<li style="list-style: none; width:130px; margin-left:auto;margin-right:auto;"><a href="toon?id='+d[i][j]["title"]+'&page=0" style="color: black;"> <img src="'+img+'" class="rounded-lg border border-warning" style="width:130px;height:101px;" ><p style="margin:0; font-size:11px;" align = "center">'+title+'</p></a></li>';
					}
				}
				
				ul.append(h4)
				
				ul.innerHTML+=li;
				
				innerDiv.append(ul);
			}
			div1.append(innerDiv);
			webtoonDiv.innerHTML = div1.innerHTML;
	}
	function viewNaver(obj){
		type[0]=type[0]*-1;
		var naverli = document.getElementsByClassName('naverli');
		if(type[0]==1){
			obj.classList.add('active');
			for(var i=0;i<naverli.length;i++){
				naverli[i].style="display: block";				
			}
		}else{
			obj.classList.remove('active');
			for(var i=0;i<naverli.length;i++){
				naverli[i].style="display:none";			
			}
		}

		//myPageProcess();
	} 
	function viewDaum(obj){
		type[1]=type[1]*-1;
		var daumli = document.getElementsByClassName('daumli');
		if(type[1]==1){
			obj.classList.add('active');
			for(var i=0;i<daumli.length;i++){
				daumli[i].style="display:block";			
			}
			

		}else{
			obj.classList.remove('active');
			for(var i=0;i<daumli.length;i++){
				daumli[i].style="display:none";			
			}
		}
		//myPageProcess();
	}
	function minilogin(obj){
		if('${userId}'==''){
			obj.href="javascript:void(0);";
			window.open('login.do','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
		}
	}

	window.onload = function(){
		myPageFunction();
	}
	window.onresize = function(){
		myPageProcess();
	}

</script>