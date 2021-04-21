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
	<main id="main">
		======= Breadcrumbs =======
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>

		<div class="container">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body">
				
				<div class="card-body">
					<div class="card-title">인증번호 확인</div>
					<div class="card-title" style="text-align: center">
					</div>
					<div class="card-content" style="padding: 8px">
						<input type="email" class="form-control form-control-user"
							id="uiPwd" placeholder="인증번호">
					</div>
					<div class="card-content" style="padding: 8px">
						<input type="password" class="form-control form-control-user"
							id="uiPwd2" placeholder="인증번호 확인">
					</div>
					<div  class="check_font" id="pwd_check"></div>
				</div>
				<div class="card-content" style="padding: 8px">
					<button type="button" style="margin: 8px"
						class="btn btn-outline-danger" onclick="check()">확인</button>

				</div>
		</div>
	</div>
</div>

	</main>

	<script>
function check(){
	var code = document.querySelector('#uiPwd');
	if(code.value.trim().length<1){
		alert('인증번호를 입력해주세요.');
		code.focus();
		return;
	}
	
	 var code2 = document.querySelector('#uiPwd2');
     if (code2.value.trim().length <1) {
        alert('인증번호 확인란을 입력해주세요.');
        code2.focus();
        return;
     }
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/checkPwd')
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			var res = xhr.responseText;
			console.log(res);
			if(uiPwd == uiPwd2){
				document.querySelector('#pwd_check').innerText = "인증번호가 일치합니다.";
				document.querySelector('#pwd_check').style.color = "red";
			}else {
				document.querySelector('#pwd_check').innerText = "인증번호를 다시 확인해주세요.";
				document.querySelector('#pwd_check').style.color = "red";
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
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>