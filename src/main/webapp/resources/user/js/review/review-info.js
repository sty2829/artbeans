// 유저 리뷰 정보 JS
const size = 3;
function getUserReviews(page){
	var xhr = new XMLHttpRequest();
	var url = '/reviews/user/?sort=rviNum,desc&size=' + size + '&page='+ (page-1);
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
					html += '<div class="col-lg-8" style="cursor:pointer;" onclick="location.href=\'/views/community/review-view?rviNum=' + review.rviNum + '\'">';
					html += '<div class="row">';
					html += '<div class="col-lg-4">';
					html += '<img src="/upload/' + review.fiPath + '" style="width: 200px; height: 199px">';
					html += '</div>';
					html += '<div class="col-lg-8">';
					html += '<h3 style="margin-top: 10px">' + review.rviTitle + '</h3>';
					html += '<p class="subText" style="margin-top: 20px">' + review.rviContent.replace(/[<][^>]*[>]/gi, "") + '</p>';
					html += '<div style="margin-top: 70px">';
					html += '<span style="font-weight: 600;">수정시간 &nbsp;</span><span>' + review.moddat +'</span>';
					html += '<span class="float-right" style="font-weight: 600; color:red; cursor: pointer" onclick="reviewRemove(' + review.rviNum + ',event)">삭제</span>';
					html += '<span class="float-right mr-3" style="font-weight: 600; color:blue; cursor: pointer" onclick="goReviewUpdate(' + review.rviNum + ',' + review.tiNum + ', event)">수정</span>';
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
function goReviewUpdate(rviNum, tiNum, event){
	event.stopPropagation();
	location.href = '/views/user/review/review-update/?rviNum=' + rviNum + '&tiNum=' + tiNum;
}

function reviewRemove(rviNum, event){
	event.stopPropagation();
	if(confirm("정말 리뷰를 삭제 하시겠습니까 ?")){
		var xhr = new XMLHttpRequest();
		
		xhr.open('DELETE', '/review/' + rviNum );
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				if(res == 1){
					alert('리뷰가 정상 삭제되었습니다.');
					getUserReviews(1);
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
window.addEventListener('load', () => {
	getUserReviews(1);
});