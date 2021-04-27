<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link href="/resources/assets/css/all.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="/resources/assets/css/clean-blog.css" rel="stylesheet">
<script src="/resources/user/js/user/loginModal.js"></script>
</head>
<style>
.carets {
    height: 17px;
    width: 17px;
    border-radius: 50%;
    background: #9b9b9b;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
    font-size: 12px;
    margin-top: 2px
}

.fs-14 {
    font-size: 14px
}

.form-control {
    width: 100%;
    height: 140px;
    resize: none;
    border: 2px solid #eee
}

.form-control:focus {
    box-shadow: none
}

.form-control:focus .emojis {
    border: 2px solid red
}

.comment-area {
    position: relative
}

.emojis {
    position: absolute;
    list-style: none;
    padding: 10px;
    border: 2px solid #eee;
    border-radius: 36px;
    display: flex;
    top: -25px;
    right: 27px;
    background-color: #fff
}

.emojis li {
    cursor: pointer
}

.post-btn {
    height: 50px;
    font-size: 16px;
    background: #aba9a9;
    border: none
}

.dots {
    height: 6px;
    width: 6px;
    border-radius: 50%;
    background-color: #eee;
    margin-top: 2px;
    margin-left: 5px;
    margin-right: 5px
}

.name i {
    color: red;
    font-size: 13px
}

.time-text {
    font-size: 12px
}

.top-comment {
    background-color: #eee;
    padding: 2px;
    padding-left: 10px;
    padding-right: 10px;
    font-size: 12px;
    border-radius: 40px
}

.user-comment-text {
    font-size: 14px
}

.fs-13 {
    font-size: 13px
}
.card-body { 
	text-align: center;
}
.spanDelete:hover {
	color: red;
}
.spanUpdate:hover {
	color: blue;
}
</style>
<body>
<!-- Page Header -->
  <header class="masthead" data-col="fiPath" style="background-image: url('');">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="post-heading">
            <h1 data-col="rviTitle"></h1>
            <span class="meta" style="display: inline;"><span data-col="uiEmail"></span></span>
            <span class="meta" data-col="moddat"></span>
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- Post Content -->
  <article>
    <div class="container">
      <div class="row d-flex justify-content-center">
        <div class="col-lg-8" data-col="rviContent" style="text-align: center;">
        </div>
      </div>
    </div>
  </article>
  <div class="container mt-5 mb-5">
  	<div class="row d-flex justify-content-center">
        <div class="col-md-7">
            <div class="shadow p-3 bg-white rounded">
                <div id=commentList>
                </div>
                <div>
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center" id="commentPageList">
						</ul>
					</nav>
          		</div>
                <div class="d-flex flex-row">
                	 <c:if test="${userInfo eq null}">
                	 	<div class="w-100 ml-2 comment-area"> 
                	 		<textarea class="form-control" id="ciContent" placeholder="댓글을 작성하려면 로그인이 필요합니다" disabled></textarea>
                     		<button class="btn btn-secondary btn-block mt-2 post-btn" data-toggle="modal" data-target="#loginModal">로그인</button> 
                    	</div>
                	 </c:if>
                	 <c:if test="${userInfo ne null }">
                	 	<div class="w-100 ml-2 comment-area"> 
                	 		<textarea class="form-control" id="ciContent"></textarea>
                     		<button class="btn btn-secondary btn-block mt-2 post-btn" onclick="saveComment()">댓글등록</button> 
                    	</div>
                	 </c:if>
                </div>
            </div>
        </div>
    </div>
  </div>
  
<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="container">
			<div class="card o-hidden border-0" style="padding: 8px; height: 350px;">
				<div class="card-body">
					<h3 class="card-title" style="text-align:center">로그인</h3>
	
					<div class="card-content" style="padding: 8px">
						<input type="text" class="input-control"
							id="uiEmail" placeholder="이메일">
					</div>
	
					<div class="card-content" style="padding: 8px;">
						<input type="password" class="input-control"
							id="uiPwd" placeholder="비밀번호">
					</div>
					
					<div class="card-content" style="padding: 8px">
						<button type="button" class="btn btn-danger" onclick="goLogin()">로그인</button>
					</div>
	
					<div class="card-content">
						<a class="small" href="/views/user/forgetId">아이디 찾기</a> / <a
							class="small" href="/views/user/forgetPwd">비밀번호 찾기</a>
					</div>
					<div class="card-content">
						<a class="small" href="/views/user/register">회원가입</a>
					</div>
				</div>
			</div>
		</div>
      </div>
    </div>
  </div>
</div>
<script>
var uiNum = ${userInfo != null ? userInfo.uiNum : 0 }
function getReview(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/review/' + ${param.rviNum} );
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var cols = document.querySelectorAll('[data-col]');
			for(var col of cols){
				var key = col.getAttribute('data-col');
				if(key === 'fiPath'){
					console.log(res[key]);
					col.style = 'background-image: url(\'/upload/' + res[key] + '\');'
				}else{
					col.innerHTML = res[key];	
				}
				
			}
		}
	}
	xhr.send();
}
const size = 5;
function getComments(page){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/review/comment/' + ${param.rviNum} + '/?size=' + size + '&page='+ (page-1));
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			console.log(res);
			if(res.content.length === 0){
				html += '<div>';
				html += '<p style="text-align:center;">등록된 댓글이 없습니다.</p>';
				html += '</div>';
				document.querySelector('#commentList').innerHTML = html;
				return;
			}
			
			for(var comment of res.content){
				if(uiNum === comment.uiNum){
					html += '<div class="d-flex flex-row mt-2">';
					html += '<div class="ml-2 w-100">';
					html += '<div class="d-flex justify-content-between align-items-center">';
					html += '<div class="d-flex flex-row align-items-center"> <span class="font-weight-bold name">' + comment.uiEmail + '</span></div>';
					html += '</div>';
					html += '<div id="commentDiv'+ comment.ciNum + '">';
					html += '<div id="oDiv'+ comment.ciNum + '">';
					html += '<p class="user-comment-text text-justify">' + comment.ciContent +'</p>'
					html += '<span style="font-size: small;">' + comment.moddat + '</span>';
					html += '<span style="font-size: small; cursor:pointer;" class="float-right ml-3 mr-2 spanDelete" onclick="removeComment(' + comment.ciNum +')">삭제</span>';
					html += '<span style="font-size: small; cursor:pointer;" class="float-right spanUpdate" onclick="reWrite(' + comment.ciNum +')">수정</span>';
					html += '</div>';
					html += '</div>';
					html += '<div id="uDiv'+ comment.ciNum + '" style="display: none;">';
					html += '<div class="w-100 mt-2 comment-area">';
					html += '<textarea class="form-control" id="updateCiContent">' + comment.ciContent + '</textarea>';
					html += '<div class="d-flex justify-content-center">'
					html += '<button type="button" class="btn btn-primary btn-sm mt-2 mr-4" onclick="updateComment( ' + comment.ciNum + ')">댓글수정</button>';
					html += '<button type="button" class="btn btn-danger btn-sm mt-2" onclick="reWrite(' + comment.ciNum + ')">수정 취소</button>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '<hr>';
					html += '</div>';
					html += '</div>';
				}else{
					html += '<div class="d-flex flex-row mt-2">';
					html += '<div class="ml-2 w-100">';
					html += '<div class="d-flex justify-content-between align-items-center">';
					html += '<div class="d-flex flex-row align-items-center"> <span class="font-weight-bold name">' + comment.uiEmail + '</span></div>';
					html += '</div>';
					html += '<p class="user-comment-text text-justify">' + comment.ciContent +'</p>'
					html += '<span style="font-size: small;">' + comment.moddat + '</span>';
					html += '<hr>';
					html += '</div>';
					html += '</div>';
				}
				
			}
			
			var disable = '';
			var clickEvent = 'onclick="getComments(' + res.number + ')"';
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
					li += '<li class="page-item active" onclick="getComments(' + startPage + ')"><a class="page-link">'+ startPage +'</a></li>';
					continue;
				}
				li += '<li class="page-item" onclick="getComments(' + startPage +')"><a class="page-link">'+ startPage +'</a></li>';
			}
			
			disable = '';
			clickEvent = 'onclick="getComments(' + (Number(res.number)+2) + ')"';
			
			if(res.last){
				disable = 'disabled';
				clickEvent = '';
			}
			
			li += '<li class="page-item ' + disable +'" ' + clickEvent + '>';
		    li += '<a class="page-link">다음</a>';
		  	li += '</li>';
		  	
			document.querySelector('#commentList').innerHTML = html;
			document.querySelector('#commentPageList').innerHTML = li;
		}
	}
	xhr.send();
}


function saveComment(){
	var ciContent = document.querySelector('#ciContent');
	if(ciContent.value.trim().length < 5 && ciContent.value.trim().length > 300){
		alert("최소 5글자 이상 300자 이하로 작성해주세요.");
		ciContent.focus();
		return;
	}
	
	var param = {
			ciContent : ciContent.value,
			reviewInfo : {
				rviNum : ${param.rviNum}
			}
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/review/comment');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			if(res >= 1){
				alert('댓글작성 완료');
				getComments();
			}else{
				alert('댓글작성에 실패하였습니다');
			}
		}
	}
	
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
	
}

function updateComment(ciNum){
	var updateCiContent = document.querySelector('#updateCiContent');
	if(updateCiContent.value.trim().length < 5 && updateCiContent.value.trim().length > 300){
		alert("최소 5글자 이상 300자 이하로 작성해주세요.");
		ciContent.focus();
		return;
	}
	
	var param = {
			ciContent : updateCiContent.value,
			ciNum : ciNum
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('PATCH', '/review/comment');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			if(res >= 1){
				alert('댓글수정이 완료되었습니다.');
				getComments();
			}else{
				alert('댓글수정에 실패하였습니다');
			}
		}
	}
	
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
}


function reWrite(ciNum){
	var oDiv = document.querySelector('#oDiv' + ciNum);
	var uDiv = document.querySelector('#uDiv' + ciNum);
	if(oDiv.style.display == 'none'){
		oDiv.style.display = '';
		uDiv.style.display = 'none';
	}else{
		oDiv.style.display = 'none';
		uDiv.style.display = '';
	}
}


function removeComment(ciNum){
	if(confirm("정말 댓글을 삭제 하시겠습니까 ?")){
		var xhr = new XMLHttpRequest();
		xhr.open('DELETE', '/review/comment/' + ciNum);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				if(res >= 1){
					alert('댓글이 삭제 되었습니다.');
					getComments();
				}else{
					alert('댓글이 삭제에 실패하였습니다');
				}
			}
		}
		xhr.send();
	}else{
		return;
	}
}

window.addEventListener('load', getReview);
window.addEventListener('load', () => {
	getComments(1);
});
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>