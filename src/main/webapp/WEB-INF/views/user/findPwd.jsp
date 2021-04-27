<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<h4 class="card-title" >인증번호 확인</h4>
					
					<div class="card-content" style="padding: 8px">
						<input type="hidden" id="code">
					</div>
					<div class="card-content" style="padding: 8px">
						<input type="text" class="mail_check_input"
							id="code" placeholder="인증번호">
						<button type="button" class="btn btn-outline-danger" onclick="search()">확인</button>
					</div>
					<div class="check_font" id="pwd_check"></div>
					<br>
					</div>
<!-- 					<div class="card-content" style="padding: 8px"> -->
<!-- 						<input type="text" class="pwd_input" -->
<!-- 							id="uiPwd" placeholder="새 비밀번호" disabled="disabled"> -->
<!-- 					</div> -->
<!-- 					<div class="card-content" style="padding: 8px"> -->
<!-- 						<input type="text" class="pwd_input" -->
<!-- 							id="uiPwd2" placeholder="새 비밀번호 확인" disabled="disabled" > -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="card-content" style="padding: 8px"> -->
<!-- 					<button type="button" style="margin: 8px" -->
<!-- 						class="btn btn-outline-danger" onclick="check()">확인</button> -->

<!-- 				</div> -->
</div>
	</div>
</div>
	</main>

	<script>
	
	function search(){
		var checkBox = document.querySelector('#code').value;
// 		var checkBox = document.getElementsByClassName("mail_check_input").value;
		if(checkBox.value.trim().length<1){
			alert('인증번호를 입력해주세요.');
			checkBox.focus();
			return;
		}
		console.log(checkBox.value);
		
		var url = "checkPwd?code=" + code.value;
		var xhr = new XMLHttpRequest();
		xhr.open('GET',url)
		xhr.onreadystatechange = function(){
			if(xhr.status==200 && xhr.readystate==4){
				if(code==checkBox.value) {
					document.querySelector('#pwd_check').innerText = '인증에 성공하였습니다.';	
					document.querySelector('#pwd_check').style.color = 'red';
					document.querySelector('#pwd_check').style.fontSize = "14px"
				}else{
					document.querySelector('#pwd_check').innerText = '인증번호를 다시 확인해주세요.';
					document.querySelector('#pwd_check').style.color = 'red';
					document.querySelector('#pwd_check').style.fontSize = "14px";
				}
			}
		}
		xhr.send();
	}
	
// function check(){
// 	var uiPwd = document.querySelector('#uiPwd');
// 	if(uiPwd.value.trim().length<1){
// 		alert('비밀번호를 입력해주세요.');
// 		uiPwd.focus();
// 		return;
// 	}
// 	var uiPwd2 = document.querySelector('#uiPwd2');
// 	if(uiPwd2.value.trim().length<1){
// 		alert('새 비밀번호를 입력해주세요.');
// 		uiPwd2.focus();
// 		return;
// 	}
	
// 	var uiPwd2 = document.querySelector('#uiPwd2');
// 	if(uiPwd == uiPwd2){
// 		alert('비밀번호가 일치하지 않습니다.')
// 		uiPwd.focus();
// 		return;
// 	}
	
// 	var xhr = new XMLHttpRequest();
// 	xhr.open('POST','/user-update')
// 	xhr.onreadystatechange = function(){
// 		if(xhr.status==200 && xhr.readyState==4){
// 			var res = xhr.responseText;
// 			console.log(res);
// 			if(uiPwd == uiPwd2){
// 				alert('비밀번호가 변경되었습니다. 로그인 페이지로 이동합니다.')
// 				location.href="/views/user/login";
// 			}else {
// 				alert('비밀번호 변경에 실패하였습니다. 다시 시도해주세요.');
// 			}
// 		}	
// 	}
// 	var param = {
// 			uiPwd =document.queryselector('#uiPwd').value
// 					}
// 	xhr.setRequestHeader('content-type','application/json;charset=UTF-8');
// 	xhr.send(JSON.stringify(param));
// }
</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>