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
										<th class="cell100 column2">예약 전시회</th>
										<th class="cell100 column3">휴무일</th>
										<th class="cell100 column4">관람등급</th>
										<th class="cell100 column5">러닝타임</th>
										<th class="cell100 column6">예매 시작일</th>
										<th class="cell100 column7">예매 종료일</th>
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
	

window.onload=eriLoad();
eiLoad();

var eiName='';

function eiLoad(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-list'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html='';
			console.log(res.data.exhibitionReservationInfo);
			for (var exhibition of res.data) {
				console.log(exhibition.exhibitionReservationInfo);
				if(exhibition.exhibitionReservationInfo!=null){
					console.log(exhibition.eiName);
					document.querySelector('#eiName').innerHTML = exhibition.eiName;
					}
				}
			}
		}
	xhr.send();
	
}

function eriLoad(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-reservations'); //ExhibitionReservationController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html='';
			console.log(eiName);
			for (var i=0; i<res.length; i++) {
				//(var eri of res)
				var eri=res[i];
				var eriStartDate = eri.eriStartDate;//안 맞는 시간을 맞추기 위한 작업
				eriStartDate=eriStartDate.substring(0,eriStartDate.indexOf('T'));
				
			    var eriEndDate = eri.eriEndDate;
			    eriEndDate=eriEndDate.substring(0,eriEndDate.indexOf('T'));    
				
				html+='<tr class="row100 body" onclick="location.href =\'/views/admin/admin-eri-update?eiNum='+eri.eriNum+'\'">';
				html+='<td class="cell100 column1">'+eri.eriNum+'</td>';
				html+='<td class="cell100 column2" id="eiName"></td>';
				html+='<td class="cell100 column3">'+eri.eriHoliday+'</td>';
				html+='<td class="cell100 column4">'+eri.eriAudienceRating+'</td>';
				html+='<td class="cell100 column5">'+eri.eriRunningTime+'</td>';
				html+='<td class="cell100 column6">'+eriStartDate+'</td>';
				html+='<td class="cell100 column7">'+eriEndDate+'</td>';
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