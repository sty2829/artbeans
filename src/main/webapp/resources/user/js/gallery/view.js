/**
 * 
 */
window.onload = function (){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery?giNum='+giNum); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);	
			var html = '<div class="col-sm-7">';
			html += '<div style="text-align:center" class="entry-img ">';
			html += '<img style="width:550px; height:500px"  src=\'/resources/assets/img/gallery/' + res.fileInfo['fiPath'] + '\'" class="img-fluid">';
			html += '</div></div>';
			html += '<div class="col-sm-5 portfolio-info">';
			html +='<div class="row faq-item d-flex align-items-stretch">';
            html +='<div class="col-lg-4">';
            html +='<h4>갤러리</h4></div>';
            html +='<div class="col-lg-1">';
            html +='<h4>|</h4></div>';
            html +='<div class="col-lg-7">';
            html +='<h5 style="padding-top:1px">' + res.giName +'</h5></div></div>';
            html +='<hr>';
			html +='<div class="row faq-item d-flex align-items-stretch">';
            html +='<div class="col-lg-4">';
            html +='<h4>주소</h4></div>';
            html +='<div class="col-lg-1">';
            html +='<h4>|</h4></div>';
            html +='<div class="col-lg-7">';
            html +='<h5 style="padding-top:1px">' + res.giAddress +'</h5></div></div>';
            html +='<hr>';
			html +='<div class="row faq-item d-flex align-items-stretch">';
            html +='<div class="col-lg-4">';
            html +='<h4>연락처</h4></div>';
            html +='<div class="col-lg-1">';
            html +='<h4>|</h4></div>';
            html +='<div class="col-lg-7">';
            html +='<h5 style="padding-top:1px">' + res.giRphoneNumber +'</h5></div></div>';
            html +='<hr>';
            html +='<div class="row faq-item d-flex align-items-stretch">';
            html +='<div class="col-lg-4">';
            html +='<h4>휴일</h4></div>';
            html +='<div class="col-lg-1">';
            html +='<h4>|</h4></div>';
            html +='<div class="col-lg-7">';
            html +='<h5 style="padding-top:1px">' + res.giHoliday +'</h5></div></div>';
            html +='<hr>';
            html +='<div class="row faq-item d-flex align-items-stretch">';
            html +='<div class="col-lg-4">';
            html +='<h4>홈페이지</h4></div>';
            html +='<div class="col-lg-1">';
            html +='<h4>|</h4></div>';
            html +='<div class="col-lg-7">';
            html +='<h5 style="padding-top:1px">' + res.giHomepage +'</h5></div></div>';
            html +='<hr>';
            html +='<div class="row faq-item d-flex align-items-stretch">';
            html +='<div class="col-lg-4">';
            html +='<h4>운영시간</h4></div>';
            html +='<div class="col-lg-1">';
            html +='<h4>|</h4></div>';
            html +='<div class="col-lg-7">';
            html +='<h5 style="padding-top:1px">' + res.giStartTime + '~' + res.giEndTime +'</h5></div></div>';
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