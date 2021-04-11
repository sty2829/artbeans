<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
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
<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
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
	              <div class="pic" style="text-align: center"><img src="/resources/assets/img/team/team-1.jpg" class="img-fluid" alt=""><h4 class="mt-3">백남준전</h4></div>
	              <div class="member-info">
	              	<div class="row">
	              		<div class="col-lg-12">
		                <ul class="list-inline mt-4">
	                 		<li class="list-inline-item">
		   		  				 <h4>예매일</h4>
				                 <p id="rtiDate" class="check">2021-04-21</p>
		                 	</li>
           					<li class="list-inline-item">
		   		  				 <h4>예매시간</h4>
				                 <p style="text-align: center" id="rtiTime" class="check">11:00</p>
		                 	</li>
			            </ul>
		                </div>
		                <div class="col-lg-12">
		                	<ul class="list-inline">
								<li class="list-inline-item">
			   		  				 <h4 class="mt-2">예매수</h4>
					                 <p style="text-align: center" id="rtiNumber" class="check">3</p>
			                 	</li>
			                 	<li class="list-inline-item">
					                 <h4 class="mt-2 ml-3">결제금액</h4>
					                 <p style="text-align: center" id="piPrice" class="check">60000</p>
					            </li>    
			                 </ul>
		                </div>
	                </div>
	              </div>
	            </div>
          	</div>
			<div class="col-lg-4">
	      		<label for="eriAudienceRating">예매자 성함</label>
			    <input type="text" class="form-control" id="rtiName" required>
      			<label for="eriRunningTime" class="mt-2">예매자 이메일</label>
			    <input type="email" class="form-control" id="rtiEmail" required>
    			<label for="eriMaxStock" class="mt-2">예매자 연락처</label>
			    <input type="text" class="form-control" id="rtiPhoneNumber" required>
		   </div>
	   </div>
		<div class="row">
			<div class="col-lg-6">
			</div>
			<div class="col-lg-5">
				<ul class="list-inline">
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="card" value="card" autocomplete="off">
						<label class="btn btn-outline-success" for="card" >신용카드</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="trans" value="trans" autocomplete="off">
						<label class="btn btn-outline-success" for="trans" >계좌이체</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="vbank" value="vbank" autocomplete="off">
						<label class="btn btn-outline-success" for="vbank" >가상계좌</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="phone" value="phone" autocomplete="off">
						<label class="btn btn-outline-success" for="phone" >휴대폰소액결제</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="samsung" value="samsung" autocomplete="off">
						<label class="btn btn-outline-success" for="samsung" >삼성페이</label>
					</li>
					<li class="list-inline-item mt-3 mr-5">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="cultureland" value="cultureland" autocomplete="off">
						<label class="btn btn-outline-success" for="cultureland" >컬쳐랜드</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="smartculture" value="smartculture" autocomplete="off">
						<label class="btn btn-outline-success" for="smartculture" >스마트문상</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="happymoney" value="happymoney" autocomplete="off">
						<label class="btn btn-outline-success" for="happymoney" >해피머니</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="booknlife" value="booknlife" autocomplete="off">
						<label class="btn btn-outline-success" for="booknlife" >도서문화상품권</label>
					</li>
				</ul>
				<button type="button" class="btn btn-primary" style="width: 365px" onclick="payment()">결제</button>
			</div>
		</div>
	</div>
</section>
<script>
function payment(){
	
	var param = {
			reservationTicketInfo : {
				exhibitionReservationInfo : {},
				userInfo : {}
			}
	};
	var objs = document.querySelectorAll('p[class="check"],input[class="form-control"]');
	var piMethod = document.querySelector('input[type="radio"]:checked');
	param[piMethod.name] = piMethod.value; 
	for(obj of objs){
		if(obj.tagName == 'INPUT'){
			if(obj.id.includes('rti')){
				param['reservationTicketInfo'][obj.id] = obj.value;
			}
		}else{
			if(obj.id.includes('rti')){
				param['reservationTicketInfo'][obj.id] = obj.innerText;
			}else{
				param[obj.id] = obj.innerText;
			}
		}
	}
	
	//임시로 eriNum 추가해야댐
	param['reservationTicketInfo']['exhibitionReservationInfo']['eriNum'] = 2;
	//임시로 uiNum 추가해야댐
	param['reservationTicketInfo']['userInfo']['uiNum'] = 8;
	
	console.log(param);
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', "/payment");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responesText);
		}
	}
	
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
}



</script>	
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>