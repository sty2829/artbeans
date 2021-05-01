<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<title>부트스트랩 테이블</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>
.input-group{
	width:60%;
	margin: 0px auto;
}
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<div style="height:100px"></div>

<div style="height:100px; width:40%; margin: 0px auto; background-color: red; border-radius: 15px; text-align: center; padding-top: 10px; font-size: 50px; color:white; font-weight: bolder; cursor: pointer;"
	onclick="location.href='/views/admin/admin-hidden-page2'">
검색창
</div>

<div style="height:50px"></div>

<div class="input-group" style="width:40%; margin: 0px auto;">
  <input type="text" id="searchValue" class="form-control rounded" placeholder="Search" aria-label="Search"
    aria-describedby="search-addon" />
  <button type="button" class="" onclick="searchSomething(1)" style="color:red; background-color: white; border-color: red;">search</button>
</div>

<div style="height:50px"></div>


<div class="container">
	<table class="table table-striped table-hover" style="table-layout:fixed;">
		<thead> 
			<tr>
				 <th>타이틀</th> 
				 <th>링크</th>
				 <th>설명</th>
			</tr> 
		</thead>
		<tbody id="tBody">
		
		</tbody>
	</table>
</div>
<nav> 
	<ul class="pagination justify-content-center" id="pageList"> 
		
	</ul> 
</nav>


<div style="height:500px"></div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>


<script>

var pageNum;

function searchSomething(frm){
	var textForSearch=document.querySelector('#searchValue').value;
	var xhr = new XMLHttpRequest();
	
	xhr.open('GET','/admin/hidden-search?search='+textForSearch+'&pageNum='+frm);
	xhr.onreadystatechange=function(){
		
		html='';
		
		if(xhr.readyState==4 && xhr.status==200){
			
			var res=JSON.parse(xhr.responseText);
			console.log(res);
			for(var searchResult of res.items){
				var linkFirst = searchResult.link;
				if(linkFirst.length>30){
					linkFirst=linkFirst.substring(0,30);
					linkFirst=linkFirst+'......';
				}
				
				html+='<tr>';
				html+='<td>'+searchResult.title+'</td>'
				html+='<td><a href="'+searchResult.link+'">'+linkFirst+'</a></td>'
				html+='<td>'+searchResult.description+'</td>'
				html+='</tr>';
			}
		}
		
		let li='';
		
		pageNum=frm;
		let disable = pageNum-10<0 ? 'disabled' : '';
		
		li+='<li class="page-item '+disable+'"><a class="page-link" href="#" onclick="searchSomething('+Number(pageNum-10)+')">이전</a></li>';
		li+='<li class="page-item"><a class="page-link" href="#" onclick="searchSomething('+Number(pageNum)+')">'+Number(((pageNum-1)/10)+1)+'</a></li>';
		li+='<li class="page-item"><a class="page-link" href="#" onclick="searchSomething('+Number(pageNum+10)+')">'+Number(((pageNum-1)/10)+2)+'</a></li>';
		li+='<li class="page-item"><a class="page-link" href="#" onclick="searchSomething('+Number(pageNum+20)+')">'+Number(((pageNum-1)/10)+3)+'</a></li>';
		li+='<li class="page-item"><a class="page-link" href="#" onclick="searchSomething('+Number(pageNum+10)+')">다음</a></li>';
		
		document.querySelector('#pageList').innerHTML=li;
		document.querySelector('#tBody').innerHTML=html;
	}
	xhr.send();
}

</script>
</body>
</html>