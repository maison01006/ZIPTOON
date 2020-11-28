<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>${sendUser }님의 채팅창</title>
</head>
<body>	
<div>
		<c:forEach var="m" items="${meg }" varStatus="status">
		<c:choose>
			<c:when test="${m.sendUser eq userId }">
				<div class="row justify-content-end" style="margin:0;">
			</c:when>
			<c:otherwise>
				<div class="row justify-content-start" style="margin:0;">
			</c:otherwise>
		</c:choose>
				<div>
					이미지
				</div>
				<div>				
					<p>${m.sendUser }</p>
  					<p>${m.text }</p>
				</div>
  			</div>
		</c:forEach>
		</div>
		<div class="col" style="position: fixed; bottom:0px;background-color: green;">
		채팅
		</div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>