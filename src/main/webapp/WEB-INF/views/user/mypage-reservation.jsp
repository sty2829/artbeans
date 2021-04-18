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
}
</style>
</head>

<body>
	<div class="container myReservation" style="height: 100%;">
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
			<div class="col-lg-4" id="leftReservation">
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
			<div class="col-lg-4" id="rightReservation">
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
<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	var uiNum = ${userInfo.uiNum}
	xhr.open('GET', '/user/ticket/' + uiNum);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var leftHtml = '';
			var rightHtml = '';
			for(var ticket of res){
				var dateTime = new Date(ticket.dateTime);
				var today = new Date();
				if(dateTime.getTime() > today.getTime()){
					leftHtml += '<div class="card mb-3">';
					leftHtml += '<img src="/resources/assets/img/exhibition/'+ ticket.imgPath + '" class="card-img-top" style="width: 348px; height: 200px">';
					leftHtml += '<div class="card-body">';
					leftHtml += '<h5 class="card-title">' + ticket.eiName + '</h5>';
					leftHtml += '<hr>';
					leftHtml += '<p class="card-text">예매번호 : <span>' + ticket.piMerchantId + '</span></p>';
					leftHtml += '<p class="card-text">장소 : <span>' + ticket.giName + '</span></p>';
					leftHtml += '<p class="card-text">관람일시 : <span>' + ticket.tiDate + '</span> <span>' + ticket.tiTime +'</span></p>';
					leftHtml += '<p class="card-text">예매수 : <span>'+ ticket.tiNumber + '</span>장</p>';
					leftHtml += '<hr>';
					leftHtml += '<button type="button" class="btn btn-outline-danger" style="width: 300px; height: 38px" data-rtiNum="' + ticket.tiNum + '" onclick="cancel(this)">예매취소</button>';
					leftHtml += '</div>';
					leftHtml += '</div>';  
				}else{
					rightHtml += '<div class="card mb-3">';
					rightHtml += '<img src="/resources/assets/img/exhibition/'+ ticket.imgPath + '" class="card-img-top" style="width: 348px; height: 200px">';
					rightHtml += '<div class="card-body">'; 
					rightHtml += '<h5 class="card-title">' + ticket.eiName + '</h5>';
					rightHtml += '<hr>';
					rightHtml += '<p class="card-text">예매번호 : <span>' + ticket.piMerchantId + '</span></p>';
					rightHtml += '<p class="card-text">장소 : <span>' + ticket.giName + '</span></p>';
					rightHtml += '<p class="card-text">관람일시 : <span>' + ticket.tiDate + '</span> <span>' + ticket.tiTime +'</span></p>';
					rightHtml += '<p class="card-text">예매수 : <span>'+ ticket.tiNumber + '</span>장</p>';
					rightHtml += '<hr>';
					rightHtml += '<button type="button" class="btn btn-outline-primary" onclick="goReview(this)" data-rtiNum="' + ticket.tiNum + '" style="width: 300px; height: 38px">리뷰작성</button>';
					rightHtml += '</div>';
					rightHtml += '</div>';  
				}
			}	
			document.querySelector('#leftReservation').innerHTML = leftHtml;
			document.querySelector('#rightReservation').innerHTML = rightHtml;
		}
	}
	xhr.send();
}
function cancel(obj){
	var rtiNum = obj.getAttribute('data-tiNum')
	
	var xhr = new XMLHttpRequest();
	
	xhr.open('DELETE', '/ticket/cancel/' + tiNum );

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			if(res){
				alert('예매취소');
				window.location.reload();
			}else{
				alert('예매취소에 실패하였습니다.');
			}
		}
	}
	
	xhr.send();
	
}
function goReview(obj){
	var tiNum = obj.getAttribute('data-tiNum')
	location.href = '/views/user/review/?tiNum=' + tiNum;
}
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>