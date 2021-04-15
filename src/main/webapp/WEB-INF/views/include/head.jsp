<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style>

.headsearchInput {
  height: 2em;
  width: 200px;
  padding: 0 10px;
  border-color: black;
  border-radius: 6px;

}

.headsearchInput::placeholder {
	color: #d2d2d2;
}
#suggestListDiv {
	width: 200px;
	top: 40%;
	position: absolute;
	background: white;
	padding: 0 2px;
	border-radius: 6px;
}

.item {
	height: 2em;
	width: 200px;
	outline: none;
}

.item:hover {
	color: #red;
	background: #dcdcdc;
	
}
.text {
	font-weight: bold;
}

</style>
<jsp:include page="/WEB-INF/views/include/css.jsp"></jsp:include>
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top ">
		<div class="container">
			<!--검 색 창   -->
			<form action="/search" method="get" name="frm" onsubmit="return check('headsearchInput')">
				<div>
					<div>
						<div class="container d-flex align-items-center"">
							<input autocomplete="off" type=text name="keyword"  placeholder="전시관,전시회 검색"
								class="headsearchInput" id="headsearchInput"
								onkeyup="headSuggest(this);">
							<div id="divBtnDelete" style="display: none;">
								<button id="btn_search">검색</button>
							</div>
							<div id="suggestListDiv"></div>
						</div>
					</div>
				</div>
			</form>

			<a href="/views/login" style="float: right"
				class="get-started-btn ml-auto">로그인/회원가입</a>


		</div>
<script>
function check(id){
	if(!document.querySelector('#' + id).value.trim()){
		return false;
	}
	return true;
}
function headSuggest(target){
	if(target.value.trim()==''){
		return hide();		
	}
	
	headSuggestGallery(target);
	
 	if(!target.value.trim()) return;

	console.log(target.value.trim());
	var eKeyword ='?eiName='+ target.value;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-search'+eKeyword);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4&& xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			html = '';
			for(var exhibition of res){
				html +=	'<div class="item">'; 
				html +='<a style="cursor: pointer" onclick="location.href=\'/search?keyword='+ exhibition.eiName +'\'">'+exhibition.eiName+'</a>';
				html +=	'<span class="text"></span>';
				html += '</div>';
			}
			document.querySelector('#suggestListDiv').innerHTML = html;
			show();
			}
	}
	xhr.send();
}


function headSuggestGallery(obj){ 
	if(obj.value.trim()==''){
		return hide();		
	}
	var gKeyword ='?giName='+ obj.value;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-lists'+gKeyword);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4&&xhr.status==200){
			var get = JSON.parse(xhr.responseText);
			
			console.log(get);
			var html ='';
			for(var gallery of get){
			
					html +=	'<div class="item">'; 
					html +='<a style="cursor: pointer" onclick="location.href=\'/search?keyword='+ gallery.giName +'\'">'+gallery.giName+'</a>';
					html +=	'<span class="text"></span>';
					html += '</div>';		
		}
			document.querySelector('#suggestListDiv').innerHTML = html;
			show();
		}
	}
	xhr.send();
}


function hide(){
	var suggestListDiv = document.querySelector('#suggestListDiv');
	suggestListDiv.style.display='none';
}
function show(){
	var suggestListDiv = document.querySelector('#suggestListDiv');
	suggestListDiv.style.display='block';
}
</script>
    <div class="container d-flex align-items-center">
    
      <div onclick="location.href='/'">
      <h1 class="logo" style="cursor: pointer"><img src="/resources/assets/img/logo.png" class="img-fluid" ></h1>
      </div>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">

        <ul>          
          <li class="drop-down"><a href="#">전시회 목록</a>
            <ul>                           
              <li><a href="/views/exhibition/openingList">진행중인 전시회</a></li>
              <li><a href="/views/exhibition/closeList">종료된 전시회</a></li>            
              <li><a href="/views/exhibition/futureList">진행 예정 전시회</a></li>
              <li><a href="/views/exhibition/calendar-list">월별 개봉 전시회</a></li>
            </ul>
          </li>
          
          <li class="active"><a href="/views/gallery/list">전시관 목록</a></li>

          <li class="drop-down"><a href="#">커뮤니티 목록</a>
            <ul>
              <li class="drop-down"><a href="#">공지사항</a>
                <ul>
                  <li><a href="/views/admin/usinghomepage">이용방법</a></li>
                  <li><a href="/views/admin/questions">자주하는 질문</a></li>
                </ul>
              </li>              
              <li><a href="#">후기/추천</a></li>            
            </ul>
          </li>
          
          <li class="drop-down"><a href="#">전시회 등록 및 수정</a>
            <ul>                           
              <li><a href="/views/exhibition/insert">전시회 등록</a></li>
              <li><a href="/views/exhibition/exhibition-update">전시회 수정</a></li> 
              <li><a href="/views/reservation/reservation-insert">전시회 예약 등록</a></li>             
            </ul>
          </li>
        </ul>

      </nav><!-- .nav-menu -->
     </div>
	</header>
	<!-- End Header -->
</body>
</html>