<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${admin ne null}">
<script>
	location.href='/views/admin/admin-main';
</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 계정 로그인</title>
<style>
.card-body { 
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>
		
		<div class="container">
		
		<div class="card o-hidden border-0" style="padding: 8px; height: 350px;">
			<div class="card-body">
				<h3 class="card-title" style="text-align:center">관리자 로그인</h3>

				<div class="card-content" style="padding: 8px">
					<input type="text" class="input-control"
						id="adId" placeholder="관리자 아이디">
				</div>

				<div class="card-content" style="padding: 8px">
					<input type="password" class="input-control"
						id="adPwd" placeholder="관리자 비밀번호">
				</div>
				
				<div class="card-content" style="padding: 8px">
					<button type="button" class="btn btn-danger" onclick="goLogin()">로그인</button>
				</div>

				
			</div>
		</div>
		</div>
	</main>

	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>
	</main>
	<script>
		function goLogin() {

		var adId = document.querySelector('#adId');
			if (adId.value.trim().length < 1) {
				alert('관리자 아이디을 입력해주세요.');
				adId.focus();
				return;
			}

			var adPwd = document.querySelector('#adPwd');
			if (adPwd.value.trim().length < 1) {
				alert('비밀번호를 입력해주세요.');
				adPwd.focus();
				return;
			}

			var param = {
				adId : document.querySelector('#adId').value,
				adPwd : document.querySelector('#adPwd').value
			}

			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/admin/login');
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
				
					if (xhr.responseText) {
						var res = JSON.parse(xhr.responseText);

						alert('관리자 로그인 완료');
						location.href = '/views/admin/admin-main';
						return;
					}
					alert('아이디나 비밀번호를 확인해주세요.');
				}
			}
			
			
			xhr.setRequestHeader('content-type','application/json;charset=UTF-8');
			xhr.send(JSON.stringify(param));

		}
	</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>