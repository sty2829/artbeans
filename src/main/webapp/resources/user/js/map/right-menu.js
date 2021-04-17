/**
 * 
 */
$('#sidebarCollapse').on('click', function() {
	$('#sidebar').addClass('active');
	$('.overlay').fadeIn();
	$('#sidebarCollapse').hide();
	$('.read-more').show();
});

$('.overlay').on('click', function() {
	$('#sidebar').removeClass('active');
	$('.overlay').fadeOut();
	$('#sidebarCollapse').show();
	$('.read-more').hide();
});