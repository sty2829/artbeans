<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody id="tBody">
		</tbody>
	</table>
	<nav aria-label="Page navigation example">
  <ul class="pagination" id="pageNumberList">
  	<li class="page-item" onclick="pageCount(this)" id="prev">
      <a class="page-link">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item" data-col="pageNumber"><a class="page-link">1</a></li>
    <li class="page-item" data-col="pageNumber"><a class="page-link">2</a></li>
    <li class="page-item" data-col="pageNumber"><a class="page-link">3</a></li>
    <li class="page-item" onclick="pageCount(this)" id="next">
      <a class="page-link">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
	<script>
		const countPage = 5;
		
		window.addEventListener('load', page(2));
		function page(page){
			
			var url = '/board?size=5&page=' + (page-1); 
			var xhr = new XMLHttpRequest();
			//xhr.open('GET', '/board?size=5&sort=boNum,desc&page=4');
			xhr.open('GET', url);
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var res = JSON.parse(xhr.responseText);
					console.log(res);
					var html = '';
					for(var board of res.content){
						html += '<tr>';
						html += '<td>' + board.boNum + '</td>';
						html += '<td>' + board.boTitle + '</td>';
						html += '<td>' + board.boContent + '</td>';
						html += '</tr>';
					}
					var disable = res.first ? 'disabled' : '';
					var li = '<li class="page-item ' + disable + '" onclick="page(' + res.number + ')">';
					li += '<a class="page-link" href="#" tabindex="-1">이전</a>';
					li += '</li>';
					var startPage = Math.floor((((Number(res.number) + 1) - 1) / countPage)) * countPage + 1;
					var endPage = startPage + countPage - 1;
					if(endPage > res.totalPages){
						endPage = res.totalPages;
					}
					for(startPage; startPage<=endPage; startPage++){
						if(startPage === page){
							li += '<li class="page-item active" onclick="page(' + startPage + ')"><a class="page-link" href="#">'+ startPage +'</a></li>';
							continue;
						}
						li += '<li class="page-item" onclick="page(' + startPage +')"><a class="page-link" href="#">'+ startPage +'</a></li>';
					}
					disable = res.last ? 'disabled' : '';
					li += '<li class="page-item ' + disable +'" onclick="page(' + (Number(res.number)+2) +')">';
				    li += '<a class="page-link" href="#">다음</a>';
				  	li += '</li>';
				    
					
					document.querySelector('#tBody').innerHTML = html;
					document.querySelector('#pageNumberList').innerHTML = li;
				}
			}
			xhr.send();
		}
	</script>
</body>
</html>