<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hevj9bqhd5"></script>
<style>
.reservationSaveMain {
	margin-top: 100px;
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
   <div class="container reservationSaveMain">
   		<div class="row">
   			<div class="col-lg-1"></div>
   			<div class="col-lg-11" style="text-align: center;">
				<div class="section-title">
		          <p>결제</p>
		        </div>
   			</div>
   		</div>
		<div class="row">
			<div class="col-lg-1"></div>
	         <div class="col-lg-6">
				<div class="card mb-2">
			  		<div class="row no-gutters">
			    		<div class="col-md-4">
			      			<img src="/resources/assets/img/exhibition/${param.imgPath}" style="width: 180px; height: 190px">
		   				</div>
			    		<div class="col-md-7">
			      			<div class="col-lg-12 ml-2 mt-3" style="height: 40px">
			  			  		<p style="font-size: 1.2em; margin-bottom: 0px">백남준전</p>
			           		 </div>
		         			 <div class="col-lg-12 ml-2" style="height: 70px">
		         			 	<div class="row">
		         			 		<div class="col-lg-5">
		         			 			<p style="font-size: 1.2em; margin-bottom: 0px">예매일</p>
				                 		<span id="tiDate" class="check">${param.tiDate}</span>
		         			 		</div>
		         			 		<div class="col-lg-5">
		         			 			<p style="font-size: 1.2em; margin-bottom: 0px">예매시간</p>
				                 		<span id="tiTime" class="check" style="text-align: center;">${param.tiTime}</span>
		         			 		</div>
		         			 	</div>
		         			 	<div class="row">
		         			 		<div class="col-lg-5">
		         			 			<p style="font-size: 1.2em; margin-bottom: 0px">예매수</p>
				                 		<span id="tiNumber" class="check" style="text-align: center">${param.tiNumber}</span>장
		         			 		</div>
		         			 		<div class="col-lg-5">
		         			 			<p style="font-size: 1.2em; margin-bottom: 0px">예매금액</p>
				                 		<span id="piPrice" class="check" style="text-align: center">${param.piPrice}</span>원
		         			 		</div>
		         			 	</div>
		           		   </div>
		       		   </div>
				    </div>
			    </div>
          	</div>
			<div class="col-lg-4" id="saveDiv">
	      		<label for="tiName">예매자 성함</label>
			    <input type="text" class="form-control"  id="tiName" style="width: 330px" value="${userInfo.uiName}" data-check="성함" >
      			<label for="tiEmail" class="mt-2">예매자 이메일</label>
			    <input type="email" class="form-control" id="tiEmail" style="width: 330px" value="${userInfo.uiEmail}" data-check="이메일">
    			<label for="tiPhoneNumber" class="mt-2">예매자 연락처</label>
			    <input type="text" class="form-control" id="tiPhoneNumber" style="width: 330px" value="${userInfo.uiPhoneNumber}" data-check="연락처">
		   </div>
	   </div>
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-6">
				<div style="border: 0; width: 540px; height: 240px;" id="map"></div>
			</div>
			<div class="col-lg-4">
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
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="samsung" value="samsung" autocomplete="off">
						<label class="btn btn-outline-success" for="samsung" >삼성페이</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="happymoney" value="happymoney" autocomplete="off">
						<label class="btn btn-outline-success" for="happymoney" >해피머니</label>
						
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="cultureland" value="cultureland" autocomplete="off">
						<label class="btn btn-outline-success" for="cultureland" >컬쳐랜드</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="smartculture" value="smartculture" autocomplete="off">
						<label class="btn btn-outline-success" for="smartculture" >스마트문상</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="phone" value="phone" autocomplete="off">
						<label class="btn btn-outline-success" for="phone" >휴대폰소액결제</label>
					</li>
					<li class="list-inline-item mt-3">
						<input type="radio" class="btn-check radio-hidden" name="piMethod" id="booknlife" value="booknlife" autocomplete="off">
						<label class="btn btn-outline-success" for="booknlife" >도서문화상품권</label>
					</li>
				</ul>
				<button type="button" class="btn btn-primary" style="width: 330px" onclick="saveReservation()">결제</button>
			</div>
		</div>
	</div>
<script>
var mapOptions = {
    center: new naver.maps.LatLng(${param.y},${param.x}),
    zoom: 16
};

var map = new naver.maps.Map('map', mapOptions);	

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(${param.y},${param.x}),
    map: map
});


var contentString = [
        '<div style="padding:4px 4px;">',
        '	<div style="font-weight:bold;padding-bottom:3px;">${param.giName}</div>',
        '</div>'
    ].join('');	 
var infowindow = new naver.maps.InfoWindow({
    content: contentString
});				 
naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});				 
infowindow.open(map, marker);

IMP.init('imp08010397');

function saveReservation(){
	var valid = {
			tiName : {
				min : 2,
				max : 10
			},
			tiEmail : {
				min: 5,
				max : 40
			},
			tiPhoneNumber : {
				max : 13
			}
	}
	var checkObjs = document.querySelectorAll('[data-check]');
	for(var checkObj of checkObjs){
		var title = checkObj.getAttribute('data-check')
		var id = checkObj.id;
		var txt = checkObj.value.trim().length;
		if(id == 'tiPhoneNumber'){
			if(txt != valid[id]['max'] ){
				alert('휴대폰 형식이 맞지 않습니다.');
				checkObj.focus();
				return;
			}
		}
		if(txt < valid[id]['min'] || txt > valid[id]['max'] ){
			alert(title + '은 ' + valid[id]['min'] + '글자 보다 이상이거나 ' + valid[id]['max'] + '글자 이하여야 합니다.');
		}
	}
	
	
	var param = {
			paymentInfo : {},
			reservationInfo : {
				riNum: ${param.riNum}
			}
	};
	var objs = document.querySelectorAll('span[class="check"],input[class="form-control"],input[type="radio"]:checked');
	var piMethod = document.querySelector('input[type="radio"]:checked');
	for(var obj of objs){
		if(obj.tagName == 'INPUT'){
			if(obj.id.includes('ti')){
				param[obj.id] = obj.value;
			}else{
				param['paymentInfo'][obj.name] = obj.value;
			}
		}else{
			if(obj.id.includes('ti')){
				param[obj.id] = obj.innerText;
			}else{
				param['paymentInfo'][obj.id] = obj.innerText;
			}
		}
	}
	var xhr = new XMLHttpRequest();
	xhr.open('POST', "/ticket/" + ${param.riNum});
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4) {
			if(xhr.status == 200) {
				if(!xhr.responseText){
					alert('다시 로그인 해주세요');
					location.href = '/views/user/login';
					return;
				}
				var res = JSON.parse(xhr.responseText);
				IMP.request_pay({
				    pg : 'inicis',
				    pay_method : res.paymentInfo.piMethod,
				    merchant_uid : res.paymentInfo.piMerchantId,
				    name : '예약명 : 전시회 예약',
				    amount : res.paymentInfo.piPrice,
				    buyer_name : res.tiName,
				    buyer_email : res.tiEmail,
				    buyer_tel : res.tiPhone,
				    
				}, function(rsp) {
				    if ( rsp.success ) {
				    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				    	jQuery.ajax({
				    		url: "/ticket/confirm", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
				    		method: 'POST',
				    		data: {
				    		    impId: rsp.imp_uid,
				                merchantId: rsp.merchant_uid,
				    		},
				    		
				    	}).done(function(data) {
				    		if (data == 1) {
				    			alert('결제가 완료되었습니다.');
				    			//추후에 마이페이지 이동? 결제완료페이지 ㅎ
				    			location.href = '/views/user/mypage-reservation';
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
			}else{
				console.log(res);
				alert('결제금액이 이상합니다..');
			}
			
		}
	}
	
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
}
</script>	
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>