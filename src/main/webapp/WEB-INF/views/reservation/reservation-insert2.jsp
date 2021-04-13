<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록 페이지</title>
<link href="/resources/node_modules/flatpickr/dist/flatpickr.css" rel="stylesheet"/>
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
<style></style>
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
        <div class="row">
          <div class="col-lg-4">
            <div class="info mt-3">
              <div class="address">
                <h4>예약 전시회</h4>               
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
          <div class="col-lg-5 mt-5 mt-lg-0">
              <div class="form-row mt-3">
                <div class="col-md-6 form-group">
                  <select class="form-control" id="exhibitionSelect">
                  	<option>전시회를 선택해주세요</option>
                  </select>
                </div>
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" id="eriAudienceRating" required>
               <div style="HEIGHT: 13pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" id="eriRunningTime" required>
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="number" class="form-control" id="eriMaxStock" min="1" required>
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="number" class="form-control" id="eriMaxTicket" min="1" required >
                <div style="HEIGHT: 10pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" id="eriStartDate" style="background-color: white">
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
               <div class="form-group">
                <input type="text" class="form-control" id="eriEndDate" style="background-color: white">
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" id="eriStartTime" style="background-color: white">
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" id="eriEndTime" style="background-color: white">
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
             <button class="get-started-btn ml-auto" onclick="insert()" >전시회 예약등록 신청</button>
          </div>
        </div>
      </div>
    </section>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script>
flatpickr('#eriStartDate', {
	enableTime: true,
	time_24hr: true,
	dateFormat: "Y-m-d",
});

flatpickr('#eriEndDate', {
	enableTime: true,
	time_24hr: true,
	dateFormat: "Y-m-d",
});

flatpickr('#eriStartTime', {
	enableTime: true,
	noCalendar: true,
	time_24hr: true,
	dateFormat: "H:i",
});

flatpickr('#eriEndTime', {
	enableTime: true,
	noCalendar: true,
	time_24hr: true,
	dateFormat: "H:i",
});

window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition/' + 8);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var html = '<option>예약 전시회를 선택해 주세요</option>';
			for(var exhibition of res){
				html += '<option value="' + exhibition.eiNum + '">' + exhibition.eiName + '</option>';
			}
			document.querySelector('#exhibitionSelect').innerHTML = html;
		}
	}
	xhr.send();
}

function insert(){
	var param = {
			exhibitionInfo : {
				eiNum : 2
			}
	};
	
	// 전시회(번호) Request Param 으로 넘어온 거 추가 임시로 일단 직접입력
	
	var objs = document.querySelectorAll('input');
	for(obj of objs){
		param[obj.id] = obj.value;
	}
	
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