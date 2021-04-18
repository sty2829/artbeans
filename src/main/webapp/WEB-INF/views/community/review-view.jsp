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
</head>
<style>
.reviewViewMain{
	margin-top: 150px;
}
</style>
<body>
	<!-- Page Content -->
  <div class="container reviewViewMain">

    <div class="row">
      <div class="col-lg-2"></div>

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Title -->
        <h1 class="mt-4 mb-3" data-col="rviTitle" style="text-align: center">제목입니다</h1>

        <!-- Author -->
        <p>작성자: <span data-col="uiEmail">나야나</span> </p>
        
        <hr>
        
        <!-- Date/Time -->
        <p>작성시간: <span data-col="credat">2021-04-12</span></p>

        <hr>
        
        <!-- Post Content -->
		<div data-col="rviContent">
			<p>작성</p>
		</div>

        <hr>

        <!-- Comments Form -->
        
        <div class="card my-4">
          <h5 class="card-header">댓글 작성</h5>
          <div class="card-body">
             <div class="form-group">
               <textarea class="form-control" rows="3" id="ciContent"></textarea>
             </div>
             <button type="button" class="btn btn-primary" onclick="saveComment()">작성</button>
          </div>
        </div>
		
		<div id="commentList">
	        <div class="media mb-4">
	          <div class="media-body">
	            <h5 class="mt-0">댓글작성자</h5>
	            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
	          </div>
	        </div>
        </div>
       <div class="col-lg-2"></div>
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
				col.innerHTML = res[key];
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
				html += '<div class="media mb-4">';
				html += '<div class="media-body">';
				html += '<h5 class="mt-0">' + comment.uiEmail +'</h5>' + comment.ciContent;
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