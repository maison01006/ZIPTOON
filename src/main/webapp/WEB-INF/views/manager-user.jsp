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
<div class="row" style="margin:0px;">
	<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		<a class="nav-link" id="v-pills-home-tab" href="manager" role="tab" aria-controls="v-pills-home" aria-selected="true">Home</a>
		<a class="nav-link active" id="v-pills-profile-tab"  href="manager-user?page=0" role="tab" aria-selected="false">사용자 관리</a>
		<a class="nav-link" id="v-pills-messages-tab"  href="manager-qna" role="tab" aria-selected="false">Q&A</a>
		<a class="nav-link" id="v-pills-settings-tab"  onclick="meg()" role="tab" aria-selected="false">메시지</a>
	</div>
	<div style="margin:auto;">
		<div style="margin:20px;">
		<form action="/deleteUser.do" method="get">
			<div style="text-align: center;">
				<span>USER</span>
				<button class="btn btn-outline-danger float-right" type="submit">delete</button>
			</div>
			<div>
				<table class="table"style="text-align: center; border: 1px solid #dddddd;">
					<thead>
					<tr>
					<th style="background-color: #fafafa; text-align: center;"><input type="checkbox" onclick="changeCheckBox()" id="all"/></th>
					<th style="background-color: #fafafa; text-align: center;">#</th>
					<th style="background-color: #fafafa; text-align: center;">아이디</th>
					<th style="background-color: #fafafa; text-align: center;">가입날짜</th>
					<th style="background-color: #fafafa; text-align: center;">최근접속일</th>
					</tr>
					</thead>
					<tbody id="userTable">
					<c:forEach var="u" items="${user }" varStatus="status">
						<tr>
      					<td><input type="checkbox" name="user" value="${u.id }" class="checkBox"></td>
      					<td>${status.count}</td>
      					<td>${u.id }</td>
      					<td>${u.first }</td>
      					<td>${u.last }</td>
    					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
var allCheckBox = document.getElementById('all');
var checkBoxList = document.getElementsByClassName('checkBox');
var userList = document.getElementsByTagName('tr');
	function changeCheckBox(){
		for(var i=0;i<checkBoxList.length;i++){
			checkBoxList[i].checked = allCheckBox.checked;
		}
	}
	
	function meg(){
		window.open('meg.do?receiveUser=${userId }','메시지','width=430,height=500,location=no,toolbar=no,resizable=no,status=no,scrollbars=yes');
	}
</script>