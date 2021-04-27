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

.subText{
	overflow: hidden; 
	text-overflow: ellipsis; 
	display: -webkit-box; 
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical; 
	word-wrap:break-word; 
	line-height: 1.4em; 
	height: 2.8em;
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
	xhr.open('GET', '/reviews?size=6&page=' + count);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var review of res.content) {
				html += '<a href="/views/community/review-view?rviNum=' + review.rviNum + '"';
				html += '<div class="col-lg-8">';
				html += '<div class="row">';
				html += '<div class="col-lg-4">';
				html += '<img src="/upload/' + review.fiPath + '" style="width: 200px; height: 199px">';
				html += '</div>';
				html += '<div class="col-lg-8">';
				html += '<h3 style="margin-top: 10px">' + review.rviTitle +'</h3>';
				html += '<p class="subText" style="margin-top: 20px">' + review.rviContent.replace(/[<][^>]*[>]/gi, "") + '</p>';
				html += '<div style="margin-top: 70px">';
				html += '<span style="font-weight: 600;">' + review.moddat +'</span>';
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
window.addEventListener('load', getReviews);
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>