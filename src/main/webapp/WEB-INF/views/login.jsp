<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<body>
<body class="bg-gradient-danger" style="text-align: center">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
									</div>

									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											id="uiEmail" aria-describedby="emailHelp" placeholder="이메일">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-user"
											id="uiPwd" placeholder="비밀번호">
									</div>

									<button onclick="goLogin()">로그인</button>
									<hr>
									<div class="text-center">
										<a class="small" href="/views/menu/id">아이디 찾기</a> / <a
											class="small" href="/views/menu/password">비밀번호 찾기</a>
									</div>
									<div class="text-center">
										<a class="small" href="/views/register">회원가입</a>
									</div>
									

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>


	</div>
	<script>
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
						var res = JSON.parse(xhr.responseText);
						alert('반갑습니다');
						location.href = '/';
						return;
						}
					alert('아이디나 비밀번호를 확인해주세요.');
					}
				}
			xhr.setRequestHeader('content-type','application/json;charset=UTF-8');
			xhr.send(JSON.stringify(param));
		}
	</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>	
</body>
</html>