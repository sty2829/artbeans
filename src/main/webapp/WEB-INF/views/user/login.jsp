<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card-body {
	width: 80%;
}

.card-content {
	text-align: center;
	padding: 3px;
	width: 100%;
	height: 70px;
}

.input-control {
	width: 60%;
	height: 40px;
}

.small:hover {
	font-weight: bold;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>

		<div class="container" style="margin-top:150px; width:700px; letter-spacing:-2px;">
		
		<div class="card o-hidden border-0" >
			<div class="card-body">
				<h4 class="card-title" style="text-align:center; font-weight:bold;">로그인</h4>
				<hr>
				<br>
				<div class="card-content" >
					<input type="text" class="input-control"
						id="uiEmail" placeholder="이메일" value="test1@test.com">
				</div>

				<div class="card-content" >
					<input type="password" class="input-control"
						id="uiPwd" placeholder="비밀번호" value="1234">
				</div>
				
				<div class="card-content" >
					<button type="button" class="btn btn-danger" onclick="goLogin()">LOGIN</button>
				</div>

				<div class="card-content">
					<a class="small" href="/views/user/register">회원가입</a> / 
					<a class="small" href="/views/user/forgetId">아이디 찾기</a> / 
					<a class="small" href="/views/user/forgetPwd">비밀번호 찾기</a>
				</div>
				<div class="card-content">
				</div>
			</div>
		</div>
		</div>
		<br>
	
	

	<script>
	window.addEventListener('load',goLogin);
		function goLogin() {

		var uiEmail = document.querySelector('#uiEmail');
			if (uiEmail.value.trim().length < 1) {
				alert('이메일을 입력해주세요.');
				uiEmail.focus();
				return;
			}

			var uiPwd = document.querySelector('#uiPwd');
			if (uiPwd.value.trim().length < 1) {
				alert('비밀번호를 입력해주세요.');
				uiPwd.focus();
				return;
			}

			var param = {
				uiEmail : document.querySelector('#uiEmail').value,
				uiPwd : document.querySelector('#uiPwd').value
			}

			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/login');
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					console.log(xhr.responseText);
					if (xhr.responseText) {
						console.log(xhr.responseText);
						var res = JSON.parse(xhr.responseText);
						alert('반갑습니다');
						location.href = '/';
						return;
					}
					alert('아이디나 비밀번호를 확인해주세요.');
				}
			}
			xhr.setRequestHeader('content-type',
					'application/json;charset=UTF-8');
			xhr.send(JSON.stringify(param));
		}
	</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>