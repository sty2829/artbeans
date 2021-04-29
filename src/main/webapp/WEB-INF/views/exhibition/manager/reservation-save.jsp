<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>전시회 등록</title>
<link href="/resources/node_modules/flatpickr/dist/flatpickr.min.css" rel="stylesheet"/>
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
    <section id="contact" class="contact">
      <div class="container reservationSaveMain" style="margin-top: 100px">
    	<div class="row d-flex justify-content-center">
   			<div class="col-lg-10" style="text-align: center;">
				<div class="section-title">
		          <p>전시회 예약등록</p>
		        </div>
   			</div>
   		</div>
        <div class="row d-flex justify-content-center">
          <div class="col-lg-4">
            <div class="info">
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
              <select class="custom-select is-invalid" id="eiNum" name=selectBox onchange="check(this)">
              </select>
              <label class="mt-2"></label>
              <select class="custom-select is-invalid" id="riHoliday" name="selectBox" onchange="check(this)" >
              	<option selected disabled>휴무일을 선택해주세요</option>
              	<option value="1">일요일</option>
              	<option value="2">월요일</option>
              	<option value="3">화요일</option>
              	<option value="4">수요일</option>
              	<option value="5">목요일</option>
              	<option value="6">금요일</option>
              	<option value="7">토요일</option>
              </select>
              <label class="mt-2"></label>
              <select class="custom-select is-invalid" id="riAudienceRating" name="selectBox" onchange="check(this)" >
              	<option selected disabled>관람등급을 선택해주세요</option>
              	<option>전체관람가</option>
              	<option>3세 이상 관람가</option>
              	<option>5세 이상 관람가</option>
              	<option>7세 이상 관람가</option>
              	<option>12세 이상 관람가</option>
              	<option>15세 이상 관람가</option>
              	<option>청소년 관람 불가</option>
              </select>
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
<script src=/resources/user/js/reservation/reservation-save.js></script>    
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>