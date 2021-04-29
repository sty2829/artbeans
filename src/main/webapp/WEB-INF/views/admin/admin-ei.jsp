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
	href="/resources/admin/board/css/admin-ei.css">

<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">

		<div class="container-table100">
			<div class="wrap-table100">

				<div class="table-name">
					전시회 관리자 페이지
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
						<div class="row2"><!-- 페이징 처리 -->
							<div class="col-lg-6">
								<nav aria-label="Page navigation example" class="col-lg-6-under">
									<ul class="pagination justify-content-center" id="pastPageList">
									</ul>
								</nav>
							</div>
						</div><!-- 페이징처리 -->
						<div class="navbar navbar-light bg-light" ><!-- 검색바 처리 -->
							<div class="form-inline" style="margin-left: auto; margin-right:auto;">
								<select id="eiSelectBox" onchange="showEiStatusSelectBox()">
									<option value="eiName">전시회 이름</option>
									<option value="eiArtist">아티스트</option>
									<option value="eiStatus">전시회 상태값</option>
								</select>
								<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" id="eiNavBar">
								<select id="selectEiStatusConfirm">
									<option value="CANCEL">CANCEL</option>
									<option value="PENDING">PENDING</option>
									<option value="CONFIRM">CONFIRM</option>
								</select>
								<button class="btn btn-outline-success my-2 my-sm-0"
									style="background-color: white; color:red; border-color: red;"
									onclick="eiSearchButton(1)">Search</button>
							</div>
						</div><!-- 검색바 처리 -->
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

window.addEventListener('load', () => {
	getBeforeConfirm(1);
});

// 검색창 변환시
var eiSelectBox=document.querySelector('#eiSelectBox');
var selectEiStatusConfirm=document.querySelector('#selectEiStatusConfirm');
var eiNavBar = document.querySelector('#eiNavBar');

eiNavBar.style.display='block';
selectEiStatusConfirm.style.display='none';

function showEiStatusSelectBox(){
	if(eiSelectBox.value=='eiStatus'){
		eiNavBar.style.display='none';
		selectEiStatusConfirm.style.display='block';
	}else{
		eiNavBar.style.display='block';
		selectEiStatusConfirm.style.display='none';
	}
}
//검색창 변환시

var size = 5; 

function getBeforeConfirm(page){
	let xhr = new XMLHttpRequest();
	//'/board?size=5&page=' + (page-1);
	//xhr.open('GET', '/exhibitions/paging?size=10&page='+(page-1)); //ExhibitionController
	
	xhr.open('GET', '/exhibitions?status=ALL&size=9&sort=eiNum,asc&page='+(page-1));
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = JSON.parse(xhr.responseText);
			
			let html='';
			
			for (let exhibition of res.content) {
				//console.log(exhibition);
				
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


function eiSearchButton(page){
	let selectValue=document.querySelector('#eiSelectBox').value;
	let searchValue=document.querySelector('#eiNavBar').value;

	let xhr = new XMLHttpRequest();
	//'/board?size=5&page=' + (page-1);
	if(selectValue=='eiName'){
		xhr.open('GET', '/exhibition-search-bar/name?size=10&page='+(page-1)+'&eiName='+searchValue); //ExhibitionController
	}else if(selectValue=='eiArtist'){
		xhr.open('GET', '/exhibition-search-bar/artist?size=10&page='+(page-1)+'&eiArtist='+searchValue); //ExhibitionController
	}else if(selectValue=='eiStatus'){
		xhr.open('GET', '/exhibition-search-bar/status?size=10&page='+(page-1)+'&eiStatus='+selectEiStatusConfirm.value); //ExhibitionController
	}
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = JSON.parse(xhr.responseText);
			let html='';
			
			if(res.content.length==1){
				html+='<tr class="row100 body" onclick="location.href =\'/views/admin/admin-ei-update?eiNum='+res.content.eiNum+'\'">';
				html+='<td class="cell100 column1">'+res.content[0].eiNum+'</td>';
				html+='<td class="cell100 column2">'+res.content[0].eiName+'</td>';
				html+='<td class="cell100 column3">'+res.content[0].eiArtist+'</td>';
				html+='<td class="cell100 column4">'+res.content[0].eiStartDate+'</td>';
				html+='<td class="cell100 column5">'+res.content[0].eiEndDate+'</td>';
				html+='<td class="cell100 column6">'+res.content[0].eiStatus+'</td>';
				html+='<td class="cell100 column7">'+res.content[0].moddat+'</td>';
				html+="</tr>";
			}else if(res.content.length>1){
				for(let exhibition of res.content){
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