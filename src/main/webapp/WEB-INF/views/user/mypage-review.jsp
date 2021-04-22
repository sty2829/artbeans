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
.myReview{
	margin-top: 150px;
	height: 1000px;
}
.card-text{
	font-size: small;
	margin-bottom: 5px;
}
hr{
	border: 0;
    height: 1px;
    background: #ccc;
}
</style>
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
			<div class="col-lg-8" >
				<div class="row">
					<div class="col-lg-4">
						<img src="/resources/assets/img/exhibition/12823860910600.png" style="width: 200px; height: 199px">
					</div>
					<div class="col-lg-8">
						<h3 style="margin-top: 10px">공감전시회 너무재밌어요</h3>
						<p style="margin-top: 20px">소제목</p>
						<div style="margin-top: 90px">
						<span style="font-weight: 600;">2021-04-28</span>
						<span class="float-right" style="font-weight: 600; cursor: pointer" onclick="test(this)">삭제</span>
						<span class="float-right mr-3" style="font-weight: 600; cursor: pointer" onclick="test(this)">수정</span>
						</div>
					</div>
				</div>
				<hr>
          	</div>
          	<div class="col-lg-8" >
				<div class="row">
					<div class="col-lg-4">
						<img src="/resources/assets/img/exhibition/12823860910600.png" style="width: 200px; height: 199px">
					</div>
					<div class="col-lg-8">
						<h3 style="margin-top: 20px">공감전시회 너무재밌어요</h3>
						<p style="margin-top: 20px">소제목</p>
						<div style="margin-top: 80px">
						<span style="font-weight: 600;">2021-04-28</span>
						<span class="float-right" style="font-weight: 600;">수정&nbsp;&nbsp;<span>삭제</span></span>
						</div>
					</div>
				</div>
				<hr>
          	</div>
          	<div class="col-lg-8" >
				<div class="row">
					<div class="col-lg-4">
						<img src="/resources/assets/img/exhibition/12823860910600.png" style="width: 200px; height: 199px">
					</div>
					<div class="col-lg-8">
						<h3 style="margin-top: 20px">공감전시회 너무재밌어요</h3>
						<p style="margin-top: 20px">소제목</p>
						<div style="margin-top: 80px">
						<span style="font-weight: 600;">2021-04-28</span>
						<span class="float-right" style="font-weight: 600;">수정</span>
						<span class="float-right" style="font-weight: 600;">수정</span>
						</div>
					</div>
				</div>
				<hr>
          	</div>
          	
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
<script>
const size = 3;
function getUserReviews(page){
	var xhr = new XMLHttpRequest();
	var uiNum = ${userInfo != null ? userInfo.uiNum : false };
	if(!uiNum){
		alert('로그인이 만료되었습니다. 다시 로그인해주세요.');
		location.href = '/views/user/login';
	}
	
	var url = '/reviews/' + uiNum + '?size=' + size + '&page='+ (page-1);
	xhr.open('GET', url);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			var html = '';
			for(var review of res.content){
				html += '<div class="col-lg-8">';
				html += '<div class="row">';
				html += '<div class="col-lg-4">';
				html += '<img src="/resources/assets/img/review/' + review.fiPath + '" style="width: 200px; height: 199px">';
				html += '</div>';
				html += '<div class="col-lg-8">';
				html += '<h3 style="margin-top: 10px">' + review.rviTitle + '</h3>';
				html += '<p style="margin-top: 20px">소제목</p>';
				html += '<div style="margin-top: 90px">';
				html += '<span style="font-weight: 600;">' + review.date +'</span>';
				html += '<span class="float-right" style="font-weight: 600; cursor: pointer" onclick="reviewRemove(' + review.rviNum + ')">삭제</span>';
				html += '<span class="float-right mr-3" style="font-weight: 600; cursor: pointer" onclick="goReviewUpdate(' + review.rviNum + ')">수정</span>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '<hr>';
				html += '</div>';
			}
			
			var disable = '';
			var clickEvent = 'onclick="getUserReviews(' + res.number + ')"';
			if(res.first){
				disable = 'disabled';
				clickEvent = '';
			}
			
			var li = '<li class="page-item ' + disable + '" ' + clickEvent +'>';
			li += '<a class="page-link" tabindex="-1">이전</a>';
			li += '</li>';
			
			var startPage = Math.floor((((Number(res.number) + 1) - 1) / size)) * size + 1;
			var endPage = startPage + size - 1;
			if(endPage > res.totalPages){
				endPage = res.totalPages;
			}
			for(startPage; startPage<=endPage; startPage++){
				if(startPage === page){
					li += '<li class="page-item active" onclick="getUserReviews(' + startPage + ')"><a class="page-link">'+ startPage +'</a></li>';
					continue;
				}
				li += '<li class="page-item" onclick="getUserReviews(' + startPage +')"><a class="page-link">'+ startPage +'</a></li>';
			}
			
			disable = '';
			clickEvent = 'onclick="getUserReviews(' + (Number(res.number)+2) + ')"';
			
			if(res.last){
				disable = 'disabled';
				clickEvent = '';
			}
			
			li += '<li class="page-item ' + disable +'" ' + clickEvent + '>';
		    li += '<a class="page-link">다음</a>';
		  	li += '</li>';;
			
			
			document.querySelector('#userReviewList').innerHTML = html;
			document.querySelector('#reviewPageList').innerHTML = li;
		}
	}
	xhr.send();
}
function goReviewUpdate(rviNum){
	location.href = '/views/community/review-update/?rviNum=' + rviNum;
}
function reviewRemove(rviNum){
	var xhr = new XMLHttpRequest();
	
	xhr.open('DELETE', '/review/' + rviNum );
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				var res = xhr.responseText;
				console.log(res);
				alert('리뷰가 정상 삭제되었습니다.');
				window.location.reload();
			}else{
				console.log(xhr.responseText);
			}
		}
	}
	
	xhr.send();
	
}
window.addEventListener('load', getUserReviews(1));
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>