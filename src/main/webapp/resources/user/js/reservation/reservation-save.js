// 매니저 예약 세이브 JS
var sDate =flatpickr('#riStartDate', {
	time_24hr: true,
	dateFormat: 'Y-m-d',
	minDate: 'today',
	onChange: function(selectedDates) {
		var date = selectedDates[0];
		date.setDate(date.getDate() + 1);
		var year = date.getFullYear();
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);
		eDate.config.minDate = (year + '-' + month + '-' + day);
		date.setDate(date.getDate() - 1);
		
    },
});
var eDate = flatpickr('#riEndDate', {
	time_24hr: true,
	dateFormat: "Y-m-d",
	onChange: function(selectedDates) {
		var date = selectedDates[0];
		date.setDate(date.getDate() - 1);
		var year = date.getFullYear();
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);
		sDate.config.maxDate = (year + '-' + month + '-' + day);
		date.setDate(date.getDate() + 1);
		
    },
});
flatpickr('#riStartTime', {
	enableTime: true,
	noCalendar: true,
	time_24hr: true,
	dateFormat: "H:i",
	defaultHour: 09,
	minuteIncrement: 60
});
flatpickr('#riEndTime', {
	enableTime: true,
	noCalendar: true,
	time_24hr: true,
	dateFormat: "H:i",
	defaultHour: 18,
	minuteIncrement: 60
});

window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibitions-user');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			if(res.length === 0){
				alert('등록하신 전시회가 없습니다. 전시회 등록 부터 해주세요.');
				location.href = '/views/exhibition/manager/insert';
				return;
			}
			
			var html = '<option selected disabled>예약 전시회를 선택해 주세요</option>';
			for(var exhibition of res){
				html += '<option value="' + exhibition.eiNum + '">' + exhibition.eiName + '</option>';
			}
			document.querySelector('#eiNum').innerHTML = html;
		}
	}
	xhr.send();
}
function check(obj){
	obj.className = 'form-control is-valid';
}


function insert(){
	var objs = document.querySelectorAll('div[id="inputDiv"] > input, [name="selectBox"]');
	for(obj of objs){
		if(obj.className == 'form-control is-invalid'){
			obj.focus();
			alert('입력값을 확인해주세요');
			return;
		}
	}
	var param = {
			exhibitionInfo : {}
	};
	
	for(obj of objs){
		if(obj.id == 'eiNum') {
			param['exhibitionInfo'][obj.id] = obj.value;
		}else{
			param[obj.id] = obj.value;
		}
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', "/reservation");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			if(res >= 1){
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