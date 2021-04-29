<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>나의 리뷰정보</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/user/css/review/review-info.css">
</head>
<body>
	<div class="container myReview">
      	<div class="row">
      		<div class="col-lg-12" style="text-align: center;">
      		 	<div class="section-title">
		          <p>나의 리뷰</p>
		        </div>
          	</div>
   		</div>
		<div class="row d-flex justify-content-center" id="userReviewList">
		</div>
		<div class="row d-flex justify-content-center">
			<div class="col-lg-8" >
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center" id="reviewPageList">
					</ul>
				</nav>
          	</div>
		</div>
	</div>
<script src=/resources/user/js/review/review-info.js></script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>