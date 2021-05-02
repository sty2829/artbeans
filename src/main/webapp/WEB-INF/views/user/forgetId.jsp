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

	<div class="container"
		style="margin-top: 150px; width: 700px; letter-spacing: -2px;">

		<div class="card o-hidden border-0">
			<div class="card-body">
				<h4 class="card-title"
					style="text-align: center; font-weight: bold;">아이디 찾기</h4>
				<hr>
				<br>
				<div class="card-content">
					<input type="text" id="uiName" class="input-control"
						placeholder="이름">
				</div>

				<div class="card-content">
					<input type="text" id="uiPhoneNumber" class="input-control"
						placeholder="휴대폰 번호(-를 반드시 입력해주세요.)">
				</div>

				<div class="card-content">
					<button type="button" class="btn btn-danger" name="button"
						onclick="goCheck()">확인</button>
				</div>

				<div class="card-content">
					<a class="small" href="/views/user/register">회원가입</a> / <a
						class="small" href="/views/user/forgetPwd">비밀번호 찾기</a>
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
				
				var uiNamepattern = /[가-힣]{2,}/;
		  		var uiName = document.querySelector('#uiName');
		  			if(!uiNamepattern.test(uiName.value)){
		  				alert('올바른 이름 형식이 아닙니다.');
		  				uiName.focus();
		  				return;
		  			}
		  			
		  		  var uiPhoneNumber2 = document.querySelector('#uiPhoneNumber');
		          if (uiPhoneNumber2.value.trim().length < 1 ) {
		              alert('휴대폰 번호를 정확히 입력해주세요.');
		              uiPhoneNumber2.focus();
		              return false;            
		           }	
		          
		          var regExp3 = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
		          var uiPhoneNumber = document.querySelector('#uiPhoneNumber');
		          if (!regExp3.test(uiPhoneNumber.value)) {
		 				alert('휴대폰 번호를 확인해주세요.');
		 				return false;
		 			}
		          
				var url = '/user-email?uiPhoneNumber=' + uiPhoneNumber.value;
				var xhr = new XMLHttpRequest();
				xhr.open('POST', url);
				xhr.onreadystatechange = function() {
					if (xhr.readyState ==4) {
						if(xhr.status ==200){
							 console.log(xhr.responseText);
							 var res = JSON.parse(xhr.responseText);
							if(res.uiStatus=='1'){
								alert('회원님의 아이디는' + res.uiEmail +' 입니다.');
								location.href= '/views/user/login';
							}else if(res.uiStatus=='0'){
								alert('존재하지 않는 회원입니다.');
								document.querySelector('#uiName').value = '';
								document.querySelector('#uiPhoneNumber').value = '';
								uiName.focus();
								return;
								}
							}else{ // 아이디나 비번 불일치시 null로 500에러
							alert('이메일과 비밀번호를 다시 확인해주세요.');
							return;
						}
					}
				}
				var param = {
						uiName : document.querySelector('#uiName').value,
						uiPhoneNumber : document.querySelector('#uiPhoneNumber').value
					}
				xhr.setRequestHeader('content-type',
						'application/json;charset=UTF-8');
				xhr.send(JSON.stringify(param));
			}

</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>