<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
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
	<div style="margin:auto;">
		<div style="margin:20px;">
		<form action="/deleteQna.do" method="get">
			<div style="border-bottom: 1px solid black;text-align: center;">
				<span>Q&A</span>
			</div>
			<div>
				<table class="table"style="text-align: center; border: 1px solid #dddddd;">
					<thead>
					<tr>
					<th style="background-color: #fafafa; text-align: center;">#</th>
					<th style="background-color: #fafafa; text-align: center;">아이디</th>
					<th style="background-color: #fafafa; text-align: center;">제목</th>
					<th style="background-color: #fafafa; text-align: center;">유형</th>
					<th style="background-color: #fafafa; text-align: center;">날짜</th>
					<th style="background-color: #fafafa; text-align: center;">답변유뮤</th>
					</tr>
					</thead>
					<tbody id="qnaTable">
					<c:forEach var="q" items="${qna }" varStatus="status">
						<tr>
      					<td>${status.count}</td>
      					<td>${q.userId }</td>
      					<td><a href="/qnapage?id=${q.id }">${q.title }</a></td>
      					<td>${q.type }</td>
      					<td>${q.date }</td>
      					<td>${q.result }</td>
    					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			</form>
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