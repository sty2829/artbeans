<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 목록</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script src="/resources/user/js/window/infinityScroll.js"></script>
<script src="/resources/user/js/gallery/galleryList.js"></script>
</head>
<body>

	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 d-flex justify-content-center">
						<ul id="portfolio-flters">
							<li onclick="nameAsc()">이름 오름차순</li>
							<li onclick="nameDesc()">이름 내림차순</li>
							<li onclick="areaAsc()">지역 오름차순</li>
							<li onclick="areaDesc()">지역 내림차순</li>
						</ul>
					</div>
				</div>
			</div>
		</section>


		<section id="blog" class="blog">
			<div class="container">
				<div class="row" id="galleryList"></div>
			</div>
		</section>
	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>