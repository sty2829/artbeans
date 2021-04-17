<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<link href="/resources/node_modules/flatpickr/dist/flatpickr.css" rel="stylesheet"/>
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
   <div class="container reservationSaveMain">
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
	              <div class="pic" style="text-align: center"><img src="/resources/assets/img/exhibition/${param.imgPath}" class="img-fluid" alt="" style="width: 200px; height: 150px"><h4 class="mt-3"></h4></div>
	              <div class="member-info">
	              	<div class="row">
	              		<div class="col-lg-12">
		                <ul class="list-inline mt-4">
	                 		<li class="list-inline-item">
		   		  				 <h4>예매일</h4>
				                 <p id="rtiDate" class="check">${param.rtiDate}</p>
		                 	</li>
           					<li class="list-inline-item">
		   		  				 <h4>예매시간</h4>
				                 <p style="text-align: center" id="rtiTime" class="check">${param.rtiTime}</p>
		                 	</li>
			            </ul>
		                </div>
		                <div class="col-lg-12">
		                	<ul class="list-inline">
								<li class="list-inline-item">
			   		  				 <h4 class="mt-2">예매수</h4>
					                 <p style="text-align: center" id="rtiNumber" class="check">${param.rtiNumber}</p>
			                 	</li>
			                 	<li class="list-inline-item">
					                 <h4 class="mt-2 ml-3">결제금액</h4>
					                 <p style="text-align: center" id="piPrice" class="check">${param.piPrice}</p>
					            </li>    
			                 </ul>
		                </div>
	                </div>
	              </div>
	            </div>
          	</div>
			<div class="col-lg-4" id="saveDiv">
	      		<label for="rtiName">예매자 성함</label>
			    <input type="text" class="form-control" id="rtiName" required>
      			<label for="rtiEmail" class="mt-2">예매자 이메일</label>
			    <input type="email" class="form-control" id="rtiEmail" required>
    			<label for="rtiPhoneNumber" class="mt-2">예매자 연락처</label>
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
				<button type="button" class="btn btn-primary" style="width: 365px" onclick="saveReservation()">결제</button>
			</div>
		</div>
	</div>
</section>
<script>
IMP.init('imp08010397');

function saveReservation(){
	//임시로 uiNum 추가해야댐
	var param = {
			paymentInfo : {},
			exhibitionReservationInfo : {
				eriNum: ${param.eriNum}
			},
			userInfo : {
				uiNum: 8
			}
	};
	var objs = document.querySelectorAll('p[class="check"],input[class="form-control"],input[type="radio"]:checked');
	var piMethod = document.querySelector('input[type="radio"]:checked');
	for(obj of objs){
		if(obj.tagName == 'INPUT'){
			if(obj.id.includes('rti')){
				param[obj.id] = obj.value;
			}else{
				param['paymentInfo'][obj.name] = obj.value;
			}
		}else{
			if(obj.id.includes('rti')){
				param[obj.id] = obj.innerText;
			}else{
				param['paymentInfo'][obj.id] = obj.innerText;
			}
		}
	}
	var xhr = new XMLHttpRequest();
	xhr.open('POST', "/reservation/" + ${param.eriNum});
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			IMP.request_pay({
			    pg : 'inicis',
			    pay_method : res.paymentInfo.piMethod,
			    merchant_uid : res.paymentInfo.piMerchantId,
			    name : '예약명 : 전시회 예약',
			    amount : res.paymentInfo.piPrice,
			    buyer_name : res.rtiName,
			    buyer_email : res.rtiEmail,
			    buyer_tel : res.rtiPhone,
			    
			}, function(rsp) {
			    if ( rsp.success ) {
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "/reservation/confirm", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
			    		method: 'POST',
			    		data: {
			    		    impId: rsp.imp_uid,
			                merchantId: rsp.merchant_uid,
			    		},
			    		
			    	}).done(function(data) {
			    		if (data == 1) {
			    			alert('결제가 완료되었습니다.');
			    			//추후에 마이페이지 이동? 결제완료페이지 ㅎ
			    			location.href = '/';
			    		} else {
			    			alert('결제 금액이 일치 하지 않습니다');
			    		}
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;

			        alert(msg);
			    }
			});
		}
	}
	
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
}

</script>	
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>