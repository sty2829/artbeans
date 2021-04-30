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

.input {
	border: none; 
	border-right: 0px; 
	border-top: 0px; boder-left: 0px; 
	boder-bottom: 0px;  
	font-weight:bold;
	width: 60%;
	height: 30px;
}
</style>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>

	<div class="container"
		style="margin-top: 150px; width: 700px; letter-spacing: -2px;">
		<div style="width:660px; margin:0 auto; margin-bottom:50px;  border:1px solid #b7b7b7; padding-top:50px; border-radius:5px; ">


				<h3 class="h4 text-gray-900 mb-4" style="text-align: center;">${userInfo.uiName}
					님의 상세정보</h3>
				<hr>
				
				<div class="card-content">
				<input type="text" class="input" value="성함" disabled="disabled"><br>
						<input type="text" class="input-control" id="uiName"
						value="${userInfo.uiName}">
				</div>
				
				<div class="card-content">
				<input type="text" class="input" value="이메일" disabled="disabled"><br>
					<input type="email" class="input-control" id="uiEmail"
						value="${userInfo.uiEmail}">
				</div>
				
				<div class="card-content">
				<input type="text" class="input" value="전화번호" disabled="disabled"><br>
					 <input type="text" class="input-control"
						id="uiPhoneNumber" value="${userInfo.uiPhoneNumber}">
				</div>
				
				<div class="card-content">
				<input type="text" class="input" value="비밀번호" disabled="disabled"><br>
					<input type="password" class="input-control" id="uiPwd"
						value="${userInfo.uiPwd}">
				</div>
				
				<div class="card-content">
				<input type="text" class="input" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;font-weight:bold;"
						value="선호 장르" disabled="disabled"><br>
					<select
						style="width: 390px; height:40px; letter-spacing: -1px;"
						id="uiGenre">
						<option value="">선호하는 장르를 선택해주세요</option>
						<option value="서양화" ${userInfo.uiGenre eq "서양화" ? "selected":""}>서양화</option>
						<option value="동양화" ${userInfo.uiGenre eq "동양화" ? "selected":""}>동양화</option>
						<option value="유화" ${userInfo.uiGenre eq "유화" ? "selected":""}>유화</option>
						<option value="조각" ${userInfo.uiGenre eq "조각" ? "selected":""}>조각</option>
						<option value="설치미술" ${userInfo.uiGenre eq "설치미술" ? "selected":""}>설치미술</option>
						<option value="미디어아트"
							${userInfo.uiGenre eq "미디어아트" ? "selected":""}>미디어아트</option>
						<option value="사진" ${userInfo.uiGenre eq "사진" ? "selected":""}>사진</option>
					</select>
					
				</div>
				<div class="card-content">
					<input type="hidden" class="form-control form-control-user"
						id="uiNum" value="${userInfo.uiNum}">
				</div>
				<div class="card-content">
					<button type="button" class="btn btn-outline-danger"
						onclick="goUpdate()">수정</button>
					<button type="button" class="btn btn-outline-danger"
						onclick="goOut()">취소</button>
				</div>
			</div>
		</div>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script>

	

		function goUpdate() {

			var uiName = document.querySelector('#uiName');
			if (uiName.value.trim().length < 1) {
				alert('이름을 입력해주세요.');
				uiName.focus();
				return false;
			}

			var uiNamepattern = /[가-힣]{2,}/;
			var uiName = document.querySelector('#uiName');
			if (!uiNamepattern.test(uiName.value)) {
				alert('올바른 이름 형식이 아닙니다.');
				uiName.focus();
				return;
			}

			var uiEmail2 = document.querySelector('#uiEmail');
			if (uiEmail2.value.trim().length < 1) {
				alert('이메일 주소를 정확히 입력해주세요.');
				uiEmail.focus();
				return false;
			}

			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규표현식
			var uiEmail = document.querySelector('#uiEmail');
			if (!regExp.test(uiEmail.value)) {
				console.log(uiEmail.value);
				alert('올바른 이메일 형식이 아닙니다.');
				return false;
			}

			var uiPwd = document.querySelector('#uiPwd');
			if (uiPwd.value.trim().length < 4) {
				alert('비밀번호를 4글자 입력해주세요.');
				uiPwd.focus();
				return false;
			}

			var regExp4 = /^[a-zA-Z0-9]{4,12}$/;
			var uiPwd = document.querySelector('#uiPwd');
			if (!regExp4.test(uiPwd.value)) {
				alert('비밀번호는 영문 대소문자와 숫자로만 입력해주세요.')
				return false;
			}

			var uiGenre = document.querySelector('#uiGenre');
			if (uiGenre.value.length < 1) {
				alert('장르를 선택해주세요.');
				return;
			}
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/user-update')
			xhr.onreadystatechange = function() {
				if (xhr.status == 200 && xhr.readyState == 4) {
					console.log(xhr.responseText);
					if (xhr.responseText >=1) {
						alert('수정완료되었습니다.');
						return location.href = '/';
					} else {
						alert('수정에 실패하였습니다. 다시 시도해주세요.');
					}
				}
			}
			var param = {
					uiNum : document.querySelector('#uiNum').value,
					uiName : document.querySelector('#uiName').value,
					uiEmail : document.querySelector('#uiEmail').value,
					uiPhoneNumber : document.querySelector('#uiPhoneNumber').value,
					uiPwd : document.querySelector('#uiPwd').value,
					uiGenre : document.querySelector('#uiGenre').value,
					uiAge : '${userInfo.uiAge}',
					uiGender : '${userInfo.uiGender}',
					uiRegion : '${userInfo.uiRegion}',
					uiStatus :  '${userInfo.uiStatus}',
					uiRole : '${userInfo.uiRole}'
				}
			xhr.setRequestHeader('content-type',
					'application/json;charset=UTF-8');
			console.log(JSON.stringify(param));
			xhr.send(JSON.stringify(param));
		}

		function goOut() {
			location.href = '/';
		}
	</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>
</html>