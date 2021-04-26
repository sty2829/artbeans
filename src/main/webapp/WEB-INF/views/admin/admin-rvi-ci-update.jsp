<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--<c:if test="${admin eq null}">
<script>
	alert('운영 관련 접근 불허');
	location.href='/views/login';
</script>
</c:if>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리 페이지</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/admin/board/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/admin/board/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/admin/board/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/admin/board/css/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/admin/board/css/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/admin/board/css/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/admin/board/css/util.css">
<link rel="stylesheet" type="text/css"
	href="/resources/admin/board/css/admin-rvi-ci-update.css">

<!--===============================================================================================-->
</head>
<body>
	

	<div class="limiter1">
		<div class="container-table100">
			<div style="height:300px"></div>
			<div><img src="/resources/admin/img/admin-rvi-ci-update-review.jpg" alt="Image" style="width:700px; height:200px;"></div>
			
			<div class="wrap-table100">
				<div class="table-name">
					리뷰
					<div class="table100 ver2 m-b-110">
						<div class="table100-head">
							<table>
								<thead>  
								    <tr class="row100 head">
										<th class="cell100 column1">리뷰 타이틀</th>
										<th class="cell100 column2">리뷰</th>
									</tr>
								</thead>
							</table>
						</div>

						<div class="table100-body js-pscroll">
							<table>
								<tbody id="tBodyReview">
									<!-- 게시물 들어갈 공간 -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
				
	<div class="limiter2">
		<div class="container-table100">					
			<div class="wrap-table100">
				<div class="table-name">
					커멘트 관리자 페이지
					<div class="table100 ver2 m-b-110">
						<div class="table100-head">
							<table>
								<thead>  
								    <tr class="row100 head">
										<th class="cell100 column1">등록 유저</th>
										<th class="cell100 column2">등록 내용</th>
										<th class="cell100 column3">삭제 버튼</th>
									</tr>
								</thead>
							</table>
						</div>

						<div class="table100-body js-pscroll">
							<table>
								<tbody id="tBody">
									<!-- 게시물 들어갈 공간 -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>


	<!--===============================================================================================-->
	<script src="/resources/admin/board/js/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/admin/board/js/popper.js"></script>
	<script src="/resources/admin/board/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/admin/board/js/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/admin/board/js/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="/resources/admin/board/js/main.js"></script>

	<script>
	
	 
function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
var getValue = getParameterByName("rviNum");
getValue=Number(getValue);

getReviewInfo();
getComment();

function getReviewInfo(){
	let xhr = new XMLHttpRequest();
	xhr.open('GET', '/review/'+getValue); //ReviewController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let review = JSON.parse(xhr.responseText);
			let contentPtag = review.rviContent;
			let cList=contentPtag.split('<figure class="image">');
			let contentPtagImgFirst=contentPtag.indexOf('<figure class="image">');
			let contentPtagImgSecond=contentPtag.indexOf('</figure>');
			
			contentPtag=contentPtag.substring(contentPtagImgFirst,contentPtagImgSecond);
			contentPtag=contentPtag.replace('<figure class="image">','');
			
			let imgTag=contentPtag.replace('">','" style="width: 150px; object-fit: cover;">')
			let html='';
			
			html+='<tr class="row100 body" onclick="">';
			html+='<td class="cell100 columnRe1">'+review.rviTitle+'</td>';
			html+='<td class="cell100 columnRe2">'+imgTag+'</td>';
			html+="</tr>";
	
			document.querySelector('#tBodyReview').innerHTML = html;
			}
		}
	xhr.send();
}
	 
function getComment(){
	let xhr = new XMLHttpRequest();
	xhr.open('GET', '/review/comment/'+getValue); //ReviewController /review/comment/{rviNum}
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = JSON.parse(xhr.responseText);
			console.log(res.content.length);
			let html='';
			if(res.content.length>1){
				for (var comment of res.content) {
					html+='<tr class="row100 body" onclick="">';
					html+='<td class="cell100 column1">'+comment.uiEmail+'</td>';
					html+='<td class="cell100 column2">'+comment.ciContent+'</td>';
					html+='<td class="cell100 column3"><div class="deleteComment" onclick="deleteComment('+comment.ciNum+')">삭제</div></td>';
					html+="</tr>";
				}
			}else if(res.content.length==1){
				html+='<tr class="row100 body" onclick="">';
				html+='<td class="cell100 column1">'+res.content.uiEmail+'</td>';
				html+='<td class="cell100 column2">'+res.content.ciContent+'</td>';
				html+='<td class="cell100 column3"><div class="deleteComment" onclick="deleteComment('+res.content.ciNum+')">삭제</div></td>';
				html+="</tr>";
			}
			
			document.querySelector('#tBody').innerHTML = html;
			}
		}
	xhr.send();
}

function deleteComment(obj){
	let xhr = new XMLHttpRequest();
	xhr.open('GET', '/review/delete/'+obj); //ReviewController /review/delete/{ciNum}
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = JSON.parse(xhr.responseText);
			console.log(obj);
			if(res==0){
				alert('삭제가 완료되었습니다.');
				location.href='/views/admin/admin-rvi-ci-update?rviNum='+getValue;
			}else{
				alert('삭제가 완료되지 않았습니다. 새로고침 후 다시 시도해주세요.');
			}
			}
		}
	xhr.send();
}




</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>