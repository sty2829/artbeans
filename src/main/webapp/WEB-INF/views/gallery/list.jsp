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
		<!--
		<section id="portfolio" class="portfolio">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 d-flex justify-content-center">
					
						 <ul id="portfolio-flters"> -->
						 
						 
						 <section id="portfolio" class="portfolio">
						 <div class="container">
						 <div class="row">
						<div class="btn-group">
						
						<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin:5px">
    이름순
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
    <button class="dropdown-item" type="button" onclick="nameAsc()" >오름차순</button>
    <button class="dropdown-item" type="button" onclick="nameDesc()">내림차순</button>
  </div>
</div>
			
  
  <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin:5px">
    지역순
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
    <button class="dropdown-item" type="button" onclick="areaAsc()">전체지역</button>
    <button class="dropdown-item" type="button" onclick="areaDesc()" id="addr1" name="addrValue" value="서울">서울</button>
    <button class="dropdown-item" type="button" onclick="areaDesc()" id="addr2" name="addrValue" value="경기도">경기도</button>
    <button class="dropdown-item" type="button" onclick="areaDesc()" id="addr3" name="addrValue" value="강원도">강원도</button>
    <button class="dropdown-item" type="button" onclick="areaDesc()" id="addr4" name="addrValue" value="충청남도">충청남도</button>
    <button class="dropdown-item" type="button" onclick="areaDesc()" id="addr5" name="addrValue" value="충청북도">충청남도</button>
    <button class="dropdown-item" type="button" onclick="areaDesc()" id="addr6" name="addrValue" value="전라남도">전라남도</button>
    <button class="dropdown-item" type="button" onclick="areaDesc()" id="addr7" name="addrValue" value="전라북도">전라북도</button>
    <button class="dropdown-item" type="button" onclick="areaDesc()" id="addr8" name="addrValue" value="경상북도">경상북도</button>
    <button class="dropdown-item" type="button" onclick="areaDesc()" id="addr9" name="addrValue" value="경상남도">경상남도</button>
    <button class="dropdown-item" type="button" onclick="areaDesc()" id="addr10" name="addrValue" value="부산">부산</button>
   
  </div>
</div>
 <script>
 var giAddress = document.querySelector('[name="addrValue"]:clicked').value;
 console.log(giAddress);

 </script>
</div>
</div>

</section>
						    <!-- 
							<li onclick="nameAsc()">이름 오름차순</li>
							<li onclick="nameDesc()">이름 내림차순</li>
							<li onclick="areaAsc()">지역 오름차순</li>
							<li onclick="areaDesc()">지역 내림차순</li>  
						</ul>
					</div>
				</div>
			</div>
		</section>-->


		<section id="blog" class="blog">
			<div class="container">
				<div class="row" id="galleryList"></div>
			</div>
		</section>
	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>