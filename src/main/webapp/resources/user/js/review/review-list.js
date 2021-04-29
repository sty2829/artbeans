// 커뮤니티 리뷰 리스트 JS
var count = 0;
var sort = 'desc';
window.onscroll = function(e) {
    if((window.innerHeight + window.scrollY) >= (document.body.offsetHeight+120)) {
        count++;
        getReviews(sort);
    }
};
function getReviews(sort){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/reviews?sort=credat,' + sort + '&size=6&page=' + count);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			console.log(res);
			for(var review of res.content) {
				html += '<div class="col-lg-8" style="cursor:pointer;" onclick="location.href=\'/views/community/review-view?rviNum=' + review.rviNum + '\'">';
				html += '<div class="row">';
				html += '<div class="col-lg-4">';
				html += '<img src="/upload/' + review.fiPath + '" style="width: 200px; height: 199px">';
				html += '</div>';
				html += '<div class="col-lg-8">';
				html += '<h3 style="margin-top: 10px">' + review.rviTitle +'</h3>';
				html += '<p class="subText" style="margin-top: 20px">' + review.rviContent.replace(/[<][^>]*[>]/gi, "") + '</p>';
				html += '<div style="margin-top: 70px">';
				html += '<span style="font-weight: 600;">' + review.credat +'</span>';
				html += '<span class="float-right" style="font-weight: 600;">by ' + review.uiEmail + '</span>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '<hr>';
				html += '</div>';
				
			}
			document.querySelector('#reviewList').innerHTML += html;
		}
	}
	xhr.send();
}

function changeReview(obj){
	count = 0;
	document.querySelector('#reviewList').innerHTML = '';
	sort = obj.value;
	getReviews(sort);
};

window.addEventListener('load', () => {
	getReviews(sort);
});
window.addEventListener('load', () => {
	$('select').selectpicker();
});