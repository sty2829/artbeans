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
hr{
	border: 0;
    height: 1px;
    background: #ccc;
}
</style>
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
		<div class="row d-flex justify-content-center" id="reviewList">
		</div>
	</div>	
<script>
var count = 0;
window.onscroll = function(e) {
    if((window.innerHeight + window.scrollY) >= (document.body.offsetHeight+120)) {
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
				html += '<div class="col-lg-8">';
				html += '<div class="row">';
				html += '<div class="col-lg-4">';
				html += '<img src="/resources/assets/img/review/' + review.fiPath + '" style="width: 200px; height: 199px">';
				html += '</div>';
				html += '<div class="col-lg-8">';
				html += '<h3 style="margin-top: 10px">' + review.rviTitle +'</h3>';
				html += '<p style="margin-top: 20px">소제목</p>';
				html += '<div style="margin-top: 90px">';
				html += '<span style="font-weight: 600;">' + review.date +'</span>';
				html += '<span class="float-right" style="font-weight: 600;">by ' + review.uiEmail + '</span>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '<hr>';
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