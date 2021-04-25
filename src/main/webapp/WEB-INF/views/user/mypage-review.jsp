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
#userReviewList > * {
	color: black;
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
	var url = '/reviews/user/?size=' + size + '&page='+ (page-1);
	xhr.open('GET', url);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				var html = '';
				if(res.content.length === 0){
					html += '<div class="col-lg-8" >';
					html += '<p style="text-align:center;">등록된 리뷰가 없습니다.</p>';
					html += '</div>';
					html += '';
					html += '';
					document.querySelector('#userReviewList').innerHTML = html;
					return;
				}
				
				for(var review of res.content){
					html += '<div class="col-lg-8">';
					html += '<div class="row">';
					html += '<div class="col-lg-4">';
					html += '<img src="/resources/assets/img/review/' + review.fiPath + '" style="width: 200px; height: 199px">';
					html += '</div>';
					html += '<div class="col-lg-8">';
					html += '<h3 style="margin-top: 10px">' + review.rviTitle + '</h3>';
					html += '<p class="subText" style="margin-top: 20px">' + review.rviContent.replace(/[<][^>]*[>]/gi, "") + '</p>';
					html += '<div style="margin-top: 70px">';
					html += '<span style="font-weight: 600;">' + review.moddat +'</span>';
					html += '<span class="float-right" style="font-weight: 600; color:red; cursor: pointer" onclick="reviewRemove(' + review.rviNum + ')">삭제</span>';
					html += '<span class="float-right mr-3" style="font-weight: 600; color:blue; cursor: pointer" onclick="goReviewUpdate(' + review.rviNum + ')">수정</span>';
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
			  	li += '</li>';
				
				
				document.querySelector('#userReviewList').innerHTML = html;
				document.querySelector('#reviewPageList').innerHTML = li;
			}else{
				var res = JSON.parse(xhr.responseText);
				if(res['trace'].includes('RuntimeException')){
					if(res['message'].includes('로그인')){
						alert(res['message']);
						location.href = '/views/user/login';
						return;
					}
				}
			}
		}
	}
	xhr.send();
}
function goReviewUpdate(rviNum){
	location.href = '/views/community/review-update/?rviNum=' + rviNum;
}
function reviewRemove(rviNum){
	if(confirm("정말 삭제 하시겠습니까 ?")){
		var xhr = new XMLHttpRequest();
		
		xhr.open('DELETE', '/review/' + rviNum );
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				if(res == 1){
					alert('리뷰가 정상 삭제되었습니다.');
					window.location.reload();
					return;
				}
				alert('리뷰가 삭제에 실패하였습니다.');		
			}
		}
		xhr.send();
	}else{
		return;
	}
}
window.addEventListener('load', getUserReviews(1));
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>