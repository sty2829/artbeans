<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>

	<div class="container"
		style="margin-top: 150px; width: 700px; letter-spacing: -2px;">

		<div class="card o-hidden border-0">
			<div class="card-body">

				<div class="card-body">
					<h4 class="card-title"
						style="text-align: center; font-weight: bold;">비밀번호 변경</h4>

					<div class="card-content">
						<input type="text" class="pwd_input" id="uiPwd"
							placeholder="새 비밀번호" disabled="disabled">
					</div>
					<div class="card-content">
						<input type="text" class="pwd_input" id="uiPwd2"
							placeholder="새 비밀번호 확인" disabled="disabled">
					</div>
				</div>
				<div class="card-content">
					<button type="button" class="btn btn-outline-danger"
						onclick="check()">확인</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	function check(){
		var uiPwd = document.querySelector('#uiPwd');
		if(uiPwd.value.trim().length<1){
			alert('비밀번호를 입력해주세요.');
			uiPwd.focus();
			return;
		}
		var uiPwd2 = document.querySelector('#uiPwd2');
		if(uiPwd2.value.trim().length<1){
			alert('새 비밀번호를 입력해주세요.');
			uiPwd2.focus();
			return;
		}
	
		var uiPwd2 = document.querySelector('#uiPwd2');
		if(uiPwd == uiPwd2){
			alert('비밀번호가 일치하지 않습니다.')
			uiPwd.focus();
			return;
		}
	
		var xhr = new XMLHttpRequest();
		xhr.open('POST','/user-update');
		xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			var res = xhr.responseText;
			console.log(res);
			if(uiPwd == uiPwd2){
				alert('비밀번호가 변경되었습니다. 로그인 페이지로 이동합니다.')
				location.href="/views/user/login";
			}else {
				alert('비밀번호 변경에 실패하였습니다. 다시 시도해주세요.');
				}
			}	
		}
		var param = {
					uiPwd =document.queryselector('#uiPwd').value
					}
		xhr.setRequestHeader('content-type','application/json;charset=UTF-8');
		xhr.send(JSON.stringify(param));
		}
	
</script>
</body>
</html>