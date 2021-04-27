<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card-body {
	width: 100%;
}

.card-content {
	text-align: center;
	padding: 3px;
	width: 100%;
	height: 70px;
}

.input-control {
	width: 30%;
	height: 40px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>

	<div class="container"
		style="margin-top: 150px; width: 700px; letter-spacing: -2px;">

		<div class="card o-hidden border-0">
			<div class="card-body">

				<div class="card-body">
					<h4 class="card-title"
						style="text-align: center; font-weight: bold;">인증번호  확인</h4>
						<hr>
					<div class="card-content">
						<input type="text" class="input-control" id="code"
							placeholder="인증번호">
						<button type="button" class="btn btn-outline-danger"
							onclick="goVerify()">확인</button>
					</div>
					<div class="check_font" id="pwd_check"></div>
					<br>
				</div>
			</div>
		</div>
	</div>

	<script>
		function goVerify() {
			var code = document.querySelector('#code');
			console.log(code.value);
			if (code.value.trim().length < 1) {
				alert('인증번호를 입력해주세요.');
				code.focus();
				return;
			}

			var url = '/verificationCode?code=' + code.value;
			var xhr = new XMLHttpRequest();
			xhr.open('GET', url);
			xhr.onreadystatechange = function() {
				if (xhr.status == 200 && xhr.readyState == 4) {
					var res = JSON.parse(xhr.responseText);
					if (res.code == code.value) {
						alert('인증에 성공하였습니다. 비밀번호 변경창으로 이동합니다!');
						location.href = "/views/user/changePwd"
					} else {
						alert('인증번호를 다시 확인해주세요.');
					}
				}
			}
			xhr.send();
		}
	</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>