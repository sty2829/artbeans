<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="form-group" style="text-align:center"> 
<h3>이메일 중복확인</h3>
<hr size="1" width="400">
<br>
<div id="chk">
<input type="email" id="uiEmail" placeholder="이메일" required>
<input type="button" value="중복확인" onclick="search()">
<div class="check_font" id="email_check"></div>
</div>
<br>
<button type="button" id="cancelBtn" onclick="window.close()">취소</button>
</div>

<script>

function search(){
	var uiEmail = document.querySelector('#uiEmail');
	if (uiEmail.value.trim().length < 1) {
		alert('이메일 주소를 입력해주세요.');
		uiEmail.focus();
		return;
	}
	
	console.log(uiEmail.value);
	var url = "/emailCheck?uiEmail="+uiEmail.value;
	var xhr = new XMLHttpRequest();
	xhr.open('GET',url);
	xhr.onreadystatechange = function(){
	if(xhr.status==200 && xhr.readyState==4){
		var res = xhr.responseText;
			console.log(xhr.responseText);
		if(res){
			document.querySelector('#email_check').innerText = ('이미 사용 중인 이메일입니다.');
			document.querySelector('#email_check').style.color = "red";
			document.querySelector('#email_check').style.fontSize = "14px"
		}else{
			document.querySelector('#email_check').innerText = ('사용가능한 이메일입니다.');
			document.querySelector('#email_check').style.color = "red";
			document.querySelector('#email_check').style.fontSize = "14px"
			document.querySelector('#cancelBtn').style.visibility = "hidden";
			}
		}
	}
	xhr.send();
}

</script>
</body>
</html>