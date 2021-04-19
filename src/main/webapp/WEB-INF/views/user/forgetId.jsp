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

<title>SB Admin 2 - 가입된 비밀번호 찾기</title>

<!-- Custom fonts for this template-->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
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
					<h4 class="card-title" >아이디 찾기</h4>
						
					<div class="card-content" style="padding: 8px">
						 <input type="text" id="uiName" class="input-control"
							placeholder="이름">
					</div>


					<div class="card-content" style="padding: 8px">
						<input type="text" id="uiPhoneNumber" class="input-control"
							placeholder="휴대폰 번호">
					</div>

					<div class="card-content" style="padding: 8px">
						<button type="button" style="margin: 8px" class="btn btn-outline-danger" name="button" onclick="goCheck()">아이디찾기</button>
					</div>
				</div>

			</div>

		</div>
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>

	</main>
	<script>
function goCheck(){
	
				var uiName = document.querySelector('#uiName');
				if (uiName.value.trim().length < 1) {
					alert('이름을 입력해주세요.');
					uiName.focus();
					return;
				}

				var uiPhoneNumber = document.querySelector('#uiPhoneNumber');
				if (uiPhoneNumber.value.trim().length < 1) {
					alert('휴대폰번호를 입력해주세요.');
					uiPhoneNumber.focus();
					return;
				}
				
				var url = '/user-email?uiPhoneNumber=' + uiPhoneNumber.value;
				var xhr = new XMLHttpRequest();
				xhr.open('GET', url);
				xhr.onreadystatechange = function() {
					if (xhr.status ==200 & xhr.readyState ==4) {
							var res = JSON.parse(xhr.responseText);
							if(res){
								alert('회원님의 아이디는' + res.uiEmail +' 입니다.');
								location.href= '/views/user/login'; 
							} else{
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