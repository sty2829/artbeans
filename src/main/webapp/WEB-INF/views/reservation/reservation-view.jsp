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
	width: 500px;
	height: 350px;
}
.btn-outline-success{color:#198754;border-color:#198754}.btn-outline-success:hover{color:#fff;background-color:#198754;border-color:#198754}.btn-check:focus+.btn-outline-success,.btn-outline-success:focus{box-shadow:0 0 0 .25rem rgba(25,135,84,.5)}.btn-check:active+.btn-outline-success,.btn-check:checked+.btn-outline-success,.btn-outline-success.active,.btn-outline-success.dropdown-toggle.show,.btn-outline-success:active{color:#fff;background-color:#198754;border-color:#198754}.btn-check:active+.btn-outline-success:focus,.btn-check:checked+.btn-outline-success:focus,.btn-outline-success.active:focus,.btn-outline-success.dropdown-toggle.show:focus,.btn-outline-success:active:focus{box-shadow:0 0 0 .25rem rgba(25,135,84,.5)}.btn-outline-success.disabled,.btn-outline-success:disabled{color:#198754;background-color:transparent}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
   <div class="container reservationMain">
      	<div class="row">
   			<div class="col-lg-10" style="text-align: center;">
				<div class="section-title">
		          <p>전시회 예약등록</p>
		        </div>
   			</div>
   		</div>
		<div class="row">
			<div class="col-lg-6">
                <img src="/resources/assets/img/blog-1.jpg" alt="" class="img-fluid" data-col="eiImg"><br>
          	</div>
			<div class="col-lg-5">
				<div id="mycal">
				</div>
				<h5 class="mt-4">시간 선택</h5>
			</div>
		</div>
		<div class="row mt-2" id="checkRadioTop" >
			<div class="col-lg-3">
	            <input type="text" class="form-control mb-2" name="name" id="name" placeholder="예매자 이름"/>
	            <div class="validate"></div>
	            <input type="text" class="form-control mb-2" name="email" id="email" placeholder="예매자 연락처" />
	            <div class="validate"></div>
	            <input type="email" class="form-control mb-2" name="email" id="email" placeholder="예매자 이메일" />
	            <div class="validate"></div>
			</div>
			<div class="col-lg-6">
				<ul class="list-inline">
				  <li class="list-inline-item">
				  	<input type="radio" class="btn-check radio-hidden" name="options-outlined" id="success-outlined" autocomplete="off" checked>
					<label class="btn btn-outline-success" for="success-outlined">11:00</label>
				  </li>
	  			  <li class="list-inline-item">
				  	<input type="radio" class="btn-check radio-hidden" name="options-outlined" id="success-outlined" autocomplete="off" checked>
					<label class="btn btn-outline-success" for="success-outlined">11:00</label>
				  </li>
	  			  <li class="list-inline-item">
				  	<input type="radio" class="btn-check radio-hidden" name="options-outlined" id="success-outlined" autocomplete="off" checked>
					<label class="btn btn-outline-success" for="success-outlined">11:00</label>
				  </li>
	  			  <li class="list-inline-item">
				  	<input type="radio" class="btn-check radio-hidden" name="options-outlined" id="success-outlined" autocomplete="off" checked>
					<label class="btn btn-outline-success" for="success-outlined">11:00</label>
				  </li>
	  			  <li class="list-inline-item">
				  	<input type="radio" class="btn-check radio-hidden" name="options-outlined" id="success-outlined" autocomplete="off" checked>
					<label class="btn btn-outline-success" for="success-outlined">11:00</label>
				  </li>
  	  			  <li class="list-inline-item">
				  	<input type="radio" class="btn-check radio-hidden" name="options-outlined" id="success-outlined" autocomplete="off" checked>
					<label class="btn btn-outline-success" for="success-outlined">11:00</label>
				  </li>
				</ul>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script>
flatpickr('#mycal', {
	inline: true,
	time_24hr: true,
});
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition?eiNum=1');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			console.log(res.exhibitionReservationInfo);
			var eri = res.exhibitionReservationInfo;
			var htmlTop = '<div class="col-md-5"></div>';
			var htmlBottom = '<div class="col-md-5"></div>';
			min = eri.eriStartDate;
			max = eri.eriEndDate;
			var est = eri.eriStartTime.substring(0,2);
			var eet = eri.eriEndTime.substring(0,2);
			var startTime = est;
			for(var i=0; i<eet-est; i++){
				if(i>4){
					htmlBottom += '<div class="col-lg-1">';
					htmlBottom += '<input type="radio" class="btn-check" name="viewTime" id="viewTime' + (i+1) + '" autocomplete="off">';
					htmlBottom += '<label class="btn btn-outline-success" for="viewTime' + (i+1) + '">'+ startTime++ +'시 <br>' + eri.eriMaxstock +'매</label>';
					htmlBottom += '</div>';
				}else{
					htmlTop += '<div class="col-lg-1">';
					htmlTop += '<input type="radio" class="btn-check" name="viewTime" id="viewTime' + (i+1) + '" autocomplete="off">';
					htmlTop += '<label class="btn btn-outline-success" for="viewTime' + (i+1) + '">'+ startTime++ +'시 <br>' + eri.eriMaxstock + '매</label>';
					htmlTop += '</div>';
				}

			}
			document.querySelector('#checkRadioTop').innerHTML = htmlTop;
			document.querySelector('#checkRadioBottom').innerHTML = htmlBottom;
			
			flatpickr('#mycal', {
				inline: true,
				time_24hr: true,
				minDate: min,  
				maxDate: max,
			    disable: [
			        function(date) {
			            return (date.getDay() === 0);

			        }
			    ],
			});
		}
	}
}
</script>
</body>
</html>