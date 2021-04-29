<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 리뷰</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/user/css/review/review-list.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
</head>
<body>
	<div class="container reviewListMain" style="height: 100%;">
      	<div class="row">
      		<div class="col-lg-12" style="text-align: center;">
      		 	<div class="section-title">
		          <p>후기 / 추천</p>
		        </div>
          	</div>
   		</div>
   		<div class="row d-flex justify-content-center mb-3">
   			<div class="col-lg-8">
   				<select data-style="btn-primary" data-width="110px" onchange="changeReview(this)">
			      <option value="desc">최신순</option>
			      <option value="asc">오래된순</option>
				 </select>
   			</div>
   		</div>
		<div class="row d-flex justify-content-center" id="reviewList">
		</div>
	</div>
<script src=/resources/user/js/review/review-list.js></script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
</body>
</html>