<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css?version=1">
<link rel="stylesheet" href="resources/css/ziptoon.css?version=3">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<form action="minilogin.do" method="post">
	<div>
		<span>아이디</span>
		<input type="text" name="id">
	</div>
	<div>
		<span>비밀번호</span>
		<input type="password" name="password">
	</div>
	<div>
		<button type="submit" >로그인</button>
	</div>
</form>
</body>

</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script> 