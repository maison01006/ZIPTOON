<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
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
      <button class="btn btn-outline-dark my-2 my-sm-0" type="button" onclick="check()">Search</button>
    </form>
  </div>
</nav>
</div>
<div class="container">
	<div style="text-align: center;margin:20px 0;">
		<h4>사이트 소개</h4>
	</div>
	<div>
	</div>
</div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
var form = document.getElementById('search');
function check(){

	if(form.children[0].value==''){
		alert('빈칸 입니다.');
	}
	else{
		form.submit();
	}
}
</script>