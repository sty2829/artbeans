<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 예약 정보</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link href="/resources/node_modules/flatpickr/dist/flatpickr.css" rel="stylesheet"/>
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
<style>
.reservationInsertMain {
	margin-top: 150px;
	margin-left: 450px;
	height: 700px;
}
h5 {
	font-weight: bold;
}
.radio-hidden{
	display: none;
}
.list-inline-item {
    margin-top: -15px;
}
img[data-col] {
	width: 400px;
	height: 350px;
}
.btn-outline-success{color:#198754;border-color:#198754}.btn-outline-success:hover{color:#fff;background-color:#198754;border-color:#198754}.btn-check:focus+.btn-outline-success,.btn-outline-success:focus{box-shadow:0 0 0 .25rem rgba(25,135,84,.5)}.btn-check:active+.btn-outline-success,.btn-check:checked+.btn-outline-success,.btn-outline-success.active,.btn-outline-success.dropdown-toggle.show,.btn-outline-success:active{color:#fff;background-color:#198754;border-color:#198754}.btn-check:active+.btn-outline-success:focus,.btn-check:checked+.btn-outline-success:focus,.btn-outline-success.active:focus,.btn-outline-success.dropdown-toggle.show:focus,.btn-outline-success:active:focus{box-shadow:0 0 0 .25rem rgba(25,135,84,.5)}.btn-outline-success.disabled,.btn-outline-success:disabled{color:#198754;background-color:transparent}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
   <div class="container reservationInsertMain">
   		<div class="row">
   			<div class="col-lg-11" style="text-align: center;">
				<div class="section-title">
		          <p>전시회 예약등록</p>
		        </div>
   			</div>
   		</div>
		<div class="row">
			<div class="col-lg-5" style="text-align: center">
				<img src="/resources/assets/img/blog-1.jpg" class="img-fluid" data-col="fileInfo">
	          	<h5 class="mt-2" data-col="eiName">제목</h5>
          	</div>
			<div class="col-lg-3">
	      		<label for="eriAudienceRating">관람등급</label>
			    <input type="text" class="form-control" id="eriAudienceRating" required>
      			<label for="eriRunningTime" class="mt-2">러닝타임</label>
			    <input type="text" class="form-control" id="eriRunningTime" required>
    			<label for="eriMaxStock" class="mt-2">1인당 최대 예매표</label>
			    <input type="number" class="form-control" id="eriMaxStock" min="1" required>
      			<label for="eriMaxTicket" class="mt-2">시간당 최대 예매표</label>
			    <input type="number" class="form-control" id="eriMaxTicket" min="1" required >
		   </div>
		   <div class="col-lg-3">
		   		<label for="eriStartDate">예매 시작일</label>
    	   		<input type="text" class="form-control" id="eriStartDate" style="background-color: white">
  		        <label for="eriEndDate" class="mt-2">예매 종료일</label>
    			<input type="text" class="form-control" id="eriEndDate" style="background-color: white">
    			<label for="eriStartTime" class="mt-2">예매 시작시간</label>
    	   		<input type="text" class="form-control" id="eriStartTime" style="background-color: white">
    	   		<label for="eriEndTime" class="mt-2">예매 종료시간</label>
    	   		<input type="text" class="form-control" id="eriEndTime" style="background-color: white"><br>
    	   		<button type="button" class="btn btn-primary" style="width: inherit;" onclick="insert()">등록</button>
		  </div>
	   </div>
		<br>
		<div class="row">
			<div class="col-lg-5">
			</div>
			<div class="col-lg-6">
			</div>
		</div>
	</div>
<script>
flatpickr('#eriStartDate', {
	enableTime: true,
	time_24hr: true,
	dateFormat: "Y-m-d",
});

flatpickr('#eriEndDate', {
	enableTime: true,
	time_24hr: true,
	dateFormat: "Y-m-d",
});

flatpickr('#eriStartTime', {
	enableTime: true,
	noCalendar: true,
	time_24hr: true,
	dateFormat: "H:i",
});

flatpickr('#eriEndTime', {
	enableTime: true,
	noCalendar: true,
	time_24hr: true,
	dateFormat: "H:i",
});

window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/test/exhibition/5');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var objs = document.querySelectorAll('[data-col]');
			for(obj of objs){
				var key = obj.getAttribute('data-col');
				var data = res[key];
				if(key == "fileInfo") {
					obj.src = '/resources/assets/img/exhibition/' + data.fiPath;
					data = '';
				}
				obj.innerHTML = data;
			}
		}
	}
	xhr.send();
}

function insert(){
	var param = {
			exhibitionInfo : {
				eiNum : 2
			}
	};
	
	// 전시회(번호) Request Param 으로 넘어온 거 추가 임시로 일단 직접입력
	
	var objs = document.querySelectorAll('input');
	for(obj of objs){
		param[obj.id] = obj.value;
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', "/exhibition-reservation");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText >= 1){
				alert('인서트 성공');
				location.href = '/';
				return;
			}
			alert('인서트 실패');
		}
	}
	
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
}



</script>	
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>