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
<title>갤러리 관리 페이지</title>
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
	href="/resources/admin/board/css/admin-ei.css"><!--css 같이 쓰는중 -->

<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">

		<div class="container-table100">
			<div class="wrap-table100">

				<div class="table-name">
					갤러리 관리자 페이지
					<div class="table100 ver2 m-b-110">
						<div class="table100-head">
							<table>
								<thead>
									<!--  -->

									<tr class="row100 head">
										<th class="cell100 column1">번호</th>
										<th class="cell100 column2">갤러리 이름</th>
										<th class="cell100 column3">전화번호</th>
										<th class="cell100 column4">갤러리 휴무</th>
										<th class="cell100 column5">홈페이지</th>
										<th class="cell100 column6">상태값</th>
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
						<div class="row2"><!-- 페이징 처리 -->
							<div class="col-lg-6">
								<nav aria-label="Page navigation example" class="col-lg-6-under">
									<ul class="pagination justify-content-center" id="pastPageList">
									</ul>
								</nav>
							</div>
						</div><!-- 페이징처리 -->
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
window.addEventListener('load', getBeforeConfirm(1));

var size = 5; 

function getBeforeConfirm(page){
	let xhr = new XMLHttpRequest();
	//'/board?size=5&page=' + (page-1);
	//xhr.open('GET', '/exhibitions/paging?size=10&page='+(page-1)); //ExhibitionController
	
	xhr.open('GET', '/gallerylist?size=9&sort=giNum,asc&page='+(page-1));
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = JSON.parse(xhr.responseText);
			console.log(res);
			let html='';
			
			for (let gallery of res.content) {
				
				
				html+='<tr class="row100 body" onclick="location.href =\'/views/admin/admin-ei-update?eiNum='+gallery.giNum+'\'">';
				html+='<td class="cell100 column1">'+gallery.giNum+'</td>';
				html+='<td class="cell100 column2">'+gallery.giName+'</td>';
				html+='<td class="cell100 column3">'+gallery.giRphoneNumber+'</td>';
				html+='<td class="cell100 column4">'+gallery.giHoliday+'</td>';
				html+='<td class="cell100 column5">'+gallery.giHomepage+'</td>';
				html+='<td class="cell100 column6">'+gallery.giStatus+'</td>';
				html+="</tr>";
				}
			
			
			let disable = res.first ? 'disabled' : '';
			
			let li = '<li class="page-item ' + disable + '" onclick="getBeforeConfirm(' + res.number + ')">';
			li += '<a class="page-link" href="#" tabindex="-1">이전</a>';
			li += '</li>';
			
			let startPage = Math.floor((((Number(res.number) + 1) - 1) / size)) * size + 1;
			let endPage = startPage + size - 1;
			if(endPage > res.totalPages){
				endPage = res.totalPages;
			}
			for(startPage; startPage<=endPage; startPage++){
				if(startPage === page){
					li += '<li class="page-item active" onclick="getBeforeConfirm(' + startPage + ')"><a class="page-link" href="#">'+ startPage +'</a></li>';
					continue;
				}
				li += '<li class="page-item" onclick="getBeforeConfirm(' + startPage +')"><a class="page-link" href="#">'+ startPage +'</a></li>';
			}
			disable = res.last ? 'disabled' : '';
			li += '<li class="page-item ' + disable +'" onclick="getBeforeConfirm(' + (Number(res.number)+2) +')">';
		    li += '<a class="page-link" href="#">다음</a>';
		  	li += '</li>';
			
			
		  	document.querySelector('#tBody').innerHTML = html;
			document.querySelector('#pastPageList').innerHTML = li;
			
			}
		}
	xhr.send();
}




</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>