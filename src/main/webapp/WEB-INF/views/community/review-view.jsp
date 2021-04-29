<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 상세</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/user/css/review/review-view.css">
<link href="/resources/assets/css/all.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="/resources/assets/css/clean-blog.css" rel="stylesheet">
</head>
<body>
<!-- Page Header -->
  <header class="masthead" data-col="fiPath" style="background-image: url('');">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="post-heading">
            <h1 data-col="rviTitle"></h1>
            <span class="meta" style="display: inline;">posted by &nbsp;<span data-col="uiEmail"></span></span>
            <span class="meta" data-col="credat"></span>
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
<input type="hidden" id="rviNum" value="${param.rviNum}">
<input type="hidden" id="uiNum" value="${userInfo != null ? userInfo.uiNum : 0 }">
<script src=/resources/user/js/review/review-view.js></script>
<script src="/resources/user/js/user/loginModal.js"></script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>