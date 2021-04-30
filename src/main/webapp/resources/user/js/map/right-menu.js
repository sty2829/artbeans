/**
 * 
 */
$('#sidebarCollapse').on('click', function() {
	$('#sidebar').addClass('active');
	console.log($('#sidebar').attr('class'));
	$('.overlay').fadeIn();
	$('#sidebarCollapse').hide();
	$('.read-more').show();
	
	var mapOptions = {
		center: new naver.maps.LatLng(37.59740819282277,127.08778439796748),
		zoom: 15
	};

	var map = new naver.maps.Map('map', mapOptions);
	
	window.addEventListener("scroll", function(e) {
		if ($('#sidebar').attr('class')=='active'||(window.innerHeight + window.scrollY) > document.body.offsetHeight) {
			$('.read-more').show();
		}
		if ($('#sidebar').attr('class')==''||(window.innerHeight + window.scrollY) > document.body.offsetHeight) {
			$('.read-more').hide();
		}

	});
	
});

$('.overlay').on('click', function() {
	$('#sidebar').removeClass('active');
	console.log($('#sidebar').attr('class'));
	$('.overlay').fadeOut();
	$('#sidebarCollapse').show();
	$('.read-more').hide();
});

