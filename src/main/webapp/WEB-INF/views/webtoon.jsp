<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.css?version=4">
<link rel="stylesheet" href="resources/css/ziptoon.css?version=3">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<title>Insert title here</title>
</head>
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

<body style="padding-bottom:50px;">
<div id="phone">
	<div style="text-align: center;margin-top: 15px;">
		<p class="font-weight-bolder" style="font-size:30px;">모든 웹툰 보기</p>
	</div>
	<div class="container" style="border: 1px solid #dddddd;padding:0;">
		<div>
			<div id="phoneallwebtoon" class="row justify-content-center" style="margin: 0px;border-bottom: 1px solid #dddddd;">
				<button type="button" class="b btn btn-outline-dark col" onclick="active(0)">월</button>
				<button type="button" class="b btn btn-outline-dark col" onclick="active(1)">화</button>
				<button type="button" class="b btn btn-outline-dark col" onclick="active(2)">수</button>
				<button type="button" class="b btn btn-outline-dark col" onclick="active(3)">목</button>
				<button type="button" class="b btn btn-outline-dark col" onclick="active(4)">금</button>
				<button type="button" class="b btn btn-outline-primary col" onclick="active(5)">토</button>
				<button type="button" class="b btn btn-outline-danger col" onclick="active(6)">일</button>
			</div>
			<div>
				<ul class="row justify-content-center"style="list-style: none;margin:0px; padding: 0;">
					<li class="col" style="margin:0;padding:0;" >
						<button class="col active btn-outline-success" style=" display: inline-block;"onclick="toggle('naver')">네이버</button>
					</li>
					<li class="col" style="margin:0;padding:0;">
						<button class="col active btn-outline-warning" style="display: inline-block;"onclick="toggle('daum')">다음</button>
					</li>
				</ul>
			</div>
		</div>
		<div id="webtoon">
		<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
			<div id="monwebtoon">
				<ul class="row justify-content-center" style="margin:0px; padding: 0px;">
				<c:forEach var="w" items="${mon }" varStatus="s">
					<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<li class="naverli" style="list-style: none; margin:0 3px;">
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<li class="daumli" style="list-style: none;margin:0 3px;">
							</c:when>
						</c:choose>
						<a href='<c:url value="/toon?id=${w.id }&page=0"/>' style="color:black;" >
						<c:set var="id" value="${w.id }"/>
						<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-success"/>
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-warning"/>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${fn:length(id) gt 7 }">
								<p style="margin:0; font-size:11px;" align="center">${fn:substring(id, 0, 7)}...</p>
							</c:when>
							<c:otherwise>
								<p style="margin:0; font-size:11px;" align="center">${id } </p>
							</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
			</ul>
			</div>
			</div>
			<div class="swiper-slide">
			<div id="tuewebtoon">
				<ul class="row justify-content-center" style="margin:0px; padding: 0px;">
				<c:forEach var="w" items="${tue }" varStatus="s">
					<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<li class="naverli" style="list-style: none; margin:0 3px;">
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<li class="daumli" style="list-style: none; margin:0 3px;">
							</c:when>
						</c:choose>
						<a href='<c:url value="/toon?id=${w.id }&page=0"/>' style="color:black;" >
						<c:set var="id" value="${w.id }"/>
						
						<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-success"/>
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-warning"/>
							</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${fn:length(id) gt 7 }">
								<p style="margin:0; font-size:11px;" align="center">${fn:substring(id, 0, 7)}...</p>
							</c:when>
							<c:otherwise>
								<p style="margin:0; font-size:11px;" align="center">${id } </p>
							</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
			</ul>
			</div>
			</div>
			<div class="swiper-slide">
			<div id="wedwebtoon">
				<ul class="row justify-content-center" style="margin:0px; padding: 0px;">
				<c:forEach var="w" items="${wed }" varStatus="s">
					<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<li class="naverli" style="list-style: none; margin:0 3px;">
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<li class="daumli" style="list-style: none; margin:0 3px;">
							</c:when>
						</c:choose>
						<a href='<c:url value="/toon?id=${w.id }&page=0"/>' style="color:black;" >
						<c:set var="id" value="${w.id }"/>
						
						<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-success"/>
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-warning"/>
							</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${fn:length(id) gt 7 }">
								<p style="margin:0; font-size:11px;" align="center">${fn:substring(id, 0, 7)}...</p>
							</c:when>
							<c:otherwise>
								<p style="margin:0; font-size:11px;" align="center">${id } </p>
							</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
			</ul>
			</div>
			</div>
			<div class="swiper-slide">
			<div id="thuwebtoon">
				<ul class="row justify-content-center" style="margin:0px; padding: 0px;">
				<c:forEach var="w" items="${thu }" varStatus="s">
						<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<li class="naverli" style="list-style: none;margin:0 3px;">
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<li class="daumli" style="list-style: none; margin:0 3px;">
							</c:when>
						</c:choose>
					
					<a href='<c:url value="/toon?id=${w.id }&page=0"/>' style="color:black;" >
						<c:set var="id" value="${w.id }"/>
						
						<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-success"/>
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-warning"/>
							</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${fn:length(id) gt 7 }">
								<p style="margin:0; font-size:11px;" align="center">${fn:substring(id, 0, 7)}...</p>
							</c:when>
							<c:otherwise>
								<p style="margin:0; font-size:11px;" align="center">${id } </p>
							</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
			</ul>
			</div>
			</div>
			<div class="swiper-slide">
			<div id="friwebtoon">
				<ul class="row justify-content-center" style="margin:0px; padding: 0px;">
				<c:forEach var="w" items="${fri }" varStatus="s">
					<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<li class="naverli" style="list-style: none;margin:0 3px;">
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<li class="daumli" style="list-style: none;margin:0 3px;">
							</c:when>
						</c:choose>
						<a href='<c:url value="/toon?id=${w.id }&page=0"/>' style="color:black;" >
						<c:set var="id" value="${w.id }"/>
						
						<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-success"/>
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-warning"/>
							</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${fn:length(id) gt 7 }">
								<p style="margin:0; font-size:11px;" align="center">${fn:substring(id, 0, 7)}...</p>
							</c:when>
							<c:otherwise>
								<p style="margin:0; font-size:11px;" align="center">${id } </p>
							</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
			</ul>
			</div>
			</div>
			<div class="swiper-slide">
			<div id="satwebtoon">
				<ul class="row justify-content-center" style="margin:0px; padding: 0px;">
				<c:forEach var="w" items="${sat }" varStatus="s">
					<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<li class="naverli" style="list-style: none;margin:0 3px;">
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<li class="daumli" style="list-style: none;margin:0 3px;">
							</c:when>
						</c:choose>
						<a href='<c:url value="/toon?id=${w.id }&page=0"/>' style="color:black;" >
						<c:set var="id" value="${w.id }"/>
						
						<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-success"/>
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-warning"/>
							</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${fn:length(id) gt 7 }">
								<p style="margin:0; font-size:11px;" align="center">${fn:substring(id, 0, 7)}...</p>
							</c:when>
							<c:otherwise>
								<p style="margin:0; font-size:11px;" align="center">${id } </p>
							</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
			</ul>
			</div>
			</div>
			<div class="swiper-slide">
			<div id="sunwebtoon">
				<ul class="row justify-content-center" style="margin:0px; padding: 0px;">
				<c:forEach var="w" items="${sun }" varStatus="s">
					<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<li class="naverli" style="list-style: none;margin:0 3px;">
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<li class="daumli" style="list-style: none;margin:0 3px;">
							</c:when>
						</c:choose>
						<a href='<c:url value="/toon?id=${w.id }&page=0"/>' style="color:black;" >
						<c:set var="id" value="${w.id }"/>
						
						<c:choose>
							<c:when test="${w.web eq 'naver' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-success"  />
							</c:when>
							<c:when test="${w.web eq 'daum' }">
								<img src="<c:url value='${w.img }'/>" class=" rounded-lg border border-warning"/>
							</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${fn:length(id) gt 7 }">
								<p style="margin:0; font-size:11px;" align="center">${fn:substring(id, 0, 7)}...</p>
							</c:when>
							<c:otherwise>
								<p style="margin:0; font-size:11px;" align="center">${id } </p>
							</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
			</ul>
			</div>
			</div>
		</div>
		</div>
		</div>
		</div>

	</div>
</body>
<div id="footer" class="row col" style=" margin:0px;bottom: 0px;position: fixed;z-index: 999999;padding: 0;">
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
	<a href="#" onclick="activeFunc(this)">
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-emoji-smile" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path fill-rule="evenodd" d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683z"/>
  <path d="M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
</svg>
	<p>웹툰</p>
	</a>
	</div>
	
	<div class="col" style="text-align: center;border-right: 1px solid #dddddd;margin-top:5px;background-color: white;">
	<a href="mywebtoon" onclick="activeFunc(this)">
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
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
var type=[1,1,-1];
var date = new Date();
var day =[6,0,1,2,3,4,5];
var naverli = document.getElementsByClassName('naverli');
var daumli = document.getElementsByClassName('daumli');
var days = document.getElementById('phoneallwebtoon');
var request = new XMLHttpRequest();
var d ="";
var t ="";
var swiper = new Swiper('.swiper-container',{
	init:false,
	speed:200,
	initialSlide:day[date.getDay()],
});

	function toggle(web){
		if(web=='naver'){
			type[0]=type[0]*-1;
			if(type[0]==1){
				for(var i=0;i<naverli.length;i++){
					naverli[i].style["display"]="list-item";
				}
			}else if(type[0]==-1){
				for(var i=0;i<naverli.length;i++){
					naverli[i].style["display"]="none";
				}
			}
		}else if(web=='daum'){
			type[1]=type[1]*-1;
			if(type[1]==1){
				for(var i=0;i<daumli.length;i++){
					daumli[i].style["display"]="list-item";
				}
			}else if(type[1]==-1){
				for(var i=0;i<daumli.length;i++){
					daumli[i].style["display"]="none";
				}
			}
		}

	}

	function webtoonFunction(index) {
		request.open("Get", "/getWebtoon?day="+index, false);
		request.onreadystatechange = function(){
			webtoonProcess(index)
			};
		request.send(null);
	}
	function webtoonProcess(index){
		if(request.readyState == 4 && request.status == 200){
			d = JSON.parse(request.responseText);
			
			
			swiper.slides[index].innerHTML=createSlide(d).innerHTML;
		}
	}
	function createSlide(data){
		var div = document.createElement('div');
		var div2 = document.createElement('div');
		var ul = document.createElement('ul');
		ul.classList.add('row');
		ul.classList.add('justify-content-center');
		ul.style="margin:0px; padding: 0px;";
		
		for(var i=0;i<data.length;i++){
			var li = document.createElement('li');
			var a = document.createElement('a');
			var img = document.createElement('img');
			var p = document.createElement('p');

			li.style="list-style: none;margin:0 3px;";
			if(data[i]['web']=='naver'){
				li.classList.add('naverli');
				img.classList.add('border-success');
			}else if(data[i]['web']=='daum'){
				li.classList.add('daumli');
				img.classList.add('border-warning');
			}
			a.href="/toon?id="+data[i].title+"&page=0";
			a.style="color:black;";
			img.classList.add('rounded-lg');
			img.classList.add('border');
			img.src=data[i].img;
			p.style="margin:0; font-size:11px;";
			if(data[i].title.length>7){
				p.innerText=data[i].title.substring(0,7)+"...";
			}else{
				p.innerText=data[i].title;
			}
			
			a.append(img);
			a.append(p);
			li.append(a);
			ul.append(li);
		}
		div.append(ul);
		div2.append(div);
		return div2;
	}
	function initGetWebtoon(){
		
		 if(swiper.activeIndex==0){
			 webtoonFunction(1);
		 }else if(swiper.activeIndex==6){
			 webtoonFunction(5);
		 }else{
			 webtoonFunction(swiper.activeIndex-1);

			 webtoonFunction(swiper.activeIndex+1);
		 }
	}
	function getWebtoon(){
		if(swiper.previousIndex<swiper.activeIndex){
			if(swiper.activeIndex!=6&&((swiper.activeIndex-swiper.previousIndex)<2)){
				webtoonFunction(swiper.activeIndex+1);
			}
		}
		else if(swiper.previousIndex>swiper.activeIndex){
			if(swiper.activeIndex!=0){
				webtoonFunction(swiper.activeIndex-1);
			}
		}
		if((swiper.previousIndex<swiper.activeIndex)&&swiper.previousIndex!=0){
			swiper.slides[swiper.previousIndex-1].firstElementChild.firstElementChild.innerHTML="";
			
		}else if((swiper.previousIndex>swiper.activeIndex)&&swiper.previousIndex!=6){
			swiper.slides[swiper.previousIndex+1].firstElementChild.firstElementChild.innerHTML="";
		}
	}
	function active(num){
		
		if(num==0){
			if(swiper.slides[0].firstElementChild.firstElementChild.childElementCount==0){
				webtoonFunction(0);	
			}
			if(swiper.slides[1].firstElementChild.firstElementChild.childElementCount==0){
				webtoonFunction(1);	
			}
			for(var i=2;i<7;i++){
				swiper.slides[i].firstElementChild.firstElementChild.innerHTML="";
			}
		}else if(num==6){
			if(swiper.slides[5].firstElementChild.firstElementChild.childElementCount==0){
				webtoonFunction(5);	
			}
			if(swiper.slides[6].firstElementChild.firstElementChild.childElementCount==0){
				webtoonFunction(6);	
			}
			for(var i=0;i<5;i++){
				swiper.slides[i].firstElementChild.firstElementChild.innerHTML="";
			}
		}else{
			
			if(swiper.slides[num-1].firstElementChild.firstElementChild.childElementCount==0){
				webtoonFunction(num-1);	
			}
			if(swiper.slides[num].firstElementChild.firstElementChild.childElementCount==0){
				webtoonFunction(num);
			}
			if(swiper.slides[num+1].firstElementChild.firstElementChild.childElementCount==0){
				webtoonFunction(num+1);	
			}
			for(var i=0;i<7;i++){
				if(num-1>i&&num+1<i){
					swiper.slides[i].firstElementChild.firstElementChild.innerHTML="";
				}
			}
		}
		swiper.slideTo ( num , 300);
	}
	window.onload= function(){
		days.children[date.getDay()].classList.add('active');
		swiper.on('init',function(){
			initGetWebtoon();
		})
		 swiper.on('slideChange',function(){
			 for(var i=0;i<days.childElementCount;i++){
				 days.children[i].classList.remove('active');
			 }
			 days.children[swiper.activeIndex].classList.add('active');
		 });
		 swiper.on('transitionEnd',function(){
			 
			 getWebtoon();
		 });
		 swiper.init();
	}
</script>