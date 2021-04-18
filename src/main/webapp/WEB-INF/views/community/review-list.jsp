<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>
.reviewListMain{
	margin-top: 200px;
	height: 1000px;
}
.card-title{
	color: black;
}
</style>
</head>

<body>
	<div class="container reviewListMain" style="height: 100%;">
      	<div class="row">
      		<div class="col-lg-12" style="text-align: center;">
      		 	<div class="section-title">
		          <p>리뷰</p>
		        </div>
          	</div>
   		</div>
		<div class="row row-cols-1 row-cols-md-3" id="reviewList">
		  <div class="col mb-4">
		    <div class="card">
		      <img src="/resources/assets/img/exhibition/12775621709100.jpg" class="card-img-top" style="width: 348; height: 300px">
		      <div class="card-body">
		        <h5 class="card-title">공감본능 다녀온 후기</h5>
		      </div>
		    </div>
		  </div>
		</div>
	</div>	
<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	var uiNum = ${userInfo.uiNum}
	xhr.open('GET', '/reviews');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			console.log(res);
			for(var review of res) {
				console.log(review.rviNum);
				html += '<a href="/views/community/review-view?rviNum=' + review.rviNum + '"';
				html += '<div class="col mb-4">';
				html += '<div class="card">';
				html += '<img src="/resources/assets/img/review/' + review.fileInfo.fiPath +'" class="card-img-top" style="width: 348; height: 300px">';
				html += '<div class="card-body">';
				html += '<h5 class="card-title">' + review.rviTitle +'</h5>';
				html += '</div>';
				html += '</div>';
				html += '</a>';
			}
			document.querySelector('#reviewList').innerHTML = html;
		}
	}
	xhr.send();
}
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>