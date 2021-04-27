<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록 페이지</title>
<link href="/resources/node_modules/flatpickr/dist/flatpickr.min.css" rel="stylesheet"/>
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
<style>
.reservationInsertMain{
	margin-top: 100px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
    <section id="contact" class="contact">
      <div class="container reservationInsertMain">
    	<div class="row">
   			<div class="col-lg-10" style="text-align: center;">
				<div class="section-title">
		          <p>전시회 예약등록</p>
		        </div>
   			</div>
   		</div>
        <div class="row" style="margin-left: 100px">
          <div class="col-lg-4">
            <div class="info mt-3">
              <div class="address">
                <h4>예약 전시회</h4>               
              </div>
              <div class="phone">
                <h4>휴무일</h4>
              </div>
              <div class="phone">
                <h4>관람등급</h4>
              </div>
              <div class="phone">
                <h4>러닝타임</h4>
              </div>
              <div class="phone">
                <h4>1인당 최대 예매표</h4>               
              </div>
              <div class="phone">
                <h4>시간당 최대 예매표</h4>
              </div>
              <div class="phone">
                <h4>예매 시작일</h4>
              </div>
              <div class="phone">
                <h4>예매 종료일</h4>
              </div>
              <div class="phone">
                <h4>예매 시작시간</h4>
              </div>
              <div class="phone">
                <h4>예매 종료시간</h4>
              </div>
            </div>
          </div>
          <!-- 입력란 -->
          <div class="col-lg-4 mt-5 mt-lg-0" id="inputDiv">
              <div class="form-row mt-3">
                <div class="col-md-6 form-group">
                  <select class="custom-select is-invalid" id="eiNum" name=selectBox style="width: 311.66px" onchange="check(this)">
                  </select>
                </div>
              </div>
              <div class="form-row mt-3 mb-2">
                <div class="col-md-6 form-group">
                  <select class="custom-select is-invalid" id="riHoliday" name="selectBox" style="width: 311.66px" onchange="check(this)" >
                  	<option selected disabled>휴무일을 선택해주세요</option>
                  	<option value="1">일요일</option>
                  	<option value="2">월요일</option>
                  	<option value="3">화요일</option>
                  	<option value="4">수요일</option>
                  	<option value="5">목요일</option>
                  	<option value="6">금요일</option>
                  	<option value="7">토요일</option>
                  </select>
                </div>
              </div>
              <input type="text" class="form-control is-invalid" id="riAudienceRating" onchange="check(this)">
              <label class="mt-2"></label>
              <input type="text" class="form-control is-invalid" id="riRunningTime" onchange="check(this)">
              <label class="mt-2"></label>
              <input type="number" class="form-control is-invalid" id="riMaxTicket" onchange="check(this)" min="1" required>
              <label class="mt-3"></label>
              <input type="number" class="form-control is-invalid" id="riMaxStock" onchange="check(this)" min="1" required >
           	  <label class="mt-3"></label>
              <input type="text" class="form-control is-invalid" id="riStartDate" onchange="check(this)" style="background-color: white">
              <label class="mt-3"></label>	
              <input type="text" class="form-control is-invalid" id="riEndDate" onchange="check(this)" style="background-color: white">
              <label class="mt-3"></label>
              <input type="text" class="form-control is-invalid" id="riStartTime" onchange="check(this)" style="background-color: white">
              <label class="mt-3"></label>
              <input type="text" class="form-control is-invalid" id="riEndTime" onchange="check(this)" style="background-color: white">
              <label class="mt-3"></label>
              <br>
              <button class="get-started-btn ml-auto" onclick="insert()" >전시회 예약등록 신청</button>
          </div>
        </div>
      </div>
    </section>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script>
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
			if(!xhr.responseText){
				alert('등록하신 전시회가 없습니다. 전시회 등록 부터 해주세요.');
				location.href = '/views/exhibition/manager/insert';
				return;
			}
			var res = JSON.parse(xhr.responseText);
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
	var validation = {
			riAudienceRating : {
				min : 2,
				max : 10,
				msg : '관람연령은 최소 2글자이상 최대 10글자 이하로 입력해주세요'
			},
			riRunningTime : {
				min : 2,
				max : 5,
				msg : '러닝타임은 최소 2글자이상 최대 5글자 이하로 입력해주세요'
			}
	}
	if(obj.type == 'text' && validation[obj.id]){
		var value = obj.value.trim().length;
		if(value < validation[obj.id].min || value > validation[obj.id].max){
			obj.className = 'form-control is-invalid';
			obj.focus();
			alert(validation[obj.id].msg);
			return;
		}
	}
	
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

</script>
</body>

</html>