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
	href="/resources/admin/board/css/admin-gi.css">

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
										<th class="cell100 column6"><img alt="image" 
											src="/resources/admin/img/admin-gi-permission-button.png"
											style="cursor:pointer;" onclick="permissionOnOff()"></th>
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
								<nav class="selectAllStatus">
							총괄 선택 : &nbsp<select onchange="selectAllStatus(this.value)" id="selectBoxAllStatus">
										<option value="BACK">선택해주세요.</option>
										<option value="CANCEL">CANCEL 선택</option>
										<option value="PENDING">PENDING 선택</option>
										<option value="CONFIRM">CONFIRM 선택</option>
									</select>
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

window.addEventListener('load', () => {
	getBeforeConfirm(1);

});

/* 
window.setTimeout(function() {
	selectValueOriginal=document.querySelectorAll('.tdSelectBox');
	for(let i=0; i<selectValueOriginal.length; i++){
		console.log(selectValueOriginal[i].value);
	}
}, 1500); // 2초 후에 함수를 실행시킴

 */
function selectAllStatus(value){
	let tdSelectBoxList=document.querySelectorAll('.tdSelectBox');
	for(let i=0; i<tdSelectBoxList.length; i++){
		tdSelectBoxList[i].value=value;
	}
}

var size = 5; 

function getBeforeConfirm(page){
	let xhr = new XMLHttpRequest();
	xhr.open('GET', '/gallerylist?size=9&sort=giNum,asc&page='+(page-1)); //GalleryController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = JSON.parse(xhr.responseText);
			let html='';
			
			for (let gallery of res.content) {
				let giNameChanged=gallery.giName;
				let giHomepageChanged =gallery.giHomepage;
				if(giNameChanged.length>8){
					giNameChanged=giNameChanged.substring(0,8)+'....';
				}
				if(giHomepageChanged.length>15){
					giHomepageChanged=giHomepageChanged.substring(0,15)+'....';
				}
				
				html+='<tr class="row100 body">';
				html+='<input type="hidden" id="giNum'+gallery.giNum+'" name="giNumHidden" value="'+gallery.giNum+'">';
				html+='<td class="cell100 column1">'+gallery.giNum+'</td>';
				html+='<td class="cell100 column2">'+giNameChanged+'</td>';
				html+='<td class="cell100 column3">'+gallery.giRphoneNumber+'</td>';
				html+='<td class="cell100 column4">'+gallery.giHoliday+'</td>';
				html+='<td class="cell100 column5">'+giHomepageChanged+'</td>';
				html+='<td class="cell100 column6"><select class="tdSelectBox">';
				let selected =' selected';
				let optionValue1='';
				let optionValue2='';
				let optionValue3='';
				if(gallery.giStatus==0){
					optionValue1=selected
				}else if(gallery.giStatus==1){
					optionValue2=selected
				}else if(gallery.giStatus==2){
					optionValue3=selected
				}
				
				html+='<option value="CANCEL" '+optionValue1+'>CANCEL</option>';
				html+='<option value="PENDING" '+optionValue2+'>PENDING</option>';
				html+='<option value="CONFIRM" '+optionValue3+'>CONFIRM</option>';
				html+='</select></td>';
				//html+='<td class="cell100 column6">'+gallery.giStatus+'</td>';
				html+="</tr>";
				}
			
			
			let disable = res.first ? 'disabled' : '';
			
			let li = '<li class="page-item ' + disable + '" onclick="getBeforeConfirm(' + res.number + ')">';
			li += '<a class="page-link" href="#" tabindex="-1" style="color:red;">이전</a>';
			li += '</li>';
			
			let startPage = Math.floor((((Number(res.number) + 1) - 1) / size)) * size + 1;
			let endPage = startPage + size - 1;
			if(endPage > res.totalPages){
				endPage = res.totalPages;
			}
			for(startPage; startPage<=endPage; startPage++){
				if(startPage === page){
					li += '<li class="page-item active" onclick="getBeforeConfirm(' + startPage + ')"><a class="page-link" href="#" " style="color:red; background-color:white;">'+ startPage +'</a></li>';
					continue;
				}
				li += '<li class="page-item" onclick="getBeforeConfirm(' + startPage +')"><a class="page-link" href="#" " style="color:red; background-color:white;">'+ startPage +'</a></li>';
			}
			
			disable = res.last ? 'disabled' : '';
			if(disable!='disabled'){
				li += '<li class="page-item ' + disable +'" onclick="getBeforeConfirm(' + (Number(res.number)+2) +')">';
			    li += '<a class="page-link" href="#" style="color:red; background-color:white;">다음</a>';
			  	li += '</li>';
			}else{
				li += '';
			}
		  	
		  	document.querySelector('#tBody').innerHTML = html;
			document.querySelector('#pastPageList').innerHTML = li;
			
			}
		}
	xhr.send();
}


function permissionOnOff(){
	var paramUpdate=new Array();
	var giNumHiddenList=document.querySelectorAll('input[name="giNumHidden"]');
	var giStatusList=document.querySelectorAll('.tdSelectBox');
	
	for(let i=0; i<giNumHiddenList.length; i++){
		let giStatusForChanging=giStatusList[i].value;
		if(giStatusForChanging=='CANCEL'){
			giStatusForChanging=0;
		}else if(giStatusForChanging=='PENDING'){
			giStatusForChanging=1;
		}else if(giStatusForChanging=='CONFIRM'){
			giStatusForChanging=2;
		}
		paramUpdate.push({
			giNum : giNumHiddenList[i].value,
			giStatus : giStatusForChanging
		});
	}
	
	$.ajax({
	     method: 'POST',
	     url: '/gallery-multiple-update',
	     traditional: true,
	     data: {
	       data: JSON.stringify(paramUpdate)
	     },
	     dataType: 'json',
	     success: function (res) {
	        if (res) {
	          alert('완료 되었습니다');
	          location.href='/views/admin/admin-gi';
	        }
	     }
	   });
}


</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>