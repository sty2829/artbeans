<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 예약 등록</title>
<link href="/resources/node_modules/flatpickr/dist/flatpickr.css" rel="stylesheet"/>
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
<script src=/resources/node_modules/flatpickr/dist/l10n/ko.js></script>
<style>
.reservationCancleMain {
	margin-top: 300px;
	margin-left: 450px;
	height: 1000px;
}
.radio-hidden{
	display: none;
}
.list-inline-item {
    margin-top: 5px;
}
img[data-col] {
	width: 512px;
	height: 378px;
}
.btn-outline-success{color:#198754;border-color:#198754}.btn-outline-success:hover{color:#fff;background-color:#198754;border-color:#198754}.btn-check:focus+.btn-outline-success,.btn-outline-success:focus{box-shadow:0 0 0 .25rem rgba(25,135,84,.5)}.btn-check:active+.btn-outline-success,.btn-check:checked+.btn-outline-success,.btn-outline-success.active,.btn-outline-success.dropdown-toggle.show,.btn-outline-success:active{color:#fff;background-color:#198754;border-color:#198754}.btn-check:active+.btn-outline-success:focus,.btn-check:checked+.btn-outline-success:focus,.btn-outline-success.active:focus,.btn-outline-success.dropdown-toggle.show:focus,.btn-outline-success:active:focus{box-shadow:0 0 0 .25rem rgba(25,135,84,.5)}.btn-outline-success.disabled,.btn-outline-success:disabled{color:#198754;background-color:transparent}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
	<div class="container reservationCancleMain">
		<div class="card mb-3" style="max-width: 540px;">
		  <div class="row no-gutters">
		    <div class="col-md-4">
		      <img src="/upload/1197354369033300.JPG" style="width: 180px; height: 190px">
		    </div>
		    <div class="col-md-8">
		      <div class="row">
			      <div class="col-lg-12 ml-2" style="height: 40px">
		  			    <p style="font-size: 1.5em; margin-bottom: 0px">백남준전<p>
		           </div>
	         	<div class="col-lg-12 ml-2" style="height: 70px">
	              <ul class="list-inline">
	             		<li class="list-inline-item">
	  		  				 <p style="font-size: 1.4em; margin-bottom: 0px">예매일<p>
	                 		 <span style="display: block">2021-04-12</span>
	                	</li>
	   			    	<li class="list-inline-item">
	  		  				 <p style="font-size: 1.4em; margin-bottom: 0px">예매일<p>
	                 		 <span style="display: block">2021-04-12</span>
	                	</li>
	            	</ul>
	           </div>
	           <div class="col-lg-12 ml-2">
	            	<ul class="list-inline">
						<li class="list-inline-item">
	 		  				 <p style="font-size: 1.4em; margin-bottom: 0px">예매일<p>
	                 		 <span style="display: block">2021-04-12</span>
	               		</li>
	               		<li class="list-inline-item">
			                 <p style="font-size: 1.4em; margin-bottom: 0px">예매일<p>
	                 		 <span style="display: block">2021-04-12</span>
	           			 </li>    
	               	</ul>
	             </div>
        		</div>
			    </div>
		  </div>
	</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script>
function cancel() {
	var tciReason = document.querySelector('#tciReason');
	
	var param = {
			tciReason : tciReason,
			rtiNum : 119,
			uiNum : 8
	};
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', "/exhibition-reservation");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText >= 1){
				alert('전시회 예약등록에 성공하였습니다.');
				location.href = '/';
				return;
			}
			alert('전시회 예약등록에 실패하였습니다.');
		}
	}
	
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
}

</script>
</body>
</html>