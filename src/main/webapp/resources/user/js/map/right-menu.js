/**
 * 
 */
$('#sidebarCollapse').on('click', function() {
	$('#sidebar').addClass('active');
	console.log($('#sidebar').attr('class'));
	$('.overlay').fadeIn();
	$('#sidebarCollapse').hide();
	$('.read-more').show();
	window.addEventListener("scroll", function(e) {
		if ($('#sidebar').attr('class')=='active'||(window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
			$('.read-more').show();
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

