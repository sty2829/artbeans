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
      	<div class="row d-flex justify-content-center">
   			<div class="col-lg-10" style="text-align: center;">
				<div class="section-title">
		          <p>전시회 예약</p>
		        </div>
   			</div>
   		</div>
		<div class="row d-flex justify-content-center">
			<div class="col-lg-5">
                <img class="img-fluid" data-col="imgPath"><br>
          	</div>
			<div class="col-lg-5" style="height: 300px">
				<div id="mycal">
				</div>
			</div>
		</div>
		<div class="row mt-2 d-flex justify-content-center">
			<div class="col-lg-5">
				<div class="row">
					<div class="col-lg-12">
					<h5 class="text-center" data-col="exhibitionName"></h5>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-lg-6 mb-3">
						<h5>기간</h5>
						<span data-col="period"></span>
					</div>
					<div class="col-lg-3 mb-3">
						<h5>예매일자</h5>
						<span data-param="tiDate" data-col="minDate" id="tiDate"></span>
					</div>
					<div class="col-lg-3 mb-3">
						<h5>예매시간</h5>
						<span data-param="tiTime" id="tiTime"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 mb-3">
						<h5>관람연령</h5>
						<span data-col="audienceRating"></span>
					</div>
					<div class="col-lg-6 mb-3">
						<ul class="list-inline">
						  	<li class="list-inline-item">
								<h5>예매수</h5>
							</li>
							<li class="list-inline-item">
								<input type="number" class="form-control" id="tiNumber"  data-param="tiNumber" data-col="maxTicket" onclick="changeNumber(this)" min="0"  value="0"  style="width:130px; height: 30px; text-align: center">
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
						<span data-col="charge" id="charge"></span>
					</div>
					<div class="col-lg-3">
						<h5>합계금액</h5>
						<span data-param="piPrice" id="piPrice">0</span>
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
		</div>
	</div>
	<input type="hidden" data-param="eiNum" id="eiNum" value="${param.eiNum}">
	<input type="hidden" data-param="riNum" id="riNum" data-col="riNum">
<script src="/resources/user/js/reservation/reservation-view.js"></script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>