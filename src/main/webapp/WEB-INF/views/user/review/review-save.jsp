<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>나의 리뷰 저장</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/user/css/review/review-save.css">
<script src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>
</head>
<body>
      <div class="container reviewSaveMain" style="height: 100%;">
      	<div class="row d-flex justify-content-center">
      		<div class="col-lg-6">
      			<div class="section-title" style="text-align: center;">
		          <p>리뷰 등록</p>
		        </div>
      		</div>
      	</div>
      	<div class="row d-flex justify-content-center">
      		<div class="col-lg-4">
	              <div class="form-group">
				    <label for="fiFile">썸네일 이미지를 올려주세요</label>
				    <input type="file" class="form-control-file" id="fiFile" onchange="changeImg(this)">
				  </div>
	         </div>
	         <div class="col-lg-4">
	         	<img id="fiPath" src="/resources/user/img/default-image.jpg" style="height: 200px; width: 200px; margin-left: 100px">
	         </div>
        </div>
        <div class="row d-flex justify-content-center">
        	<div class="col-lg-8">
        		<label for="rviTitle">제목</label>
			      <input type="text" class="form-control mb-2" id="rviTitle"required>
				  <label for="rviContent">본문</label>
			      <div id="rviContent">내용을 입력해주세요.</div>		      
			      <br>
	              <button class="get-started-btn ml-auto mb-5" onclick="saveReview()" style="width: inherit;">리뷰 등록</button>
        	</div>
        </div>
        <input type="hidden" id="tiNum" value="${param.tiNum}">
     </div>
<script src=/resources/user/js/review/review-save.js></script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>