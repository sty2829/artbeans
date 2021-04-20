<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-password-image">비밀번호
								재설정</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="title" style="text-align: center">
										<h3>비밀번호 찾기</h3>
										<p>회원가입 시 기입한 항목을 입력해주세요</p>
									</div>
									<div class="form-group">
										<input type="email" class="form-control form-control-user"
											id="uiPwd" aria-describedby="emailHelp" placeholder="비밀번호">
										<input type="password" class="form-control form-control-user"
											id="uiPwd2" aria-describedby="passwordHelp"
											placeholder="새비밀번호">
									</div>
									<a href="/views/login"
										class="btn btn-secondary btn-user btn-block"
										onclick="checkUpdate()">확인</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<script>
function checkUpdate(){
	var uiPwd = document.querySelector('#uiPwd');
	if(uiPwd.value.trim().length<1){
		alert('새 비밀번호를 입력해주세요.');
		uiPwd.focus();
		return;
	}
	
	 var uiPwd2 = document.querySelector('#uiPwd2');
     if (uiPwd2.value.trim().length <1) {
        alert('비밀번호 확인란을 입력해주세요.');
        uiPwd.focus();
        return;
     }
	
	var uiPwd2 = document.querySelector('#uiPwd2');
		if(uiPwd.value!==uiPwd2.value){
			alert('비밀번호가 일치하지 않습니다.')
			uiPwd2.value= "";
			uiPwd.focus();
			return; 
	}
	
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/user-update')
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			console.log(xhr.responseText);
			if(uiPwd == uiPwd2){
				alert('비밀번호가 변경되었습니다.');
			}else {
				alert('비밀번호가 올바르지 않습니다.');
			}
		}	
	}
	var param = {
			uiPwd =document.queryselector('#uiPwd').value,
			uiPwd2 = document.queryselector('#uiPwd2').value
					}
	xhr.setRequestHeader('content-type','application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
}
</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>