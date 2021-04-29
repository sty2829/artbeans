/**
 * 
 */
window.addEventListener("load", get);		

function get() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibitions?status=CONFIRM&date=OPENIG&size=9&sort=eiNum,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var idx = 1;
			for (var exhibition of res.content) {
						html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" id="ei' + idx + '">';
						html += '<article class="entry">';
						html += '<div class="entry-img">';
						html += '<img name="imgPath" style="width:400px; cursor:pointer; height:400px" src=\'/upload/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
						html += '</div>';
						html += '<div class="row"><div class="col-sm-10">'
					    html += '<h2 class="entry-title">';
					    html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					    html += '</h2></div>';					
					    html += '<div class="col-sm-2"><a href=\'/upload/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
						html += '<div class="entry-meta">';
						html += '<ul>';
						html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
						html += '</ul>';
					    html += '<ul>';
						html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
						html += '</ul>';
						html += '</div>';
						html += '<div class="entry-content">';
						html += '<div style="HEIGHT: 10pt"></div>';
						html += '<div style="display:none" class="read-more">';
						html += '<input name="checkMap' + idx +  '" type="checkbox" onclick="sideMap(' + idx + ')" value1="' + exhibition.galleryInfo['giAddressX'] + '" value2="' + exhibition.galleryInfo['giAddressY'] + '" value3="' + exhibition.galleryInfo['giName'] + '" value4="' + exhibition.galleryInfo['giAddress'] + '">';
						html += '</div>';
						html += '</div>';
						html += '</article>';
						html += '</div>';
						idx++;
			}
			document.querySelector('#exhibitionList').innerHTML += html;
		}
	}
	xhr.send();
}

function newest() {
	count = 100;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibitions?status=CONFIRM&date=OPENIG&size=100&sort=eiStartDate,asc&page=0'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var idx = 1;
			for (var exhibition of res.content) {				
						html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" id="ei' + idx + '">';
						html += '<article class="entry">';
						html += '<div class="entry-img">';
						html += '<img name="imgPath" style="width:400px; cursor:pointer; height:400px" src=\'/upload/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
						html += '</div>';
						html += '<div class="row"><div class="col-sm-10">';
						html += '<h2 class="entry-title">';
					    html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					    html += '</h2></div>';					
					    html += '<div class="col-sm-2"><a href=\'/upload/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
						html += '<div class="entry-meta">';
						html += '<ul>';
						html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
						html += '</ul>';
					    html += '<ul>';
						html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
						html += '</ul>';
						html += '</div>';
						html += '<div class="entry-content">';
						html += '<div style="HEIGHT: 10pt"></div>';
						html += '<div style="display:none" class="read-more">';
						html += '<input name="checkMap' + idx +  '" type="checkbox" onclick="sideMap(' + idx + ')" value1="' + exhibition.galleryInfo['giAddressX'] + '" value2="' + exhibition.galleryInfo['giAddressY'] + '" value3="' + exhibition.galleryInfo['giName'] + '">';
						html += '</div>';
						html += '</div>';
						html += '</article>';
						html += '</div>';
						idx++;
			}
			document.querySelector('#exhibitionList').innerHTML = html;
		}
	}
	xhr.send();
}


function deadline() {
	count = 100;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibitions?status=CONFIRM&date=OPENIG&size=100&sort=eiEndDate,asc&page=0'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var idx = 1;
			for (var exhibition of res.content) {
						html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" id="ei' + idx + '">';
						html += '<article class="entry">';
						html += '<div class="entry-img">';
						html += '<img name="imgPath" style="width:400px; cursor:pointer; height:400px" src=\'/upload/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
						html += '</div>';
						html += '<div class="row"><div class="col-sm-10">';
						html += '<h2 class="entry-title">';
					    html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					    html += '</h2></div>';					
					    html += '<div class="col-sm-2"><a href=\'/upload/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
						html += '<div class="entry-meta">';
						html += '<ul>';
						html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
						html += '</ul>';
					    html += '<ul>';
						html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
						html += '</ul>';
						html += '</div>';
						html += '<div class="entry-content">';
						html += '<div style="HEIGHT: 10pt"></div>';
						html += '<div style="display:none" class="read-more">';
						html += '<input name="checkMap' + idx +  '" type="checkbox" onclick="sideMap(' + idx + ')" value1="' + exhibition.galleryInfo['giAddressX'] + '" value2="' + exhibition.galleryInfo['giAddressY'] + '" value3="' + exhibition.galleryInfo['giName'] + '">';
						html += '</div>';
						html += '</div>';
						html += '</article>';
						html += '</div>';
						idx++;
			}
			document.querySelector('#exhibitionList').innerHTML = html;
		}
	}
	xhr.send();
}

function areaAll() {    
    count = 100;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibitions?status=CONFIRM&date=OPENIG&size=100&sort=eiName,asc&page=0'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				var html = '';
				var idx = 1;							
				for (var exhibition of res.content) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/upload/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<div class="row"><div class="col-sm-10">';
							html += '<h2 class="entry-title">';
					        html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					        html += '</h2></div>';					
					        html += '<div class="col-sm-2"><a href=\'/upload/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '</ul>';
					        html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
							html += '</ul>';
							html += '</div>';
							html += '<div class="entry-content">';
							html += '<div style="HEIGHT: 10pt"></div>';
							html += '<div style="display:none" class="read-more">';
							html += '<input name="checkMap' + idx +  '" type="checkbox" onclick="sideMap(' + idx + ')" value1="' + exhibition.galleryInfo['giAddressX'] + '" value2="' + exhibition.galleryInfo['giAddressY'] + '" value3="' + exhibition.galleryInfo['giName'] + '">';
							html += '</div>';
							html += '</div>';
							html += '</article>';
							html += '</div>';
							idx++;
				}			
			document.querySelector('#exhibitionList').innerHTML = html;
			
		}
	}
    xhr.send();
   
}
	
function priceCheap(){
	count = 100;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibitions?status=CONFIRM&date=OPENIG&price=1&size=100&sort=eiCharge,asc&page=0'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var idx = 1;
			for(var exhibition of res.content){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/upload/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<div class="row"><div class="col-sm-10">'
					html += '<h2 class="entry-title">';
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					html += '</h2></div>';					
					html += '<div class="col-sm-2"><a href=\'/upload/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '</ul>';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
					html += '</ul>';
					html += '</div>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div style="display:none" class="read-more">';
					html += '<input name="checkMap' + idx +  '" type="checkbox" onclick="sideMap(' + idx + ')" value1="' + exhibition.galleryInfo['giAddressX'] + '" value2="' + exhibition.galleryInfo['giAddressY'] + '" value3="' + exhibition.galleryInfo['giName'] + '">';
					html += '</div>';
					html += '</div>';
					html += '</article>';
					html += '</div>';
					idx++;
			}
			document.querySelector('#exhibitionList').innerHTML = html;
		}		
	}
	xhr.send();
}

function priceExpensive(){
	count = 100;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibitions?status=CONFIRM&date=OPENIG&price=1&size=100&sort=eiCharge,Desc&page=0'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var idx = 1;
			for(var exhibition of res.content){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/upload/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<div class="row"><div class="col-sm-10">'
					html += '<h2 class="entry-title">';
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					html += '</h2></div>';					
					html += '<div class="col-sm-2"><a href=\'/upload/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '</ul>';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
					html += '</ul>';
					html += '</div>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div style="display:none" class="read-more">';
					html += '<input name="checkMap' + idx +  '" type="checkbox" onclick="sideMap(' + idx + ')" value1="' + exhibition.galleryInfo['giAddressX'] + '" value2="' + exhibition.galleryInfo['giAddressY'] + '" value3="' + exhibition.galleryInfo['giName'] + '">';
					html += '</div>';
					html += '</div>';
					html += '</article>';
					html += '</div>';
					idx++;
			}
			document.querySelector('#exhibitionList').innerHTML = html;
		}		
	}
	xhr.send();
}

function pricefree(){
	count = 100;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibitions?status=CONFIRM&date=OPENIG&price=0&size=100&sort=eiNum,asc&page=0'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var idx = 1;
			for(var exhibition of res.content){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/upload/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<div class="row"><div class="col-sm-10">'
					html += '<h2 class="entry-title">';
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					html += '</h2></div>';					
					html += '<div class="col-sm-2"><a href=\'/upload/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '</ul>';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
					html += '</ul>';
					html += '</div>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div style="display:none" class="read-more">';
					html += '<input name="checkMap' + idx +  '" type="checkbox" onclick="sideMap(' + idx + ')" value1="' + exhibition.galleryInfo['giAddressX'] + '" value2="' + exhibition.galleryInfo['giAddressY'] + '" value3="' + exhibition.galleryInfo['giName'] + '">';
					html += '</div>';
					html += '</div>';
					html += '</article>';
					html += '</div>';
					idx++;
			}
			document.querySelector('#exhibitionList').innerHTML = html;
		}		
	}
	xhr.send();
}

function area(obj) {
count =100;	
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-getaddressList/' + obj.value + '?status=CONFIRM&date=OPENIG&size=100&sort=eiNum,asc&page=0'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {			
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var idx = 1;
			for (var exhibition of res.content) {
						    html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/upload/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<div class="row"><div class="col-sm-10">';
							html += '<h2 class="entry-title">';
					        html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					        html += '</h2></div>';					
					        html += '<div class="col-sm-2"><a href=\'/upload/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '</ul>';
					        html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
							html += '</ul>';
							html += '</div>';
							html += '<div class="entry-content">';
							html += '<div style="HEIGHT: 10pt"></div>';
							html += '<div style="display:none" class="read-more">';
							html += '<input name="checkMap' + idx +  '" type="checkbox" onclick="sideMap(' + idx + ')" value1="' + exhibition.galleryInfo['giAddressX'] + '" value2="' + exhibition.galleryInfo['giAddressY'] + '" value3="' + exhibition.galleryInfo['giName'] + '">';
							html += '</div>';
							html += '</div>';
							html += '</article>';
							html += '</div>';
							idx++;
			}
			document.querySelector('#exhibitionList').innerHTML = html;
		}
	}
	xhr.send();
}



function sideMap(idx) {
	//sideExhibition(obj);
	var mvCheck = document.querySelector('#mv' + idx);
	console.log(mvCheck);

	if (mvCheck) {
		$('#mv' + idx).remove();//ch
		$('input[name="checkMap' + idx + '"]').prop('checked', false);//체크되어 있다면 펑션 실행지 체크 해제 (false)
		return;
	}


	var index = document.querySelector('div[id="ei' + idx + '"] img[name="imgPath"]').src.lastIndexOf('/');
	var imgPath = document.querySelector('div[id="ei' + idx + '"] img[name="imgPath"]').src.substring(index + 1);
	console.log(index);
	console.log(imgPath);

	var x = document.querySelector('div[id="ei' + idx + '"] input[name="checkMap' + idx + '"]').getAttribute('value1');
	var y = document.querySelector('div[id="ei' + idx + '"] input[name="checkMap' + idx + '"]').getAttribute('value2');
	var giName = document.querySelector('div[id="ei' + idx + '"] input[name="checkMap' + idx + '"]').getAttribute('value3');
	var giAddress = document.querySelector('div[id="ei' + idx + '"] input[name="checkMap' + idx + '"]').getAttribute('value4');
	console.log(giAddress);


	var html = '<div id="mv' + idx + '">';
	html += '<div>';
	html += '<div  class="map_view1">';
	html += '<img style=" width:70px; height: 70px;" src="/upload/' + imgPath + '" onclick="moveMap(this)" data-y="' + y + '" data-x="' + x + '">';
	html += '</div >';
	html += '<div  class="map_view2" >';
	html += '<span>'+giName+'</span>';
	html += '<span>'+giAddress+'</span>';
	html += '</div>';
	html += '<div class="map_view3">';
	html += '<img src="/resources/user/img/sidebtn/x-btn.png" onclick="sideMap(' + idx + ')" > ';
	html += '</div>';
	html += '</div>';

	$('#sideMapList').append(html);

	var mapOptions = {
		center: new naver.maps.LatLng(y, x),
		zoom: 18
	};

	var map = new naver.maps.Map('map', mapOptions);
}
function moveMap(move) {
	console.log(move);
	var giAddressX = move.getAttribute('data-x');
	var giAddressY = move.getAttribute('data-y');

	console.log(giAddressX);
	console.log(giAddressY);
	var mapOptions = {
		center: new naver.maps.LatLng(giAddressY, giAddressX),
		zoom: 18
	};
	var map = new naver.maps.Map('map', mapOptions);
}