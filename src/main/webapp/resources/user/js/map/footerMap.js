/**
 * 
 */
function loadMap() {
	var mapOptions = {
		center: new naver.maps.LatLng(37.597248, 127.087776),
		zoom: 16
	};
	var map = new naver.maps.Map('map', mapOptions);
	var marker = new naver.maps.Marker({
		position: new naver.maps.LatLng(37.597248, 127.087776),
		//title: 'ArtBeans',
		map: map
	});
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
window.addEventListener('load', loadMap);
