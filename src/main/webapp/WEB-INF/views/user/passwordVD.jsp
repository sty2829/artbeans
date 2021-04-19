<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ArtBeans - Login</title>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>
	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>
		<div class="card o-hidden border-0">
			<div class="card-body p-0">
				<div class="text-center">
					<h4 class="h4 text-gray-900 mb-4">비밀번호 찾기</h4>
				</div>

				<div class="form-group">
					<input type="text" class="form-control form-control-user"
						id="uiName" placeholder="인증번호">
					<button type="button" class="btn btn-danger btn-sm"
						onclick="goVD()">확인</button>
					<hr>
				</div>
			</div>
		</div>

	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script>
	function goVD(){
		var uiName = document.querySelector('#uiName');
		if (!uiName.value.trim().length<1) {
			alert('인증번호를 입력해주세요.');
			uiName.focus();
			return;
		}
		
		var xhr = new XMLHttpRequest();
		xhr.open('POST',url);
		xhr.onreadystatechange = function() {
			if (xhr.status ==200 & xhr.readyState ==4) {
				var res = JSON.parse(xhr.responseText);
				console.log(xhr.responseText);
			}
		
	}	
		</script>
</body>
</html>