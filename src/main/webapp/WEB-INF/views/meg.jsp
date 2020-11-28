<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>메시지</title>
</head>
<body>
	<div class="list-group">
		<c:forEach var="p" items="${person }" varStatus="status">
  			<button type="button" class="list-group-item list-group-item-action" onclick="chat(this)" >${p.sendUser }</button>
		</c:forEach>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
	function chat(obj){
		var user = obj.textContent;
		window.open('chat.do?sendUser='+user+'&receiveUser=${userId}',user+'의채팅창','width=430,height=500,location=no,toolbar=no,resizable=no,status=no,scrollbars=yes');
	}
</script>