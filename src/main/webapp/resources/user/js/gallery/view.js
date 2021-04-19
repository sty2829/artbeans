/**
 * 
 */
window.onload = function (){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery?giNum='+giNum); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			
			//console.log(res.exhibitionInfos);			
			
			
			
			var html = '<div class="col-lg-8">';
			html += '<h2 class="portfolio-title">' + res.giName + '</h2>';
			html += '<div class="entry-img ">';
			// style="width:800px; height:700px" 일부로 사이즈 안 넣었음.
			html += '<img  src=\'/resources/assets/img/gallery/' + res.fileInfo['fiPath'] + '\'" class="img-fluid">';
			html += '</div></div>';
			html += '<div class="col-lg-4 portfolio-info">';
			html += '<ul>';
			html += '<li><strong>주소</strong>: ' + res.giAddress +'</li>';
			html += '<li><strong>전화번호</strong>: ' + res.giRphoneNumber +'</li>';
			html += '<li><strong>휴일</strong>: ' + res.giHoliday +'</li>';
			html += '<li><strong>홈페이지</strong>: ' + res.giHomepage +'</li>';
			html += '<li><strong>운영시간</strong>: ' + res.giStartTime + '~' + res.giEndTime + '</li>';
			
			console.log(res.exhibitionInfos[1].eiNum )
			for(var i=0;i<res.exhibitionInfos.length;i++){
			  if(res.exhibitionInfos[i].eiStatus == 0){
			    html += '<li style="cursor:pointer" onclick="location.href=\'/views/exhibition/views?eiNum=' + res.exhibitionInfos[i].eiNum + '\'"><strong>진행중인 전시회</strong>: ' + res.exhibitionInfos[i].eiName  + '</li>';
			  }
			}
			
			html += '</ul>';
			html += '</div>';
			
			
			document.querySelector('#exhibition').innerHTML += html;
			
			var mapOptions = {
				    center: new naver.maps.LatLng(res.giAddressY,res.giAddressX),
				    zoom: 16
				};
				var map = new naver.maps.Map('map', mapOptions);				 
				var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(res.giAddressY, res.giAddressX),
				    title: res.giName,
				    map: map
				});				 
				var contentString = [
				        '<div style="padding:4px 4px;">',
				        '   <div style="font-weight:bold;padding-bottom:3px;">'+ res.giName + '</div>',
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