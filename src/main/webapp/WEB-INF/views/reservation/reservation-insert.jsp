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
.reservationMain {
	margin-top: 150px;
	margin-left: 450px;
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
	height: 400px;
}
.btn-outline-success{color:#198754;border-color:#198754}.btn-outline-success:hover{color:#fff;background-color:#198754;border-color:#198754}.btn-check:focus+.btn-outline-success,.btn-outline-success:focus{box-shadow:0 0 0 .25rem rgba(25,135,84,.5)}.btn-check:active+.btn-outline-success,.btn-check:checked+.btn-outline-success,.btn-outline-success.active,.btn-outline-success.dropdown-toggle.show,.btn-outline-success:active{color:#fff;background-color:#198754;border-color:#198754}.btn-check:active+.btn-outline-success:focus,.btn-check:checked+.btn-outline-success:focus,.btn-outline-success.active:focus,.btn-outline-success.dropdown-toggle.show:focus,.btn-outline-success:active:focus{box-shadow:0 0 0 .25rem rgba(25,135,84,.5)}.btn-outline-success.disabled,.btn-outline-success:disabled{color:#198754;background-color:transparent}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
   <div class="container reservationMain">
   		<div class="row">
   			<div class="col-lg-11" style="text-align: center;">
				<div class="section-title">
		          <p>전시회 예약등록</p>
		        </div>
   			</div>
   		</div>
		<div class="row">
			<div class="col-lg-5">
				<img src="/resources/assets/img/blog-1.jpg" class="img-fluid" data-col="eiImg">
          	</div>
			<div class="col-lg-3">
	      		<label for="eriAudienceRating">관람등급</label>
			    <input type="text" class="form-control is-valid" id="eriAudienceRating" onkeyup="vaild(this)" required>
     			<div class="valid-feedback">
       		  		잘했네
      			</div>
      			<label for="eriRunningTime">러닝타임</label>
			    <input type="text" class="form-control is-invalid" id="eriRunningTime" onkeyup="vaild(this)" required>
     			<div class="invalid-feedback">
       		  		아이디는 10자 이상 입력해야 합니다.
      			</div>
    			<label for="eriMaxStock">1인당 최대 예매표</label>
			    <input type="number" class="form-control is-invalid" id="eriMaxStock" onkeyup="vaild(this)" min="0" required>
     			<div class="invalid-feedback">
       		  		아이디는 10자 이상 입력해야 합니다.
      			</div>
      			<label for="eriMaxTicket">시간당 최대 예매표</label>
			    <input type="number" class="form-control is-invalid" id="eriMaxTicket" onkeyup="vaild(this)" required >
     			<div class="invalid-feedback">
       		  		아이디는 10자 이상 입력해야 합니다.
      			</div>
		   </div>
		   <div class="col-lg-3">
		   		<label for="eriStartDate">예매 시작일</label>
    	   		<input type="text" class="form-control" id="eriStartDate" style="background-color: white">
  		        <label for="eriEndDate">예매 종료일</label>
    			<input type="text" class="form-control" id="eriEndDate" style="background-color: white">
    			<label for="eriStartTime">예매 시작시간</label>
    	   		<input type="text" class="form-control" id="eriStartTime" style="background-color: white">
    	   		<label for="eriEndTime">예매 종료시간</label>
    	   		<input type="text" class="form-control" id="eriEndTime" style="background-color: white">
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
	xhr.open('GET', '/test/exhibition/2');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			var objs = document.querySelectorAll('[data-col]');
			var path = res.fileInfo.fiPath;
			for(obj of objs){
				obj.src = '/resources/assets/img/exhibition/' + path;
			}
		}
	}
}
function vaild(obj){
	var check = {
			
	}
	console.log(obj);
}


var obj = document.querySelector('#testVaild');
obj.className;
console.log(obj.getAttribute('class'));

</script>	
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>