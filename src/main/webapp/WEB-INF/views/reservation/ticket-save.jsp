<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>티켓 결제</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link href="/resources/user/css/reservation/ticket-save.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hevj9bqhd5"></script>
</head>
<body>
   <div class="container reservationSaveMain">
   		<div class="row d-flex justify-content-center">
   			<div class="col-lg-10" style="text-align: center;">
				<div class="section-title">
		          <p>예매</p>
		        </div>
   			</div>
   		</div>
		<div class="row d-flex justify-content-center">
	         <div class="col-lg-6">
				<div class="card mb-2">
			  		<div class="row no-gutters">
			    		<div class="col-md-4">
			      			<img src="" style="width: 180px; height: 190px" id="fiPath">
		   				</div>
			    		<div class="col-md-7">
			      			<div class="col-lg-12 ml-2 mt-3" style="height: 40px">
			  			  		<p style="font-size: 1.2em; margin-bottom: 0px" class="eiName" id="eiName"></p>
			           		 </div>
		         			 <div class="col-lg-12 ml-2" style="height: 70px">
		         			 	<div class="row">
		         			 		<div class="col-lg-5 mb-2">
		         			 			<p style="font-size: 1.1em; margin-bottom: 0px;">예매일</p>
				                 		<span id="tiDate" class="check">${param.tiDate}</span>
		         			 		</div>
		         			 		<div class="col-lg-5 mb-2">
		         			 			<p style="font-size: 1.1em; margin-bottom: 0px">예매시간</p>
				                 		<span id="tiTime" class="check" style="text-align: center;">${param.tiTime}</span>
		         			 		</div>
		         			 	</div>
		         			 	<div class="row">
		         			 		<div class="col-lg-5">
		         			 			<p style="font-size: 1.1em; margin-bottom: 0px">예매수</p>
				                 		<span id="tiNumber" class="check" style="text-align: center">${param.tiNumber}</span>장
		         			 		</div>
		         			 		<div class="col-lg-5">
		         			 			<p style="font-size: 1.1em; margin-bottom: 0px">예매금액</p>
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
		<div class="row d-flex justify-content-center">
			<div class="col-lg-6">
				<div style="border: 0; width: 540px; height: 240px;" id="map"></div>
			</div>
			<div class="col-lg-4">
				<c:if test="${param.piPrice eq 0}">
					<button type="button" class="btn btn-primary mt-4" style="width: 330px" onclick="saveReservation()">예매하기</button>
				</c:if>
				<c:if test="${param.piPrice ne 0}">
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
					<button type="button" class="btn btn-primary" style="width: 330px" onclick="saveReservation()">결제하기</button>
				</c:if>
			</div>
		</div>
	</div>
	<input type="hidden" id="riNum" value="${param.riNum}">
	<input type="hidden" id="eiNum" value="${param.eiNum}">
<script>
window.addEventListener('load', naverMap);

function getExhibition(){
	return new Promise(function(resolve, rejcet){
		var eiNum = document.querySelector('#eiNum');
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/exhibition/?eiNum=' + eiNum.value);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				document.querySelector('#fiPath').src = '/upload/' + res.fileInfo.fiPath;
				document.querySelector('#eiName').innerText = res.eiName;
				resolve(res.galleryInfo);
			}
		}
		xhr.send();
	})
	
	
}

async function naverMap() {
	var gallery = await getExhibition();
	
	var mapOptions = {
	    center: new naver.maps.LatLng(gallery.giAddressY, gallery.giAddressX),
	    zoom: 16
	};
	
	var map = new naver.maps.Map('map', mapOptions);
		
	
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(gallery.giAddressY, gallery.giAddressX),
	    map: map
	});
	
	
	var contentString = [
	        '<div style="padding:4px 4px;">',
	        '	<div style="font-weight:bold;padding-bottom:3px;">' + gallery.giName + '</div>',
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
}

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
				alert('휴대폰은 13글자 이하 입니다.');
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
				riNum: document.querySelector('#riNum').value
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
	xhr.open('POST', "/ticket/" + riNum.value);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4) {
			if(xhr.status == 200) {
				if(!xhr.responseText){
					alert('다시 로그인 해주세요');
					location.href = '/views/user/login';
					return;
				}
				var res = JSON.parse(xhr.responseText);
				if(res.paymentInfo.piPrice === 0) {
					alert('예매가 완료되었습니다.');
					location.href = '/views/user/reservation/reservation-info';
					return;
				}
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
				    		if (data >= 1) {
				    			alert('결제가 완료되었습니다.');
				    			location.href = '/views/user/reservation/reservation-info';
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