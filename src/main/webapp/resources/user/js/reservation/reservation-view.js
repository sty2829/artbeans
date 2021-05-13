// 전시회 예약정보 화면 JS
window.addEventListener('load', getSchedule);
function compareDate(maxDate){
    var year = maxDate.substring(0,4);
    var month = maxDate.substring(5,7);
    var date = maxDate.substring(8,10);
    var endDate = new Date(Number(year), Number(month)-1, Number(date));
    endDate.setDate(endDate.getDate()+1);
    var today = new Date();
    if(today.getTime() > endDate.getTime()){
    	alert('예약일정이 끝났습니다.');
    	history.back();
    }
}


function getSchedule(){
	var eiNum = document.querySelector('#eiNum');
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/reservation/' + eiNum.value);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
		    compareDate(res.maxDate);
			var objs = document.querySelectorAll('[data-col]');
			for(obj of objs){
				var key = obj.getAttribute('data-col');
				var data = res[key];
				if(key === 'imgPath') {
					obj.src = '/upload/' + data;
					data = '';
				}else if(key === 'maxTicket'){
					obj.max = data;
					data = '';
				}else if(key === 'riNum'){
					obj.value = data;
				}
				obj.innerHTML = data;
			}
			getTimeList(res.minDate);
			flatpickr('#mycal', {
				inline: true,
				locale: 'ko',
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
	xhr.open('GET', '/reservation?riNum=' + riNum + '&dateStr=' + dateStr);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var i = 1;
			for(var timeList of res) {
				if(timeList.disableTime){
					html += '<li class="list-inline-item">';
					html += '<input type="radio" class="btn-check radio-hidden" id="disabletime" autocomplete="off" onclick="alert(\'예약시간이 지났습니다.\')">';
					html += '<label class="btn btn-outline-danger" for="disabletime" >' + timeList.time + '<br>' + timeList.ticket +'매 </label>';
				  	html += '</li>';
				}else{
					html += '<li class="list-inline-item">';
					html += '<input type="radio" class="btn-check radio-hidden" name="rtiTime" id="time' + i  + '" autocomplete="off" value="' + timeList.time +'" onclick="selectTime(this)" data-ticket="' + timeList.ticket +'">';
					html += '<label class="btn btn-outline-success" for="time' + i + '" >' + timeList.time + '<br>' + timeList.ticket +'매 </label>';
				  	html += '</li>';
				  	i++;
				}
			 	
			}
			//타임리스트
			document.querySelector('#timeList').innerHTML = html;
			//맥스티켓 설정
			var first = document.querySelector("#time1");
			var tiNumber = document.querySelector('#tiNumber');
			var maxTicket = Number(tiNumber.max);
			var remainTicket = Number(first.getAttribute('data-ticket'));
			tiNumber.max = remainTicket > maxTicket ? maxTicket : remainTicket;
			
			document.querySelector('#tiTime').innerHTML = first.value;
			first.checked = true;
		}
	}
	xhr.send();
}

function selectTime(obj){
	var tiNumber = document.querySelector('#tiNumber');
	var maxTicket = Number(tiNumber.max);
	var remainTicket = Number(obj.getAttribute('data-ticket'));
	
	tiNumber.max = remainTicket > maxTicket ? maxTicket : remainTicket;
	
	if(Number(tiNumber.value) > Number(tiNumber.max)){
		tiNumber.value = tiNumber.max;
	}
	
	var rtiTime = document.querySelector('#tiTime');
	rtiTime.innerHTML = obj.value;	
	
}
var isNumber = true;
function changeNumber(obj){
	var selectTicket = Number(obj.value);
	var maxTicket = Number(document.querySelector('#tiNumber').max);
	
	if(isNumber){
		if(selectTicket <= 0){
			alert('예매수는 1개 이상 선택해주세요.');
			return;
		}else if(selectTicket >= maxTicket){
			alert('1인당 구매가능한 수량은 ' + maxTicket + '입니다.' );
			obj.value= maxTicket;
			return;
		}
			
	}

	isNumber = selectTicket <= 0 ? true : (selectTicket >= maxTicket) ? true : false; 
	
	var charge = Number(document.querySelector('#charge').innerText);
	document.querySelector('#piPrice').innerHTML = selectTicket * charge;
}

function goPayment(){
	var tiNumber = document.querySelector('#tiNumber');
	if(tiNumber.value < 1 || tiNumber.value == ''){
		alert('예매수를 1장이상 골라주세요');
		return;
	}
	
	var objs = document.querySelectorAll('[data-param]');
	var param = '?'
	for(var obj of objs){
		var key = obj.getAttribute('data-param');
		if(obj.tagName == 'INPUT'){
			param += key + '=' + obj.value + '&';
		}else{
			param += key + '=' + obj.innerText + '&';
		}
	}
	
	location.href = '/views/reservation/ticket-save/' + param
}