<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center;">
	<a class="font-weight-bolder" href="/" style="font-size:24px;">ZIPTOON</a>
</div>
<div>
	<div class="row" style="margin:0;">
  		<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
  			<a class="nav-link" id="v-pills-home-tab" href="manager" role="tab" aria-controls="v-pills-home" aria-selected="true">Home</a>
  			<a class="nav-link" id="v-pills-profile-tab"  href="manager-user?page=0" role="tab" aria-selected="false">사용자 관리</a>
  			<a class="nav-link" id="v-pills-messages-tab"  href="manager-qna" role="tab" aria-selected="false">Q&A</a>
  			<a class="nav-link active" id="v-pills-settings-tab"  href="#" role="tab" aria-selected="false">메시지</a>
		</div>
		<div class="col row" style="margin:auto;">
			<div class="col-4" style="overflow:auto;height: 600px;">
				<ul>
					<li>1</li>
					<li>1</li>
					<li>1</li>
					<li>1</li>
					<li>1</li>
					<li>1</li>
					<li>1</li>
				</ul>
			</div>
			<div class="col-8" style="overflow:auto;height: 600px;">
				<form>
					<ul id="chatting">
					</ul>
					<div class="row" style="background-color: blue;margin: 0;">
						<input class="col-10" type="text"/>
						<button class="col-1">send</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>