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
</style>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>

	<div class="container"
		style="margin-top: 150px; width: 700px; letter-spacing: -2px;">

		<div class="card o-hidden border-0">
			<div class="card-body">
				<h3 class="h4 text-gray-900 mb-4" style="text-align: center;">${userInfo.uiName}
					님의 회원정보</h3>
				<hr>
				<div class="card-contentdd">
					<input type="hidden" class="form-control form-control-user"
						id="uiNum" value="${userInfo.uiNum}">
				</div>

				<div class="card-content">
					<input type="text" class="input-control" id="uiName"
						value="${userInfo.uiName}">
				</div>
				<div class="card-content">
					<input type="email" class="input-control" id="uiEmail"
						value="${userInfo.uiEmail}">
				</div>

				<div class="card-content">
					<input type="password" class="input-control" id="uiPwd"
						value="${userInfo.uiPwd}">
				</div>

				<div class="card-content">
					<select
						style="width: 300px; text-align-last: center; letter-spacing: -1px;"
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
					<button type="button" class="btn btn-outline-danger"
						onclick="goUpdate()">수정</button>
					<button type="button" class="btn btn-outline-danger"
						onclick="goOut()">취소</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script>
			
			function goUpdate(){
				
			var uiName = document.querySelector('#uiName');
			if(uiName.value.trim().length<4) {
				alert('이름을 4글자 이상 입력해주세요.');
				uiName.focus();
				return;
			}
			
			var uiEmail = document.querySelector('#uiEmail');
			if(uiEmail.value.trim().length<4){
				alert('이메일을 4글자 이상 입력해주세요.');
				uiEmail.focus();
				return;
			}
			
			var uiPwd = document.querySelector('#uiPwd');
			if(uiPwd.value.trim().length<4){
				alert('비밀번호를 4글자 이상 입력해주세요.');
				uiPwd.focus();
				return;
			}	
			
			var uiGenre = document.querySelector('#uiGenre');
			if (uiGenre.value.length < 1) {
				alert('장르를 선택해주세요.');
				return; 
			}	
			
			var param = {
					uiNum : document.querySelector('#uiNum').value,
					uiName : document.querySelector('#uiName').value,
					uiEmail : document.querySelector('#uiEmail').value,
					uiPwd : document.querySelector('#uiPwd').value,
					uiGenre : document.querySelector('#uiGenre').value,
					uiAge : '${userInfo.uiAge}',
					uiGender : '${userInfo.uiGender}',
					uiRegion : '${userInfo.uiRegion}'
				}

			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/user-update')
			xhr.onreadystatechange = function() {
				if (xhr.status==200 && xhr.readyState==4) {
					console.log(xhr.responseText);
					
					if(xhr.responseText>0){
						alert('수정완료되었습니다.');
						return location.href= '/';
					} else {
						alert('수정에 실패하였습니다. 다시 시도해주세요.');
						}
					}
				}	
				xhr.setRequestHeader('content-type','application/json;charset=UTF-8');
				xhr.send(JSON.stringify(param));
			}	
			
			function goOut() {
				location.href = '/';
			}

		</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>
</html>