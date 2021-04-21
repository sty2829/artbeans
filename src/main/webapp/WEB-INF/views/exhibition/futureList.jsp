<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 예정인 목록</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script src="/resources/user/js/window/infinityScroll.js"></script>
<script src="/resources/user/js/exhibition/futureList.js"></script>
</head>
<body>
	<!-- 맨 아래가면 탑가는 버튼 속도 조절해야 됨. -->
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
				 <div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="margin: 5px">날짜순</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<button class="dropdown-item" type="button" onclick="newest()">오픈순</button>
								<button class="dropdown-item" type="button" onclick="deadline()">마감순</button>
							</div>
						</div>
						
						<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="margin: 5px">지역순</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<button class="dropdown-item" type="button" onclick="get()">전체지역</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="서울">서울</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="경기">경기도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="인천">인천</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="강원">강원도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="충청남도">충청남도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="충청북도">충청남도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="전라남도">전라남도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="전라북도">전라북도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="경상북도">경상북도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="경상남도">경상남도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="부산">부산</button>
							</div>
						</div>
						
					
				</div>
			</div>
		</section>
		<!-- 나중에 js에 status 1로 바꾸기 -->
		<section id="blog" class="blog">
			<div class="container">
				<div class="row" id="exhibitionList"></div>
			</div>
		</section>
	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>