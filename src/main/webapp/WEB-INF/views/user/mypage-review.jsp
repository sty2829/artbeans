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
.myReview{
	margin-top: 150px;
	height: 700px;
}
.card-text{
	font-size: small;
	margin-bottom: 5px;
}
</style>
</head>

<body>
	<div class="container myReview" style="height: 100%">
      	<div class="row">
      		<div class="col-lg-12" style="text-align: center;">
      		 	<div class="section-title">
		          <p>나의 리뷰</p>
		        </div>
          	</div>
   		</div>
		<div class="row d-flex justify-content-center">
			<div class="col-lg-8" >
				<div class="row">
					<div class="col-lg-4">
						<img src="/resources/assets/img/exhibition/12823860910600.png" style="width: 200px; height: 199px">
					</div>
					<div class="col-lg-8">
						<h3 style="margin-top: 10px">공감전시회 너무재밌어요</h3>
						<p style="margin-top: 20px">소제목</p>
						<div style="margin-top: 90px">
						<span style="font-weight: 600;">2021-04-28</span>
						<span class="float-right" style="font-weight: 600; cursor: pointer" onclick="test(this)">삭제</span>
						<span class="float-right mr-3" style="font-weight: 600; cursor: pointer" onclick="test(this)">수정</span>
						</div>
					</div>
				</div>
				<hr>
          	</div>
          	<div class="col-lg-8" >
				<div class="row">
					<div class="col-lg-4">
						<img src="/resources/assets/img/exhibition/12823860910600.png" style="width: 200px; height: 199px">
					</div>
					<div class="col-lg-8">
						<h3 style="margin-top: 20px">공감전시회 너무재밌어요</h3>
						<p style="margin-top: 20px">소제목</p>
						<div style="margin-top: 80px">
						<span style="font-weight: 600;">2021-04-28</span>
						<span class="float-right" style="font-weight: 600;">수정&nbsp;&nbsp;<span>삭제</span></span>
						</div>
					</div>
				</div>
				<hr>
          	</div>
          	<div class="col-lg-8" >
				<div class="row">
					<div class="col-lg-4">
						<img src="/resources/assets/img/exhibition/12823860910600.png" style="width: 200px; height: 199px">
					</div>
					<div class="col-lg-8">
						<h3 style="margin-top: 20px">공감전시회 너무재밌어요</h3>
						<p style="margin-top: 20px">소제목</p>
						<div style="margin-top: 80px">
						<span style="font-weight: 600;">2021-04-28</span>
						<span class="float-right" style="font-weight: 600;">수정</span>
						<span class="float-right" style="font-weight: 600;">수정</span>
						ddd
						</div>
					</div>
				</div>
				<hr>
          	</div>
		</div>
		<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1">
      		</div>
      		<div class="col-lg-1">
          	</div>
		</div>
	</div>
<script>
window.addEventListener('load', getProgressTickets());
window.addEventListener('load', getPastTickets(1));
function getProgressTickets(){
	var xhr = new XMLHttpRequest();
	var uiNum = ${userInfo.uiNum}
	xhr.open('GET', '/ticket/progress/' + uiNum);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
		}
	}
	//xhr.send();
}
function getPastTickets(page){
	var xhr = new XMLHttpRequest();
	var uiNum = ${userInfo.uiNum};
//	xhr.open('GET', url);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
		}
	}
	//xhr.send();
}



function cancel(obj){
	
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
	
	//xhr.send();
	
}
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>