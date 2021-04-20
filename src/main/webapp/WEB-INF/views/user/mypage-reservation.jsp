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
<style>
.myReservation{
	margin-top: 200px;
	height: 700px;
}
.card-text{
	font-size: small;
	margin-bottom: 5px;
}
</style>
</head>

<body>
	<div class="container myReservation">
      	<div class="row">
      		<div class="col-lg-6" style="text-align: center;">
      		 	<div class="section-title">
		          <p>진행중 예약</p>
		        </div>
          	</div>
          	<div class="col-lg-6" style="text-align: center;">
          		 <div class="section-title">
		          <p>지난 예약</p>
		        </div>
          	</div>
   		</div>
		<div class="row">
			<div class="col-lg-6" >
				<table class="table" style="text-align: center">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>전시회명</th>
							<th>예약일</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody id="leftReservation">
						<tr>
							<td>왜</td>
							<td>안</td>
							<td>나</td>
							<td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#leftReserv">상세보기</button></td>
						</tr>
						
					</tbody>
				</table>
          	</div>
			<div class="col-lg-6">
				<table class="table" style="text-align: center">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>전시회명</th>
							<th>예약일</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody id="rightReservation">
					</tbody>
				</table>
         	</div>
		</div>
		<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6">
				<nav aria-label="Page navigation example" style="float: right">
				  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				        <span class="sr-only">Previous</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				        <span class="sr-only">Next</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1" id="leftModal">
				<div class="modal fade" id="leftReserv" tabindex="-1" aria-labelledby="whyModal" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="whyModal">Modal title</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        ...
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary">Save changes</button>
				      </div>
				    </div>
				  </div>
				</div>
      		</div>
      		<div class="col-lg-1" id="rightModal">
          	</div>
		</div>
	</div>
<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	var uiNum = ${userInfo.uiNum}
	xhr.open('GET', '/user/ticket/' + uiNum);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var leftTable = '';
			var rightTable = '';
			var leftModal= '';
			var rightModal = '';
			var leftIdx = 1;
			var rightIdx = 1;
			for(var ticket of res){
				var dateTime = new Date(ticket.dateTime);
				var today = new Date();
				if(dateTime.getTime() > today.getTime()){
					//진행중 테이블 
					leftTable += '<tr>';
					leftTable += '<td>' + ticket.piMerchantId + '</td>';
					leftTable += '<td>' + ticket.eiName + '</td>';
					leftTable += '<td>' + ticket.tiDate + '</td>';
					leftTable += '<td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#leftReserv' + leftIdx +'">상세보기</button></td>';
					leftTable += '</tr>';
					//진행중 상세보기 모달
					leftModal += '<div class="modal fade" id="leftReserv' + leftIdx + '" tabindex="-1" aria-hidden="true">'; 
					leftModal += '<div class="modal-dialog">'; 
					leftModal += '<div class="modal-content" style="width: 380px">'; 
					leftModal += '<div class="modal-header">'; 
					leftModal += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'; 
					leftModal += '<span aria-hidden="true">&times;</span>'; 
					leftModal += '</button>'; 
					leftModal += '</div>'; 
					leftModal += '<div class="modal-body">'; 
					leftModal += '<div class="card mb-3">';
					leftModal += '<img src="/resources/assets/img/exhibition/'+ ticket.imgPath + '" class="card-img-top" style="width: 344px; height: 200px">';
					leftModal += '<div class="card-body">';
					leftModal += '<h5 class="card-title">' + ticket.eiName + '</h5>';
					leftModal += '<hr>';
					leftModal += '<p class="card-text">예매번호 : <span>' + ticket.piMerchantId + '</span></p>';
					leftModal += '<p class="card-text">장소 : <span>' + ticket.giName + '</span></p>';
					leftModal += '<p class="card-text">관람일시 : <span>' + ticket.tiDate + '</span> <span>' + ticket.tiTime +'</span></p>';
					leftModal += '<p class="card-text">예매수 : <span>'+ ticket.tiNumber + '</span>장</p>';
					leftModal += '<hr>';
					leftModal += '<button type="button" class="btn btn-outline-danger" style="width: 300px; height: 38px" data-rtiNum="' + ticket.tiNum + '" onclick="cancel(this)">예매취소</button>';
					leftModal += '</div>';
					leftModal += '</div>';
					leftModal += '</div>'; 
					leftModal += '</div>'; 
					leftModal += '</div>'; 
					leftModal += '</div>'; 
					leftIdx++;
				}else{
					//진행중 테이블 
					rightTable += '<tr>';
					rightTable += '<td>' + ticket.piMerchantId + '</td>';
					rightTable += '<td>' + ticket.eiName + '</td>';
					rightTable += '<td>' + ticket.tiDate + '</td>';
					rightTable += '<td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#rightReserv' + rightIdx +'">상세보기</button></td>';
					rightTable += '</tr>';
					//진행중 상세보기 모달
					rightModal += '<div class="modal fade" id="rightReserv' + rightIdx + '" tabindex="-1" aria-hidden="true">'; 
					rightModal += '<div class="modal-dialog">'; 
					rightModal += '<div class="modal-content" style="width: 380px">'; 
					rightModal += '<div class="modal-header">'; 
					rightModal += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'; 
					rightModal += '<span aria-hidden="true">&times;</span>'; 
					rightModal += '</button>'; 
					rightModal += '</div>'; 
					rightModal += '<div class="modal-body">'; 
					rightModal += '<div class="card mb-3">';
					rightModal += '<img src="/resources/assets/img/exhibition/'+ ticket.imgPath + '" class="card-img-top" style="width: 344px; height: 200px">';
					rightModal += '<div class="card-body">';
					rightModal += '<h5 class="card-title">' + ticket.eiName + '</h5>';
					rightModal += '<hr>';
					rightModal += '<p class="card-text">예매번호 : <span>' + ticket.piMerchantId + '</span></p>';
					rightModal += '<p class="card-text">장소 : <span>' + ticket.giName + '</span></p>';
					rightModal += '<p class="card-text">관람일시 : <span>' + ticket.tiDate + '</span> <span>' + ticket.tiTime +'</span></p>';
					rightModal += '<p class="card-text">예매수 : <span>'+ ticket.tiNumber + '</span>장</p>';
					rightModal += '<hr>';
					rightModal += '<button type="button" class="btn btn-outline-primary" onclick="goReview(this)" data-rtiNum="' + ticket.tiNum + '" style="width: 300px; height: 38px">리뷰작성</button>';
					rightModal += '</div>';
					rightModal += '</div>';
					rightModal += '</div>'; 
					rightModal += '</div>'; 
					rightModal += '</div>'; 
					rightModal += '</div>'; 
					rightIdx++;
				}
			}	
			document.querySelector('#leftReservation').innerHTML = leftTable;
			document.querySelector('#rightReservation').innerHTML = rightTable;
			document.querySelector('#leftModal').innerHTML = leftModal;
			document.querySelector('#rightModal').innerHTML = rightModal;
		}
	}
	xhr.send();
}
function cancel(obj){
	var rtiNum = obj.getAttribute('data-tiNum')
	
	var xhr = new XMLHttpRequest();
	
	xhr.open('DELETE', '/ticket/cancel/' + tiNum );

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			if(res){
				alert('예매취소');
				window.location.reload();
			}else{
				alert('예매취소에 실패하였습니다.');
			}
		}
	}
	
	xhr.send();
	
}
function goReview(obj){
	var tiNum = obj.getAttribute('data-tiNum')
	location.href = '/views/user/review/?tiNum=' + tiNum;
}
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>