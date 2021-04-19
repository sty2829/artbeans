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
	href="/resources/admin/board/css/admin-rvi.css">

<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">

		<div class="container-table100">
			<div class="wrap-table100">

				<div class="table-name">
					리뷰 관리자 페이지
					<div class="table100 ver2 m-b-110">
						<div class="table100-head">
							<table>
								<thead>  
								    <tr class="row100 head">
										<th class="cell100 column1">번호</th>
										<th class="cell100 column2">전시회 이름</th>
										<th class="cell100 column3">개시물 내용</th>
										<th class="cell100 column4">회원 번호</th>
										<th class="cell100 column5">작성자 이름</th>
										<th class="cell100 column6">수정날짜</th>
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
	
window.onload= function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/reviews'); //ReviewController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html='';
			
			for (var review of res) {
				let reviewDate = review.moddat;
				let tNum=reviewDate.indexOf('T');
				reviewDate=reviewDate.substring(0,tNum);
				
				let ContentPtag = review.rviContent;
				let cNumLast=ContentPtag.indexOf('</p>');
				
				ContentPtag=ContentPtag.replace('<p>','');
				ContentPtag=ContentPtag.substring(0,cNumLast-3);
				
				html+='<tr class="row100 body" onclick="location.href =\'/views/admin/admin-rvi-ci-update?rviNum='+review.rviNum+'\'">';
				html+='<td class="cell100 column1">'+review.rviNum+'</td>';
				html+='<td class="cell100 column2">'+review.rviTitle+'</td>';
				html+='<td class="cell100 column3">'+ContentPtag+'</td>';
				html+='<td class="cell100 column4">'+review.userInfo.uiNum+'</td>';
				html+='<td class="cell100 column5">'+review.userInfo.uiName+'</td>';
				html+='<td class="cell100 column6">'+reviewDate+'</td>';
				html+="</tr>";
				}
			document.querySelector('#tBody').innerHTML = html;
			}
		}
	xhr.send();
}
	

</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>