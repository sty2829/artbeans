/**
 * 
 */
//window.onload = get;

window.addEventListener("load", get);					
						
function get() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-openinglist?size=9&sort=eiNum,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var idx = 1;
			for (var exhibition of res.data) {
						html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" id="ei' + idx + '">';
						html += '<article class="entry">';
						html += '<div class="entry-img">';
						html += '<img name="imgPath" style="width:400px; cursor:pointer; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
						html += '</div>';
						html += '<div class="row"><div class="col-sm-10">'
					    html += '<h2 class="entry-title">';
					    html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					    html += '</h2></div>';					
					    html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
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
			document.querySelector('#exhibitionList').innerHTML += html;
		}
	}
	xhr.send();
}

function newest() {
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-openinglist?size=9&sort=eiStartDate,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var idx = 1;
			for (var exhibition of res.data) {				
						html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" id="ei' + idx + '">';
						html += '<article class="entry">';
						html += '<div class="entry-img">';
						html += '<img name="imgPath" style="width:400px; cursor:pointer; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
						html += '</div>';
						html += '<div class="row"><div class="col-sm-10">';
						html += '<h2 class="entry-title">';
					    html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					    html += '</h2></div>';					
					    html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
						html += '<div class="entry-meta">';
						html += '<ul>';
						html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
						html += '</ul>';
					    html += '<ul>';
						html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
						html += '</ul>';
					    html += '<ul>';
						html += '<li class="d-flex align-items-center"><i class="icofont-heart-alt"></i><a>' + favoriteExhibition.feLike + '</a></li>';
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
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-openinglist?size=9&sort=eiEndDate,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var idx = 1;
			for (var exhibition of res.data) {
						html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" id="ei' + idx + '">';
						html += '<article class="entry">';
						html += '<div class="entry-img">';
						html += '<img name="imgPath" style="width:400px; cursor:pointer; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
						html += '</div>';
						html += '<div class="row"><div class="col-sm-10">';
						html += '<h2 class="entry-title">';
					    html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					    html += '</h2></div>';					
					    html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
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
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-openinglist?size=9&sort=eiName,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				var html = '';							
				for (var exhibition of res.data) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<div class="row"><div class="col-sm-10">';
							html += '<h2 class="entry-title">';
					        html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					        html += '</h2></div>';					
					        html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
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
							html += '<input type="checkbox" onclick="sideMap()">';
							html += '</div>';
							html += '</div>';
							html += '</article>';
							html += '</div>';
				}
			
			document.querySelector('#exhibitionList').innerHTML = html;
			}
		}
		xhr.send();
	}

//test
function area(obj) {
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-listDemoss/' + obj.value + '?size=30&sort=eiNum,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {			
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for (var exhibition of res.data) {
				var startDate = new Date(exhibition.eiStartDate);
				var today = new Date();
				var endDate = new Date(exhibition.eiEndDate);
				//console.log(exhibition.eiStatus==1) //진행중인 전시회
				//console.log("진행중" +  (startDate <= today && today <= endDate));
				if (exhibition.eiStatus == 1) {
					if (startDate <= today && today <= endDate) {
						html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
						html += '<article class="entry">';
						html += '<div class="entry-img">';
						html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
						html += '</div>';
						html += '<h2 class="entry-title">';
					    html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					    html += '</h2></div>';					
					    html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
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
						html += '<input name="checkMap' + idx + '" type="checkbox" onclick="sideMap(' + idx + ')" value1="' + exhibition.galleryInfo['giAddressX'] + '" value2="' + exhibition.galleryInfo['giAddressY'] + '" value3="' + exhibition.galleryInfo['giName'] + '">';
						html += '</div>';
						html += '</div>';
						html += '</article>';
						html += '</div>';
					}
				}
			}
			document.querySelector('#exhibitionList').innerHTML = html;
			
			window.addEventListener("scroll",  function(e) {
            if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
                count++;
                area(obj);
               }
            });
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


	var html = '<div id="mv' + idx + '">';
	html += '<div>';
	html += '<div  class="map_view1">';
	html += '<img style=" width:70px; height: 70px;" src="/resources/assets/img/exhibition/' + imgPath + '" onclick="moveMap(this)" data-y="' + y + '" data-x="' + x + '">';
	html += '</div >';
	html += '<div  class="map_view2" >';
	html += '<span>'+giName+'</span>';
	html += '</div>';
	html += '<div class="map_view3">';
	html += '<img src="/resources/user/img/sidebtn/x-btn.png" onclick="sideMap(' + idx + ')" > ';
	html += '</div>';
	html += '</div>';

	$('#sideMapList').append(html);

	var mapOptions = {
		center: new naver.maps.LatLng(y, x),
		zoom: 16
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
		zoom: 14
	};
	var map = new naver.maps.Map('map', mapOptions);
}