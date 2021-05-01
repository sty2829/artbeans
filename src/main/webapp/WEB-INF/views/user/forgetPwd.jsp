<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ArtBeans - Login</title>
<style>
.card-body {
	text-align: center;
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

			<div class="card o-hidden border-0">
				<div class="card-body">

					<div class="card-body">
						<h4 class="card-title" style="text-align:center; font-weight:bold;">비밀번호 찾기</h4>
						    <div style="color: red">
                        <p>입력된 이메일로 인증번호가 전송됩니다.</p>
                    </div>
                    <hr>

					</div>
					<div class="card-content">
						<input type="email" class="input-control" id="uiEmail"
							placeholder="이메일"><button type="button" 
						class="btn btn-danger" onclick="goVerify()" >확인</button> 
					</div>
						<div class="card-content">
					<a class="small" href="/views/user/register">회원가입</a> / 
					<a class="small" href="/views/user/forgetId">아이디 찾기</a> 
				</div>
					</div>
				</div>
			</div>
		
<br>
	<script>

		function goVerify() {
			 
	    	  var uiEmail2 = document.querySelector('#uiEmail');
	          if (uiEmail2.value.trim().length < 1 ) {
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
					
			var url = "/checkPwd?uiEmail=" +uiEmail.value ;
			var xhr = new XMLHttpRequest();
			xhr.open('POST', url);
			xhr.onreadystatechange = function() {
				if (xhr.status ==200 && xhr.readyState ==4) {
					var res = xhr.responseText;
					if(res == uiEmail.value){
 						alert('해당 이메일로 인증번호를 전송했습니다.');
						location.href="/views/user/findPwd";
					}else{
						alert('이름과 이메일을 다시 입력해주세요.');
					}
				}
			}
			var param = {
				uiEmail : document.querySelector('#uiEmail').value,
			}
			xhr.setRequestHeader('content-type',
					'application/json;charset=UTF-8');
			xhr.send(JSON.stringify(param));
		}
	</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>