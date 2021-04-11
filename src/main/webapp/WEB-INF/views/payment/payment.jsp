<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<link href="/resources/node_modules/flatpickr/dist/flatpickr.css" rel="stylesheet"/>
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
<style>
.paymentMain {
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
.btn-outline-success{color:#198754;border-color:#198754}.btn-outline-success:hover{color:#fff;background-color:#198754;border-color:#198754}.btn-check:focus+.btn-outline-success,.btn-outline-success:focus{box-shadow:0 0 0 .25rem rgba(25,135,84,.5)}.btn-check:active+.btn-outline-success,.btn-check:checked+.btn-outline-success,.btn-outline-success.active,.btn-outline-success.dropdown-toggle.show,.btn-outline-success:active{color:#fff;background-color:#198754;border-color:#198754}.btn-check:active+.btn-outline-success:focus,.btn-check:checked+.btn-outline-success:focus,.btn-outline-success.active:focus,.btn-outline-success.dropdown-toggle.show:focus,.btn-outline-success:active:focus{box-shadow:0 0 0 .25rem rgba(25,135,84,.5)}.btn-outline-success.disabled,.btn-outline-success:disabled{color:#198754;background-color:transparent}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<section id="team" class="team section-bg">
   <div class="container paymentMain">
   		<div class="row">
   			<div class="col-lg-11" style="text-align: center;">
				<div class="section-title">
		          <p>결제</p>
		        </div>
   			</div>
   		</div>
		<div class="row">
	         <div class="col-lg-6">
	            <div class="member d-flex align-items-start">
	              <div class="pic"><img src="/resources/assets/img/team/team-1.jpg" class="img-fluid" alt=""></div>
	              <div class="member-info">
	              	<div class="row">
	              		<div class="col-lg-12">
		                <h4>백남준전</h4>
		                <ul class="list-inline mt-4">
	                 		<li class="list-inline-item">
		   		  				 <h4>예매일</h4>
				                 <p>2021-04-21</p>
		                 	</li>
           					<li class="list-inline-item">
		   		  				 <h4>예매시간</h4>
				                 <p>11:00</p>
		                 	</li>
			            </ul>
		                </div>
		                <div class="col-lg-12">
		                	<ul class="list-inline">
								<li class="list-inline-item">
			   		  				 <h4 class="mt-2">예매수</h4>
					                 <p>3장</p>
			                 	</li>
			                 	<li class="list-inline-item">
					                 <h4 class="mt-2">결제금액</h4>
					                 <p>60000</p>
					            </li>    
			                 </ul>
		                </div>
	                </div>
	              </div>
	            </div>
          	</div>
			<div class="col-lg-5">
	      		<label for="eriAudienceRating">예매자 성함</label>
			    <input type="text" class="form-control" id="eriAudienceRating" required>
      			<label for="eriRunningTime" class="mt-2">예매자 이메일</label>
			    <input type="text" class="form-control" id="eriRunningTime" required>
    			<label for="eriMaxStock" class="mt-2">예매자 연락처</label>
			    <input type="number" class="form-control" id="eriMaxStock" min="1" required>
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
</section>
<script>
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