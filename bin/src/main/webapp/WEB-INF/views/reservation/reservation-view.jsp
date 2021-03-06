<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 예약 등록</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link href="/resources/node_modules/flatpickr/dist/flatpickr.css" rel="stylesheet"/>
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
<script src=/resources/node_modules/flatpickr/dist/l10n/ko.js></script>
<style>
.reservationViewMain {
	margin-top: 300px;
	margin-left: 450px;
	height: 1000px;
}
h5 {
	font-weight: bold;
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
<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
   <div class="container reservationViewMain">
      	<div class="row">
   			<div class="col-lg-9" style="text-align: center;">
				<div class="section-title">
		          <p>전시회 예약</p>
		        </div>
   			</div>
   		</div>
		<div class="row">
			<div class="col-lg-5">
                <img src="/resources/assets/img/blog-1.jpg" alt="" class="img-fluid" data-col="imgPath"><br>
          	</div>
			<div class="col-lg-5" style="height: 300px">
				<div id="mycal">
				</div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-lg-5">
				<div class="row">
					<div class="col-lg-12">
					<h5 class="text-center" data-col="exhibitionName"></h5>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-lg-6">
						<h5>기간</h5>
						<p data-col="period"></p>
					</div>
					<div class="col-lg-3">
						<h5>예매일자</h5>
						<p id="rtiDate"></p>
					</div>
					<div class="col-lg-3">
						<h5>예매시간</h5>
						<p id="rtiTime"></p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<h5>관람연령</h5>
						<p data-col="audienceRating" id="rtiAudienceRating">전체관람가</p>
					</div>
					<div class="col-lg-6">
						<ul class="list-inline">
						  	<li class="list-inline-item">
								<h5>예매수</h5>
							</li>
							<li class="list-inline-item">
								<input type="number" class="form-control" id="rtiNumber" onchange="changeNumber(this)" min="0" max="5" style="width:130px; height: 30px; text-align: center">
							</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<h5>러닝타임</h5>
						<p data-col="runningTime"></p>
					</div>
					<div class="col-lg-3">
						<h5>관람료</h5>
						<p data-col="charge"></p>
					</div>
					<div class="col-lg-3">
						<h5>합계금액</h5>
						<p>25000</p>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="row">
					<div class="col-lg-12">
						<h5 class="mt-3">시간 선택</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<ul class="list-inline" id="timeList">
						</ul>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-lg-12">
						<button type="button" class="btn btn-primary" style="width: 385px;" onclick="insert()">결제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" data-col="maxTicket" id="eriMaxTicket">
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script>
/* var i = 0;
var x = 6;
var disable = ["2021-04-08", "2021-04-09"]
disable.push(function(date) {
    return (date.getDay() === i || date.getDay() === x);
},)

flatpickr.localize(flatpickr.l10ns.ko);
flatpickr('#mycal', {
	inline: true,
	time_24hr: true,
	minDate: "2021-04-08",
    disable: disable,
<<<<<<< HEAD
});
=======
    defualtDate: ["2021-04-09"]
}); */
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/reservation/1');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var objs = document.querySelectorAll('[data-col]');
			document.querySelector('#rtiDate').innerHTML = res.minDate;
			document.querySelector('#eriMaxTicket').value = res.maxTicket;
			for(obj of objs){
				var key = obj.getAttribute('data-col');
				var data = res[key];
				if(key === "imgPath") {
					obj.src = '/resources/assets/img/exhibition/' + data;
					data = '';
				}
				obj.innerHTML = data;
			}
			getTimeList(res.minDate);
			flatpickr('#mycal', {
				inline: true,
				time_24hr: true,
				minDate: res.minDate,
				maxDate: res.maxDate,
			    disable: res.disable,
			    defaultDate: res.minDate,
			    onChange: function(selectedDates, dateStr, instance) {
			    	document.querySelector('#rtiDate').innerHTML = dateStr;
			    	getTimeList(dateStr);
			    	
			    }
			});
		}
	}
	xhr.send();
}

function getTimeList(day) {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/reservation-time/2/' + day);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var keys = [];
			for(var key in res){
				keys.push(Number(key.substring(0,2)));
			}
			keys.sort(function(a, b) {
				return a - b;
			});
			var html = '';
			for(var i=0; i<keys.length; i++) {
				var key = keys[i] + ':00';
				
				if(key.length != 5){
					key = '0' + key;
				}
				html += '<li class="list-inline-item">';
				html += '<input type="radio" class="btn-check radio-hidden" name="rtiTime" id="time' + (i+1) + '" autocomplete="off" value="' + key +'" onclick="selectTime(this)" data-ticket="' + res[key] +'">';
				html += '<label class="btn btn-outline-success" for="time' + (i+1) + '" >' + key + '<br>' + res[key] +'매 </label>';
			  	html += '</li>';
			}
			document.querySelector('#timeList').innerHTML = html;
			var first = document.querySelector("#time1");
			first.checked = true;
			document.querySelector('#rtiTime').innerHTML = first.value;
			var rtiNumber = document.querySelector('#rtiNumber');
			var maxTicket = Number(document.querySelector('#eriMaxTicket').value);
			var remainTicket = Number(first.getAttribute('data-ticket'));
			rtiNumber.max = remainTicket > maxTicket ? maxTicket : remainTicket;
		}
	}
	xhr.send();
}

function selectTime(obj){
	var maxTicket = Number(document.querySelector('#eriMaxTicket').value);
	var remainTicket = Number(obj.getAttribute('data-ticket'));
	console.log(maxTicket);
	console.log(remainTicket);
	
	var rtiTime = document.querySelector('#rtiTime');
	rtiTime.innerHTML = obj.value;	
	
}

function changeNumber(obj){
	
	console.log(obj);
}
</script>
</body>
</html>