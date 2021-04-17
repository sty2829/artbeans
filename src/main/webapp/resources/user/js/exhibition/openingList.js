/**
 * 
 */
window.onload = get;

function get() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-list?size=11&sort=eiNum,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '';
			// exhibition.eiStatus=1 진행중인 전시회
			for (var exhibition of res.data) {
				if (exhibition.eiStatus == 1) {
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img  style="width:400px; cursor:pointer; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<h2 class="entry-title">';
					html += '<a>' + exhibition.eiName + '</a>';
					html += '</h2>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '</a></li>';
					html += '</ul>';
					html += '</div>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div style="display:none" class="read-more">';
					html += '<input name="checkMap" type="checkbox" onclick="sideMap(this)" value1="'+exhibition.galleryInfo['giAddressX']+'" value2="'+exhibition.galleryInfo['giAddressY']+'" value3="'+ exhibition.eiNum + '">';
					html += '</div>';
					html += '</div>';
					html += '</article>';
					html += '</div>';
				}
			}
			document.querySelector('#exhibitionList').innerHTML += html;
		}
	}
	xhr.send();
}

function newest() {
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-list?size=11&sort=eiStartDate,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '';
			// exhibition.eiStatus=1 진행중인 전시회
			for (var exhibition of res.data) {
				if (exhibition.eiStatus == 1) {
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img  style="width:400px; cursor:pointer; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<h2 class="entry-title">';
					html += '<a>' + exhibition.eiName + '</a>';
					html += '</h2>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '</a></li>';
					html += '</ul>';
					html += '</div>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div style="display:none" class="read-more">';
					html += '<input name="checkMap" type="checkbox" onclick="sideMap(this)" value1="'+exhibition.galleryInfo['giAddressX']+'" value2="'+exhibition.galleryInfo['giAddressY']+'" value3="'+ exhibition.eiNum + '">';
					html += '</div>';
					html += '</div>';
					html += '</article>';
					html += '</div>';
				}
			}
			document.querySelector('#exhibitionList').innerHTML = html;
		}
	}
	xhr.send();
}


function deadline() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-list?size=11&sort=eiStartDate,Desc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '';
			// exhibition.eiStatus=1 진행중인 전시회
			for (var exhibition of res.data) {
				if (exhibition.eiStatus == 1) {
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img  style="width:400px; cursor:pointer; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<h2 class="entry-title">';
					html += '<a>' + exhibition.eiName + '</a>';
					html += '</h2>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '</a></li>';
					html += '</ul>';
					html += '</div>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div style="display:none" class="read-more">';
					html += '<input name="checkMap" type="checkbox" onclick="sideMap(this)" value1="'+exhibition.galleryInfo['giAddressX']+'" value2="'+exhibition.galleryInfo['giAddressY']+'" value3="'+ exhibition.eiNum + '">';
					html += '</div>';
					html += '</div>';
					html += '</article>';
					html += '</div>';
				}
			}
			document.querySelector('#exhibitionList').innerHTML = html;
		}
	}
	xhr.send();


}

function sideExhibition(obj) {
	
	var eiNum = obj.getAttribute('value3');
	console.log(eiNum);
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-search');
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var rres = JSON.parse(xhr.responseText);
			var html = '';
			
			for(var res of rres) {
			
				html += '<div id="' + res.eiNum + '">';
				html +=  '<div class="map_view1" onclick="moveMap(this) value1=' + res.galleryInfo.giAddressY + 'value2='+   res.galleryInfo.giAddressX + '">';
				html += '<img  style="width:50px; cursor:pointer; height:50px" src=\'/resources/assets/img/exhibition/' + res.fileInfo.fiPath + '\'" onclick="location.href=\'/views/exhibition/views?eiNum=' + res.eiNum + '\'">';
				html += '</div>';
				html +=  '<div class="map_view2" onclick="moveMap(this)value1=' +  res.galleryInfo.giAddressY + 'value2=' + res.galleryInfo.giAddressX +   '">';
				html += '<span></span><br>';
				html +='<span>'+res.galleryInfo.giName+'</span>';
				html += '</div>';
				html += '</div>';
				html += '</div>';			
		}
		
		}document.querySelector('#sideMapList').innerHTML = html;
	}
	xhr.send();
}