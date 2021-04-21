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
<link href="/resources/assets/css/all.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="/resources/assets/css/clean-blog.css" rel="stylesheet">
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
</style>
<body>
<!-- Page Header -->
  <header class="masthead" data-col="fiPath" style="background-image: url('');">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="post-heading">
            <h1 data-col="rviTitle">Man must explore, and this is exploration at its greatest</h1>
            <h2 class="subheading">Problems look mighty small from 150 miles up</h2>
            <span class="meta" style="display: inline;">Posted by  <span data-col="uiEmail">sim2829</span></span>
            <span class="meta" data-col="date">2021-04-12</span>
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- Post Content -->
  <article>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto" data-col="rviContent">
        </div>
      </div>
    </div>
  </article>
  <div class="container mt-5 mb-5">
  	<div class="row d-flex justify-content-center">
        <div class="col-md-8">
            <div class="shadow p-3 bg-white rounded">
                <div class="d-flex flex-row">
                    <div class="w-100 ml-2 comment-area"> <textarea class="form-control" id="ciContent"></textarea>
                     	<button class="btn btn-secondary btn-block mt-2 post-btn" onclick="saveComment()">댓글등록</button> 
                    </div>
                </div>
                <div id=commentList>
                </div>
            </div>
        </div>
    </div>
  </div>
<script>
window.onload = function(){
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
					col.style = 'background-image: url(\'/resources/assets/img/review/' + res[key] + '\');'
				}else{
					col.innerHTML = res[key];	
				}
				
			}
		}
	}
	xhr.send();
}

function getComment(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/review/comment/' + ${param.rviNum} );
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			var html = '';
			for(var comment of res){
				html += '<div class="d-flex flex-row mt-4">';
				html += '<div class="ml-2 w-100">';
				html += '<div class="d-flex justify-content-between align-items-center">';
				html += '<div class="d-flex flex-row align-items-center"> <span class="font-weight-bold name">' + comment.uiEmail + '</span></div>';
				html += '</div>';
				html += '<p class="user-comment-text text-justify">' + comment.ciContent +'</p>'
				html += '</div>';
				html += '</div>';
			}
			document.querySelector('#commentList').innerHTML = html;
		}
	}
	xhr.send();
}


function saveComment(){
	var uiNum = ${userInfo.uiNum != null ? userInfo.uiNum : 0};
	if(!uiNum){
		alert('댓글을 달려면 로그인을 해주세요');
		return;
	}
	var ciContent = document.querySelector('#ciContent');
	console.log(ciContent.value.trim())
	if(ciContent.value.trim().length < 5){
		alert("최소 5글자 이상 작성해주세요.");
		return;
	}
	
	var param = {
			ciContent : ciContent.value,
			userInfo : {
				uiNum : uiNum
			},
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
				getComment();
			}else{
				alert('댓글작성에 실패하였습니다');
			}
		}
	}
	
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
	
}
window.addEventListener('load', getComment);
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>