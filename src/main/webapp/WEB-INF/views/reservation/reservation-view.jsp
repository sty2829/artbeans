<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>전시회 예약 정보</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link href="/resources/user/css/reservation/reservation-view.css" rel="stylesheet">
<link href="/resources/node_modules/flatpickr/dist/flatpickr.css" rel="stylesheet"/>
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
<script src=/resources/node_modules/flatpickr/dist/l10n/ko.js></script>
</head>
<body>
   <div class="container reservationViewMain">
      	<div class="row">
      		<div class="col-lg-1"></div>
   			<div class="col-lg-10" style="text-align: center;">
				<div class="section-title">
		          <p>전시회 예약</p>
		        </div>
   			</div>
   			<div class="col-lg-1"></div>
   		</div>
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-5">
                <img class="img-fluid" data-col="imgPath" id="imgPath"><br>
          	</div>
			<div class="col-lg-5" style="height: 300px">
				<div id="mycal">
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
		<div class="row mt-2">
			<div class="col-lg-1"></div>
			<div class="col-lg-5">
				<div class="row">
					<div class="col-lg-12">
					<h5 class="text-center" data-col="exhibitionName" id="eiName"></h5>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-lg-6 mb-3">
						<h5>기간</h5>
						<span data-col="period"></span>
					</div>
					<div class="col-lg-3 mb-3">
						<h5>예매일자</h5>
						<span id="tiDate"></span>
					</div>
					<div class="col-lg-3 mb-3">
						<h5>예매시간</h5>
						<span id="tiTime"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 mb-3">
						<h5>관람연령</h5>
						<span data-col="audienceRating" id="tiAudienceRating"></span>
					</div>
					<div class="col-lg-6 mb-3">
						<ul class="list-inline">
						  	<li class="list-inline-item">
								<h5>예매수</h5>
							</li>
							<li class="list-inline-item">
								<input type="number" class="form-control" id="tiNumber"  onclick="changeNumber(this)" min="0" style="width:130px; height: 30px; text-align: center">
							</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<h5>휴무일</h5>
						<span data-col="holiday"></span>
					</div>
					<div class="col-lg-3">
						<h5>관람료</h5>
						<span data-col="charge"></span>
					</div>
					<div class="col-lg-3">
						<h5>합계금액</h5>
						<span id="piPrice"></span>
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
				<div class="row mt-1">
					<div class="col-lg-12" id="buttonDiv">
						<button type="button" class="btn btn-primary" style="width: 385px;" onclick="goPayment()">다음단계</button>
					</div>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	<input type="hidden" id="eiNum" value="${param.eiNum}">
	<input type="hidden" data-col="maxTicket" id="riMaxTicket">
	<input type="hidden" id="riNum">
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script>
window.addEventListener('load', getSchedule);

function getSchedule(){
	var eiNum = document.querySelector('#eiNum');
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/reservation/' + eiNum.value);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var objs = document.querySelectorAll('[data-col]');
			document.querySelector('#riNum').value = res.riNum;
			document.querySelector('#tiDate').innerHTML = res.minDate;
			document.querySelector('#riMaxTicket').value = res.maxTicket;
			for(obj of objs){
				var key = obj.getAttribute('data-col');
				var data = res[key];
				if(key === "imgPath") {
					obj.src = '/upload/' + data;
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
			    disable: res.disableList,
			    defaultDate: res.minDate,
			    onChange: function(selectedDates, dateStr, instance) {
			    	document.querySelector('#tiDate').innerHTML = dateStr;
			    	getTimeList(dateStr);
			    	
			    }
			});
		}
	}
	xhr.send();
}

function getTimeList(dateStr) {
	var xhr = new XMLHttpRequest();
	var riNum = document.querySelector("#riNum").value;
	xhr.open('GET', '/reservation/' + riNum + '/' + dateStr);
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
			//타임리스트
			document.querySelector('#timeList').innerHTML = html;
			//1인당 최대값
			var first = document.querySelector("#time1");
			first.checked = true;
			document.querySelector('#tiTime').innerHTML = first.value;
			var tiNumber = document.querySelector('#tiNumber');
			var maxTicket = Number(document.querySelector('#riMaxTicket').value);
			var remainTicket = Number(first.getAttribute('data-ticket'));
			tiNumber.max = remainTicket > maxTicket ? maxTicket : remainTicket;
		}
	}
	xhr.send();
}

function selectTime(obj){
	var maxTicket = Number(document.querySelector('#riMaxTicket').value);
	var remainTicket = Number(obj.getAttribute('data-ticket'));
	
	var rtiTime = document.querySelector('#tiTime');
	rtiTime.innerHTML = obj.value;	
	
}

function changeNumber(obj){
	var maxTicket = Number(document.querySelector('#riMaxTicket').value);
	var selectTicket = Number(obj.value);
	var remainTicket = Number(obj.max);
	if(selectTicket > maxTicket){
		alert('1인당 구매가능한 수량은 ' + maxTicket + '입니다.' );
		return
	}else if(selectTicket > remainTicket){
		alert('현재 남은수량은 ' + remainTicket + ' 입니다.');
		return
	}else if(selectTicket < 0 ){
		alert('티켓을 한개 이상 선택해주세요.');
		return
		//document.querySelector('#piPrice').innerHTMLdocument.querySelector('#piPrice').innerHTML
	}
	var charge = Number(document.querySelector('[data-col="charge"]').innerText);
	document.querySelector('#piPrice').innerHTML = selectTicket * charge;
}

function goPayment(){
	var tiDate = document.querySelector('#tiDate').innerText;
	var tiTime = document.querySelector('#tiTime').innerText;
	var tiNumber = document.querySelector('#tiNumber').value;
	var piPrice = document.querySelector('#piPrice').innerText;
	var riNum = document.querySelector("#riNum").value;
	
	var param = '?tiDate=' + tiDate + '&';
	param += 'tiTime=' + tiTime + '&';
	param += 'tiNumber=' + tiNumber + '&';
	param += 'piPrice=' + piPrice + '&';
	param += 'riNum=' + riNum + '&';
	param += 'eiNum=' + ${param.eiNum} + '&';
	
	location.href = '/views/reservation/ticket-save/' + param
}
</script>
</body>
</html>