<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>나의 예약정보</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/user/css/reservation/reservation-info.css">
</head>
<body>
	<div class="container myReservation">
      	<div class="row">
      		<div class="col-lg-5" style="text-align: center;">
      		 	<div class="section-title">
		          <p>진행중 예약</p>
		        </div>
          	</div>
          	<div class="col-lg-7" style="text-align: center;">
          		 <div class="section-title">
		          <p>지난 예약</p>
		        </div>
          	</div>
   		</div>
		<div class="row">
			<div class="col-lg-5" id="leftDiv">
				<table class="table" style="text-align: center">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>전시회명</th>
							<th>예약일</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody id="leftReservation">
					</tbody>
				</table>
          	</div>
			<div class="col-lg-7" id="rightDiv">
				<table class="table" style="text-align: center">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>전시회명</th>
							<th>예약일</th>
							<th>리뷰작성</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody id="rightReservation">
					</tbody>
				</table>
         	</div>
		</div>
		<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center" id="pastPageList">
					</ul>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1" id="leftModal">
      		</div>
      		<div class="col-lg-1" id="rightModal">
          	</div>
		</div>
	</div>
<script src="/resources/user/js/reservation/reservation-info.js"></script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>