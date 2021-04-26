<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--<c:if test="${admin eq null}">
<script>
	alert('운영 관련 접근 불허');
	location.href='/views/login';
</script>
</c:if>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드 메인</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>
h3 {
	height: 100px;
	font-weight: bold;
}

p {
	height: 50px;
	font-weight: bold;
}

.topImage {
	height: 200px;
}

.top-blank {
	height: 200px;
}

.bottom-blank {
	height: 100px;
}



* {
	box-sizing: border-box;
}

.img_c {
	float: left;
	width: 25%;
	padding: 20px 20px 20px 20px;
	cursor:pointer;
}

.ng::after {
	content: "";
	clear: both;
	display: table;
}

</style>
</head>
<body>
	<div class="top-blank"></div>

	<div>
		<div class="topImage">
			<img src="/resources/admin/img/admin-main.jpg" alt="Image"
				style="display: block; margin: 0px auto;">
		</div>
		<div style="height: 50px;"></div>

		<div class="ng">
			<div class="img_c" onclick="location.href='/views/admin/admin-ei'" >
				<img
					src="/resources/admin/img/admin-page-icon1.jpg"
					style="width: 100%;">
			</div>
			<div class="img_c" onclick="location.href='/views/admin/admin-banner'" >
				<img
					src="/resources/admin/img/admin-page-icon2.jpg"
					style="width: 100%;">
			</div>
			<div class="img_c" onclick="location.href='/views/admin/admin-rvi'">
				<img
					src="/resources/admin/img/admin-page-icon3.jpg"
					style="width: 100%;">
			</div>
			<div class="img_c" onclick="location.href='/views/admin/admin-gi'">
				<img
					src="/resources/admin/img/admin-page-icon4.jpg"
					style="width: 100%;">
			</div>
		</div>

	</div>

	<div class="bottom-blank"></div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>