<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>
.myReservation{
	margin-top: 200px;
	height: 1000px;
}
.card-text{
	font-size: small;
	margin-bottom: 5px;
</style>

</head>

<body>
	<div class="container myReservation">
      	<div class="row">
      		<div class="col-lg-1">
      		</div>
      		<div class="col-lg-4" style="text-align: center;">
      		 	<div class="section-title">
		          <p>진행중 예약</p>
		        </div>
          	</div>
          	<div class="col-lg-1">
      		</div>
          	<div class="col-lg-4" style="text-align: center;">
          		 <div class="section-title">
		          <p>지난 예약</p>
		        </div>
          	</div>
   		</div>
		<div class="row">
			<div class="col-lg-1">
      		</div>
			<div class="col-lg-4">
				<div class="card mb-3">
				  <img src="/resources/assets/img/exhibition/542015988898000.png" class="card-img-top" style="width: 348px; height: 200px">
				  <div class="card-body">
				    <h5 class="card-title">백남준전</h5>
				    <hr>
				    <p class="card-text">예매번호 : <span>12345678</span></p>
				    <p class="card-text">장소 : <span>서울시립미술관</span></p>
				    <p class="card-text">관람일시 : <span>2012-04-12</span> <span>11:00</span></p>
				    <p class="card-text">예매수 : <span>3</span>장</p>
				    <button type="button" class="btn btn-outline-danger" style="width: 300px; height: 38px">예매취소</button>
				  </div>
				</div>
          	</div>
          	<div class="col-lg-1">
      		</div>
			<div class="col-lg-4">
					<div class="card">
					  <img src="/resources/assets/img/exhibition/542015988898000.png" class="card-img-top" style="width: 348px; height: 200px">
					  <div class="card-body">
					    <h5 class="card-title">백남준전</h5>
					    <hr>
					    <p class="card-text">예매번호 : <span>12345678</span></p>
					    <p class="card-text">장소 : <span>서울시립미술관</span></p>
					    <p class="card-text">관람일시 : <span>2012-04-12</span> <span>11:00</span></p>
					    <p class="card-text">예매수 : <span>3</span>장</p>
					    <button type="button" class="btn btn-outline-primary" style="width: 300px; height: 38px">리뷰작성</button>
					  </div>
					</div>
          		</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4">
			</div>
			<div class="col-lg-4">
			</div>
		</div>
<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET',url);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			console.log(xhr.responseText);
			for(var i=0 ;i<res.length;i++){
			var reservationTicketInfo = res[i];
				var html = '';
				html += '<tr>';
				html += '<td>' + reservationTicketInfo.rtiName +'</td>'; 
				html += '<td>' + reservationTicketInfo.rtiDate +'</td>'; 
				html += '<td>' + reservationTicketInfo.rtiTime +'</td>'; 
				html += '<td>' + reservationTicketInfo.rtiNumber +'</td>';  
				html += '</tr>';				
				html += '<button type="button"	class="btn btn-outline-danger btn-md btn-block"	onclick="location.href=">'
					+ '예약 수정' + '</button>';
				html += '<button type="button"	class="btn btn-outline-danger btn-md btn-block"	onclick="location.href=">'
						+ '예약 취소' + '</button>';
				}
					document.querySelector('#myreservation').innerHTML = html;
			}
		}
	//xhr.send();
}
 
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>