<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세정보</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hevj9bqhd5"></script>
<script src="/resources/user/js/gallery/view.js"></script>
</head>
<body>
	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Portfolio Details Section ======= -->
		<section id="portfolio-details" class="portfolio-details">
			<div class="container">
				<div class="row" id="exhibition"></div>
			</div>
		</section>
		<section id="contact" class="contact">
			<div class="container">
				<div style="border: 0; margin-left: 50px; width: 90%; height: 300px;" id="map"></div>
			</div>
		</section>
	</main>

	<script>
		var giNum = ${param.giNum}		
	</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>