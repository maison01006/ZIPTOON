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
<div style="padding-bottom: 50px;">
		<c:forEach var="m" items="${meg }" varStatus="status">
		<c:choose>
			<c:when test="${m.sendUser eq userId }">
				<div class="row justify-content-end" style="margin:0;">
			</c:when>
			<c:otherwise>
				<div id="chat" class="row justify-content-start" style="margin:0;">
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
			<input id="meg"></input>
			<button onclick="send()">asd</button>
		</div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
	var wsUri = "ws://echo.websocket.org/";
	var output;
	
	function init(){
		output = document.getElementById('chat');
		testWebSocket();
	}
	function testWebSocket(){
		websocket = new WebSocket(wsUri);
		websocket.onopen = function(evt){onOpen(evt)};
		websocket.onclose = function(evt){onClose(evt)};
		websocket.onmessage = function(evt){onMessage(evt)};
		websocket.onerror = function(evt){onError(evt)};
	}
	
	function onOpen(evt){
		writeToScreen("연결완료");
		doSend("테스트 메세지");
	}
	function onClose(evt){
		writeToScreen("연결해제");
	}
	function onMessage(evt){
		writeToScreen('<span style="color:blue;">수신:'+evt.data+'</span>');
		//websocket.close();
	}
	function onError(evt){
		writeToScreen('<span style="color:red;">에러:'+evt.data+'</span>');
	}
	function doSend(message){
		writeToScreen("발신: "+message);
		websocket.send(message);
	}
	function writeToScreen(message){
		var pre = document.createElement("p");
		pre.style.wordWrap = "break-word";
		pre.innerHTML = message;
		output.appendChild(pre);
	}
	function send(){
		var meg = document.getElementById('meg');
		doSend(meg.value);
	}
	window.addEventListener("load",init,false);
</script>