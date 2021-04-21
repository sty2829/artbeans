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
	margin-top: 150px;
	height: 1000px;
}
#reviewList > *{
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
		</div>
	</div>	
<script>
var count = 0;
window.onscroll = function(e) {
    if((window.innerHeight + window.scrollY) >= (document.body.offsetHeight+150)) {
        count++;
        getReviews();
    }
};
function getReviews(){
	var xhr = new XMLHttpRequest();
	var uiNum = ${userInfo.uiNum}
	xhr.open('GET', '/reviews?size=6&page=' + count);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			console.log(res);
			for(var review of res.content) {
				console.log(review.rviNum);
				html += '<a href="/views/community/review-view?rviNum=' + review.rviNum + '"';
				html += '<div class="col mb-4">';
				html += '<div class="card">';
				html += '<img src="/resources/assets/img/review/' + review.fiPath +'" class="card-img-top" style="width: 348; max-height: 410px">';
				html += '<div class="card-body">';
				html += '<h5 class="card-title">' + review.rviTitle +'</h5>';
				html += '<p class="card-text"><small class="text-muted">소제목입니다</small></p>';
				html += '<span style="color:#0787b1">' + review.date + '</span><span style="float:right;"> '+ review.uiEmail + '</span>';
				html += '</div>';
				html += '</div>';
				html += '</a>';
			}
			document.querySelector('#reviewList').innerHTML += html;
		}
	}
	xhr.send();
}
window.addEventListener('load', getReviews());
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>