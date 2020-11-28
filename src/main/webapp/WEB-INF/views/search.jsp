<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="container">
	<div style="text-align: center;margin:20px 0 20px 0;">
		<h4>"${title }"의 검색 결과</h4>
	</div>
	<div id="webtoon" style="border: 1px solid #dddddd; ">
	
	</div>

</div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
var webtoon = document.getElementById('webtoon');
var request = new XMLHttpRequest();
var d=""
var form = document.getElementById('search');
function minilogin(obj){
	if('${userId}'==''){
		obj.href="javascript:void(0);";
		window.open('login.do','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
	}
}
	function check(){
		
		if(form.children[0].value==''){
			alert('빈칸 입니다.');
		}
		else{
			form.submit();
		}
	}
	function webtoonFunction() {
		request.open("Get", "./searchWebtoon?id="+'${title}', true);
		request.onreadystatechange = webtoonProcess;
		request.send(null);
	}
	function webtoonProcess() {
		if (request.readyState == 4 && request.status == 200) {
			d = JSON.parse(request.responseText);
			webtoon.append(createUl(d));
		}
	}
	function createUl(data){
		var ul = document.createElement('ul');
		ul.classList.add('row');
		ul.style.margin='20px 0 20px 0';
		for(var i=0;i<data.length;i++){
			var li = document.createElement('li');
			var div = document.createElement('div');
			var a = document.createElement('a');
			var p = document.createElement('p');
			var img = document.createElement('img');
			
			li.style.listStyle="none";
			li.style.margin="0 5px";
			a.href="/toon?id="+data[i].title+"&page=0";
			if(data[i].title.length>7){
				p.innerText=data[i].title.substring(0,7)+"...";
				
			}else{
				p.innerText=data[i].title;
			}
			p.style.color="black";
			img.src = data[i].img;
			img.style.width="130px";
			img.style.height="101px";
			if(data[i].web=='naver'){
				div.style.backgroundColor="green";
			}else if(data[i].web=='daum'){
				div.style.backgroundColor="#ffc107";
			}
			div.style.height="10px";
			
			a.append(div);
			a.append(img);
			a.append(p);
			li.append(a);
			ul.append(li);
		}
		return ul;
	}
	window.onload=function(){
		webtoonFunction();
	}
</script>