<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>

		<div class="container" style="margin-top:150px; width:700px; letter-spacing:-2px;">
		
		<div class="card o-hidden border-0" >
			<div class="card-body">
					<h4 class="card-title" style="text-align:center; font-weight:bold;" >아이디 찾기</h4>
					<hr>
					<br>	
					<div class="card-content" >
						 <input type="text" id="uiName" class="input-control"
							placeholder="이름">
					</div>

					<div class="card-content" >
						<input type="text" id="uiPhoneNumber" class="input-control"
							placeholder="휴대폰 번호(-를 반드시 입력해주세요.)">
					</div>

					<div class="card-content">
						<button type="button"  class="btn btn-danger" name="button" onclick="goCheck()">확인</button>
					</div>
					
					<div class="card-content">
					<a class="small" href="/views/user/register">회원가입</a> /  
					<a class="small" href="/views/user/forgetPwd">비밀번호 찾기</a>
				</div>
				</div>

			</div>

		</div>

	<br>
<script>
function goCheck(){
	
				var uiName = document.querySelector('#uiName');
				if (uiName.value.trim().length < 1) {
					alert('이름을 입력해주세요.');
					uiName.focus();
					return;
				}

				var uiPhoneNumber = document.querySelector('#uiPhoneNumber');
				if (uiPhoneNumber.value.indexOf('-') == -1
						|| uiPhoneNumber.value.trim().length < 1
						|| uiPhoneNumber.value.trim().length > 13) {
					alert('-를 포함한 13자리 휴대폰 번호를 입력해주세요.');
					uiPhoneNumber.focus();
					return;
				}
				
				var url = '/user-email?uiPhoneNumber=' + uiPhoneNumber.value;
				var xhr = new XMLHttpRequest();
				xhr.open('GET', url);
				xhr.onreadystatechange = function() {
					if (xhr.status ==200 & xhr.readyState ==4) {
							var res = JSON.parse(xhr.responseText);
							if(res){
								alert('회원님의 아이디는' + res.uiEmail +' 입니다.');
								location.href= '/views/user/login'; 
							} else{
								alert('존재하지 않는 사용자입니다.');
							}
						}
					}
			   xhr.send();
			}

</script>
			
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>