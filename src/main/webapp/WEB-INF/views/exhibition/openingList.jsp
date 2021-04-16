<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행중인 전시회 목록</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script src="/resources/user/js/window/infinityScroll.js"></script>
<script src="/resources/user/js/exhibition/openingList.js"></script>
<link rel="stylesheet" href="/resources/user/css/right-menu.css">
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
							<li onclick="newest()">전시회 오픈순</li>
							<li onclick="deadline()">전시회 마감순</li>
						</ul>
						<div id="wrap">
							<nav id="sidebar"></nav>
							<button id="sidebarCollapse">지도</button>
							</div>
					</div>
				</div>
						<div class="overlay"></div>
			</div>
		</section>
		
		<section id="blog" class="blog">
			<div class="container">
				<div class="row" id="exhibitionList"></div>
			</div>
		</section>
	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="/resources/user/js/map/right-menu.js"></script>
</body>
</html>