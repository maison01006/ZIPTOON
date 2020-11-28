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
		<a class="nav-link" id="v-pills-profile-tab"  href="manager-user?page=0" role="tab" aria-selected="false">사용자 관리</a>
		<a class="nav-link active" id="v-pills-messages-tab"  href="manager-qna" role="tab" aria-selected="false">Q&A</a>
		<a class="nav-link" id="v-pills-settings-tab"  onclick="meg()" role="tab" aria-selected="false">메시지</a>
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
					<th style="background-color: #fafafa; text-align: center;">날짜</th>
					</tr>
					</thead>
					<tbody id="qnaTable">
					<c:forEach var="q" items="${qna }" varStatus="status">
						<tr>
						
      					<td>${status.count}</td>
      					<td>${q.userId }</td>
      					<td><a href="/qnapage?id=${q.id }">${q.title }</a></td>
      					<td>${time[status.index] }</td>
      					
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
function meg(){
	window.open('meg.do?receiveUser=${userId }','메시지','width=430,height=500,location=no,toolbar=no,resizable=no,status=no,scrollbars=yes');
}
</script>