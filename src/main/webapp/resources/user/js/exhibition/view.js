/**
 * 
 */


window.onload = function (){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition?eiNum='+eiNum); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '<div class="col-lg-8">';
			html += '<h2 class="portfolio-title">' + res.eiName + '</h2>';
			html += '<div class="entry-img ">';
			// style="width:800px; height:700px" 일부로 사이즈 안 넣었음.
			html += '<img  src=\'/resources/assets/img/exhibition/' + res.fileInfo['fiPath'] + '\'" class="img-fluid">';
			html += '</div></div>';
			html += '<div class="col-lg-4 portfolio-info">';
			html += '<ul>';
			html += '<li><strong>전시회하는 갤러리</strong>:' + res.galleryInfo['giName'] +'</li>';
			html += '<li><strong>갤러리 주소</strong>:' + res.galleryInfo['giAddress'] +'</li>';
			html += '<li><strong>작가</strong>:' + res.eiArtist +'</li>';
			html += '<li><strong>가격</strong>:' + res.eiCharge +'</li>';
			html += '<li><strong>전시회 일정</strong>:' + res.eiStartDate + '~' + res.eiEndDate + '</li>';
			html += '<li><strong>전시회 시간</strong>:' + res.eiStartTime + '~' + res.eiEndTime + '</li>';
			html += '</ul>';
			html += '</div>';
			html += '<hr style="border:solid 3px; width:70%; align:center">';
			html += '<div style="padding-top:10px; padding-bottom: 10px; margin-top: 20px; margin-left:15px; margin-right:15px; width:100%;  text-align:center">' + res.eiContent + '</div>';
			html += '<hr style="border:solid 3px; width:70%; align:center">';
			document.querySelector('#exhibition').innerHTML = html;
			
			var mapOptions = {
				    center: new naver.maps.LatLng(res.galleryInfo['giAddressY'],res.galleryInfo['giAddressX']),
				    zoom: 16
				};
				var map = new naver.maps.Map('map', mapOptions);				 
				var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(res.galleryInfo['giAddressY'], res.galleryInfo['giAddressX']),
				    title: res.galleryInfo['giName'],
				    map: map
				});				 
				var contentString = [
				        '<div style="padding:4px 4px;">',
				        '   <div style="font-weight:bold;padding-bottom:3px;">'+ res.galleryInfo['giName'] + '</div>',
				        '</div>'
				    ].join('');				 
				var infowindow = new naver.maps.InfoWindow({
				    content: contentString
				});				 
				naver.maps.Event.addListener(marker, "click", function(e) {
				    if (infowindow.getMap()) {
				        infowindow.close();
				    } else {
				        infowindow.open(map, marker);
				    }
				});				 
				infowindow.open(map, marker);
		}		
	}
	xhr.send();
}