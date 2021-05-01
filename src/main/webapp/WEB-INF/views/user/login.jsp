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
						id="uiEmail" placeholder="이메일">
				</div>

				<div class="card-content" >
					<input type="password" class="input-control"
						id="uiPwd" placeholder="비밀번호">
				</div>
				
				<div class="card-content" >
					<button type="button" class="btn btn-danger" onclick="goLogin()">LOGIN</button>
				</div>

				<div class="card-content">
					<a class="small" href="/views/user/register">회원가입</a> / 
					<a class="small" href="/views/user/forgetId">아이디 찾기</a> / 
					<a class="small" href="/views/user/forgetPwd">비밀번호 찾기</a>
				</div>
			</div>
		</div>
		</div>
		<br>
	
	

	<script>
		function goLogin() {

			 
	    	 var uiEmail = document.querySelector('#uiEmail');
	          if (uiEmail.value.trim().length < 1 ) {
	             alert('이메일 주소를 정확히 입력해주세요.');
	             uiEmail.focus();
	             return false;            
	          }
	          
	    	 var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규표현식
	         var uiEmail = document.querySelector('#uiEmail');
				if(!regExp.test(uiEmail.value)){
					console.log(uiEmail.value);
					alert('올바른 이메일 형식이 아닙니다.');
					return false;
				}
					
			var uiPwd = document.querySelector('#uiPwd');
			if (uiPwd.value.trim().length < 1) {
				alert('비밀번호를 입력해주세요.');
				uiPwd.focus();
				return;
			}

		    var regExp4 = /^[a-zA-Z0-9]{4,12}$/;
            var uiPwd = document.querySelector('#uiPwd');
            if (!regExp4.test(uiPwd.value)) {
            	alert('비밀번호는 영문 대소문자와 숫자로만 입력해주세요.')
            	return false;
            }
 
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/login');
			xhr.onreadystatechange = function() {
				if (xhr.readyState==4) {
					if(xhr.status==200){
					var res = JSON.parse(xhr.responseText);					
					if (res.uiStatus=='1') {						
						alert('반갑습니다');
						location.href = '/';					
						}else if(res.uiStatus=='0'){
						alert('존재하지 않는 회원입니다. 이메일과 비밀번호를 다시 확인해주세요.');
						document.querySelector('#uiEmail').value = '';
						document.querySelector('#uiPwd').value = '';
						uiEmail.focus();
						return;
						}
					}else{
						alert('비번확인')
					}
					
					}
				}
			var param = {
					uiEmail : document.querySelector('#uiEmail').value,
					uiPwd : document.querySelector('#uiPwd').value
				}
			xhr.setRequestHeader('content-type',
					'application/json;charset=UTF-8');
			xhr.send(JSON.stringify(param));
		}
	</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>