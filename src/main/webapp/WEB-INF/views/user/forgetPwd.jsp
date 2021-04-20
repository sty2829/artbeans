<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ArtBeans - Login</title>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<style>
.card-body {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
	<main id="main">
		======= Breadcrumbs =======
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>

		<div class="container">

			<div class="card o-hidden border-0"
				style="padding: 8px; height: 300px;">
				<div class="card-body">

					<div class="card-body">
						<h4 class="card-title">비밀번호 찾기</h4>
					</div>

					<div class="card-content" style="padding: 8px">
						<input type="text" class="input-control" id="uiName"
							placeholder="이름">
					</div>
					<div class="card-content" style="padding: 8px">
						<input type="email" class="input-control" id="uiEmail"
							placeholder="이메일">
					</div>

					<div class="card-content" style="padding: 8px">
						<button type="button" style="margin: 8px" 
							class="btn btn-outline-danger" id="checkButton"
							onclick="goUpdate()">확인</button>
						<hr>
					</div>
				</div>
			</div>
		</div>
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>
	</main>
	<script>
		
// 	$("#checkButton").click(function(){
		
// 		var email = $("#checkButton").val();
		
// 		$.ajax({
			
// 			type : "GET",
// 		})
// 	}
		function goUpdate(){
			
			var uiName = document.querySelector('#uiName');
			if (!uiName.value) {
				alert('이름을 입력해주세요.');
				uiName.focus();
				return;
			}

			var uiEmail = document.querySelector('#uiEmail');
			if (!uiEmail.value) {
				alert('이메일을 입력해주세요.');
				uiEmail.focus();
				return;
			}         
				                      
			
				 // console.log(uiEmail.value);
				var url = '/mailCheck?uiEmail'+ uiEmail.value;
				var xhr = new XMLHttpRequest();
				xhr.open('GET', url);
				xhr.onreadystatechange = function() {
					if (xhr.status ==200 & xhr.readyState ==4) {
						var res = JSON.parse(xhr.responseText);
						console.log(xhr.responseText);
						if(xhr.responseText){
							alert('해당 이메일로 인증번호가 전송되었습니다.');
							location.href="/views/user/findPwd";
							
						}else{
							alert('존재하지 않는 사용자입니다.');
						}
					}
				}
				xhr.send();
			}
		</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>