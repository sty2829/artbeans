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
<title>전시회 수정 목록</title>
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
	href="/resources/admin/board/css/main.css">

<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">

		<div class="container-table100">
			<div class="wrap-table100">

				<div class="table-name">
					관리자 페이지
					<div class="table100 ver2 m-b-110">
						<div class="table100-head">
							<table>
								<thead>
									<!--  -->

									<tr class="row100 head">
										<th class="cell100 column1">번호</th>
										<th class="cell100 column2">전시회 이름</th>
										<th class="cell100 column3">아티스트</th>
										<th class="cell100 column4">시작일</th>
										<th class="cell100 column5">종료일</th>
										<th class="cell100 column6">전시회 상태값</th>
										<th class="cell100 column7">수정날짜</th>
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
	<script src="/resources/admin/board/js/admin-exhibition.js"></script>
	<script>

window.onload= function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-list'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html='';
			
			for (var exhibition of res.data) {
				console.log(exhibition);
				html+='<tr class="row100 body" onclick="location.href =\'/views/admin/admin-ei-update?eiNum='+exhibition.eiNum+'\'">';
				html+='<td class="cell100 column1">'+exhibition.eiNum+'</td>';
				html+='<td class="cell100 column2">'+exhibition.eiName+'</td>';
				html+='<td class="cell100 column3">'+exhibition.eiArtist+'</td>';
				html+='<td class="cell100 column4">'+exhibition.eiStartDate+'</td>';
				html+='<td class="cell100 column5">'+exhibition.eiEndDate+'</td>';
				html+='<td class="cell100 column6">'+exhibition.eiStatus+'</td>';
				html+='<td class="cell100 column7">'+exhibition.moddat+'</td>';
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