<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card-body {
	width: 100%;
	text-align:center;
}

.card-content {
	text-align: center;
	padding: 3px;
	width: 100%;
	height: 70px;
}

.input-control {
	width: 30%;
	height: 40px;
}

.timer {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	color: red;
	width: 10% ;
	height: 40px;
}

.small:hover {
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>

	<div class="container"
		style="margin-top: 150px; width: 700px; letter-spacing: -2px;">

		<div class="card o-hidden border-0">
			<div class="card-body">

				<div class="card-body">
					<h4 class="card-title" style="text-align:center; font-weight: bold;">인증번호 확인</h4>
						<div style="color: red">
						<p>해당 이메일로 전송된 인증번호를 입력해주세요.</p>
						</div>
						<hr>
					<div class="card-content">
						<input type="text" class="input-control" id="code"
							placeholder="인증번호">
							<input type="text" class="timer" id="clock" disabled="disabled">
						<button type="button" class="btn btn-outline-danger"
							onclick="goVerify()">확인</button>
					</div>
					<br>
				</div>
			</div>
		</div>
</div>
	<script>
	
	var num = 60 * 3; // 몇분을 설정할지의 대한 변수 선언
    var myVar;
    function time(){
        myVar = setInterval(alertFunc, 1000); 
    }
    time();
 
    function alertFunc() {
        var min = num / 60; 
        min = Math.floor(min);
         
        var sec = num - (60 * min);
 		
        var clock = $('#clock').val(min + ':' + sec);
        
        if(num == 0){
            clearInterval(myVar) // num 이 0초가 되었을 떄 clearInterval로 타이머 종료
           	alert('인증시간이 만료되었습니다. 다시 인증해주시기 바랍니다.');
            location.href="/views/user/findPwd";
        }
        num--;
    }

		function goVerify() {
			var code = document.querySelector('#code');
			if (code.value.trim().length < 1) {
				alert('인증번호를 입력해주세요.');
				code.focus();
				return;
			}

			var url = '/verificationCode?code=' + code.value;
			var xhr = new XMLHttpRequest();
			xhr.open('GET', url);
			xhr.onreadystatechange = function() {
				if (xhr.status==200 && xhr.readyState==4) {
					var res = JSON.parse(xhr.responseText);
					console.log(res.code);
					if (res.code == code.value) {
						alert('인증에 성공하였습니다. 비밀번호 변경창으로 이동합니다!');
						location.href = "/views/user/changePwd?uiNum=" + res.uiNum;
					} else {
						alert('인증번호를 다시 확인해주세요.');
					}
				}
			}
			xhr.send();
		}
	</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>