<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>
#sidebar {
	width: 300px;
	position: fixed;
	top: 0;
	right: -300px;
	height: 100%;
	z-index: 999;
	background: #c8c8c8;
	color: #fff;
	transition: all 0.3s;
}

#sidebar.active {
	right: 0;
}

.overlay {
	position: fixed;
	width: 100vw;
	height: 100vh;
	background: rgba(0, 0, 0, 0);
	z-index: 998;
	display: none;
}
</style>
</head>
<body>
	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div id="heroCarousel" class="carousel slide carousel-fade"
			data-ride="carousel">
			<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
			<div id="mainSlide" class="carousel-inner" role="listbox">
				<!--         Slide 1
        <div id="mainSlide" class="carousel-item active" style="background-image: url(/resources/assets/img/slide/slide-1.jpg)">-->

			</div>

			<div id="slide" class="carousel-inner" role="listbox"></div>
			<a class="carousel-control-prev" href="#heroCarousel" role="button"
				data-slide="prev"> <span
				class="carousel-control-prev-icon icofont-simple-left"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#heroCarousel" role="button"
				data-slide="next"> <span
				class="carousel-control-next-icon icofont-simple-right"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
		<div class="overlay"></div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= mainList Section ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container">

				<div class="section-title">
					<h2>전시회 목록</h2>
					<p>진행중인 전시회</p>
				</div>

				<div class="row">
					<div class="col-lg-12 d-flex justify-content-center">

						<ul id="portfolio-flters">
							<li data-filter="*" class="filter-active">전체</li>
							<li data-filter=".filter-exhibition">진행중인 전시회</li>
							<li data-filter=".filter-gallery">갤러리</li>
						</ul>

						<div id="wrap">
							<nav id="sidebar"></nav>
							<button id="sidebarCollapse">지도</button>
							</div>
					</div>

				</div>

				<div class="row portfolio-container" id="exhibitionList"></div>
				<div class="overlay"></div>
			</div>

		</section>
		<!-- End mainList Section -->
	</main>


	<script>
		$('#sidebarCollapse').on('click', function() {
			$('#sidebar').addClass('active');
			$('.overlay').fadeIn();
		});

		$('.overlay').on('click', function() {
			$('#sidebar').removeClass('active');
			$('.overlay').fadeOut();
		});
	</script>
	<!-- End #main -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

	<script src="/resources/user/js/exhibition/mainList.js"></script>
	<script src="/resources/user/js/exhibition/slide.js"></script>
</body>

</html>