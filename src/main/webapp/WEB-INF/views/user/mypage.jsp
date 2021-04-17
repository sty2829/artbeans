<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>
.mypage{
	margin-top: 200px;
	height: 1000px
}
</style>
</head>
<body>
	<div class="container mypage">
		<p>${userInfo.uiName}님의 회원정보</p>
		<div>
			<table class="table" id="myInformation">
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

	<script>
		var url = '/user?uiNum=${userInfo.uiNum}';
		window.onload = function() {
			var xhr = new XMLHttpRequest();
			xhr.open('GET', url);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var res = JSON.parse(xhr.responseText);
					var html = '<thead>';
					html += '<tr>';
					html += '<th> 이름</th>';
					html += '<th> 이메일</th>';
					html += '<th> 성별</th>';
					html += '<th> 비밀번호</th>';
					html += '<th> 나이</th>';
					html += '<th> 지역</th>';
					html += '<th> 선호 장르</th>';
					html += '</tr>';
					html += '</thead>';
					html += '<tbody>';
					html += '<tr>';
					html += '<td>' + res.uiName + '</td>';
					html += '<td>' + res.uiEmail + '</td>';
					html += '<td>' + res.uiGender + '</td>';
					html += '<td>' + res.uiPwd + '</td>';
					html += '<td>' + res.uiAge + '</td>';
					html += '<td>' + res.uiRegion + '</td>';
					html += '<td>' + res.uiGenre + '</td>';
					html += '</tr>';
					html += '</tbody>'
					html += '<button type="button"	class="btn btn-outline-danger btn-md btn-block"	onclick="location.href=\'/views/menu/mypage-update?uiNum=${userInfo.uiNum}\'">'
							+ '회원정보 수정' + '</button>' + '<button type="button" class="btn btn-outline-danger btn-md btn-block"	onclick="location.href=\'/views/menu/byebye?uiNum=${userInfo.uiNum}\'">'
							+ '회원 탈퇴' + '</button>';
							
					document.querySelector('#myInformation').innerHTML = html;
				}
			}
			xhr.send();
		}
	</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>