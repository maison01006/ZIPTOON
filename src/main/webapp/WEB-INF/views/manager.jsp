<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center;">
	<a class="font-weight-bolder" href="/" style="font-size:24px;">ZIPTOON</a>
</div>
<div>
	<div class="row" style="margin:0;">
			<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
  				<a class="nav-link active" id="v-pills-home-tab" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Home</a>
  				<a class="nav-link" id="v-pills-profile-tab"  href="manager-user?page=0" role="tab" aria-selected="false">사용자 관리</a>
  				<a class="nav-link" id="v-pills-messages-tab"  href="manager-qna" role="tab" aria-selected="false">Q&A</a>
  				<a class="nav-link" id="v-pills-settings-tab" onclick="meg()" role="tab" aria-selected="false">메시지</a>
			</div>
			<div class="tab-content col" id="v-pills-tabContent">
  				<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
  					<div>
						<div class="row" style="margin:0;">
							<div class="col-6">
								<div>
									<span>일일 방문자</span>
								</div>
								<div>
									<div id="visitchart" style="height: 250px;"></div>
								</div>
							</div>
							<div class="col-6">
								<div>
									<span>일일 가입자</span>
								</div>
								<div>
									<div id="joinchart" style="height: 250px;"></div>
								</div>
							</div>
						</div>
						<div class="row" style="margin:0;">
							<div class="col-6">
								<div>
									<span>오늘 할 일</span>
								</div>
								<div>
									<div id="3chart" style="height: 250px;"></div>
								</div>
							</div>
							<div class="col-6">
								<div>
									<span>공지사항</span>
								</div>
								<div>
									<div id="4chart" style="height: 250px;"></div>
								</div>
							</div>
						</div>
					</div>
  				</div>
  			</div>
	</div>		
</div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script type="text/javascript">

new Morris.Line({
	  // ID of the element in which to draw the chart.
	  element: 'visitchart',
	  // Chart data records -- each entry in this array corresponds to a point on
	  // the chart.
	  data: [
	    { year: '2008', value: 20 },
	    { year: '2009', value: 10 },
	    { year: '2010', value: 5 },
	    { year: '2011', value: 5 },
	    { year: '2012', value: 20 },
	    { year: '2013', value: 25 },
	    { year: '2014', value: 30 },
	    { year: '2015', value: 10 },
	    { year: '2016', value: 15 }
	  ],
	  // The name of the data record attribute that contains x-values.
	  xkey: 'year',
	  // A list of names of data record attributes that contain y-values.
	  ykeys: ['value'],
	  // Labels for the ykeys -- will be displayed when you hover over the
	  // chart.
	  labels: ['Value']
	});
new Morris.Line({
	  // ID of the element in which to draw the chart.
	  element: 'joinchart',
	  // Chart data records -- each entry in this array corresponds to a point on
	  // the chart.
	  data: [
	    { year: '2008', value: 20 },
	    { year: '2009', value: 40 },
	    { year: '2010', value: 25 },
	    { year: '2011', value: 30 },
	    { year: '2012', value: 20 }
	  ],
	  // The name of the data record attribute that contains x-values.
	  xkey: 'year',
	  // A list of names of data record attributes that contain y-values.
	  ykeys: ['value'],
	  // Labels for the ykeys -- will be displayed when you hover over the
	  // chart.
	  labels: ['Value']
	});
new Morris.Line({
	  // ID of the element in which to draw the chart.
	  element: '3chart',
	  // Chart data records -- each entry in this array corresponds to a point on
	  // the chart.
	  data: [
	    { year: '2008', value: 20 },
	    { year: '2009', value: 40 },
	    { year: '2010', value: 25 },
	    { year: '2011', value: 30 },
	    { year: '2012', value: 20 }
	  ],
	  // The name of the data record attribute that contains x-values.
	  xkey: 'year',
	  // A list of names of data record attributes that contain y-values.
	  ykeys: ['value'],
	  // Labels for the ykeys -- will be displayed when you hover over the
	  // chart.
	  labels: ['Value']
	});
new Morris.Line({
	  // ID of the element in which to draw the chart.
	  element: '4chart',
	  // Chart data records -- each entry in this array corresponds to a point on
	  // the chart.
	  data: [
	    { year: '2008', value: 20 },
	    { year: '2009', value: 40 },
	    { year: '2010', value: 25 },
	    { year: '2011', value: 30 },
	    { year: '2012', value: 20 }
	  ],
	  // The name of the data record attribute that contains x-values.
	  xkey: 'year',
	  // A list of names of data record attributes that contain y-values.
	  ykeys: ['value'],
	  // Labels for the ykeys -- will be displayed when you hover over the
	  // chart.
	  labels: ['Value']
	});
	
	function meg(){
		window.open('meg.do?receiveUser=${userId }','메시지','width=430,height=500,location=no,toolbar=no,resizable=no,status=no,scrollbars=yes');
	}
</script>