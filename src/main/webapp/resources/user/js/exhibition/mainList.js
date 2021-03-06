/**
 * 
 */

function getImageList() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibitions?status=CONFIRM&date=OPENIG&size=9&sort=eiStartDate,asc'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for (var exhibition of res.content) {
					html += '<div class="col-lg-4 col-md-6 portfolio-item filter-exhibition">';
					html += '<div alt="" class="portfolio-wrap" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '<img src=\'/upload/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" >';
					html += '<div class="portfolio-info">';
					html += '<h4>' + exhibition.eiName + '</h4>';
					html += '<p>' + exhibition.eiArtist + '</p>';
					html += '</div></div></div>';
					html += '<div class="col-lg-4 col-md-6 portfolio-item filter-gallery">';
					html += '<div class="portfolio-wrap" onclick="location.href=\'/views/gallery/views?giNum=' + exhibition.galleryInfo.giNum + '\'">';
					html += '<img src=\'/upload/' + exhibition.galleryInfo.fileInfo.fiPath + '\'" class="img-fluid" >';
					html += '<div class="portfolio-info">';
					html += '<h4>' + exhibition.galleryInfo.giName + '</h4>';
					html += '<p>' + exhibition.galleryInfo.giAddress + '</p>';
					html += '</div></div></div>';
			}
			document.querySelector('#exhibitionList').innerHTML = html;
			document.querySelector('#exhibitionList').style.height = '100%';
			var portfolioIsotope = $('.portfolio-container').isotope({
				itemSelector: '.portfolio-item'
			});

			$('#portfolio-flters li').on('click', function() {
				$("#portfolio-flters li").removeClass('filter-active');
				$(this).addClass('filter-active');

				portfolioIsotope.isotope({
					filter: $(this).data('filter')
				});
			});

			// Initiate venobox (lightbox feature used in portofilo)
			$(document).ready(function() {
				$('.venobox').venobox({
					'share': false
				});
			});

			// Skills section
			$('.skills-content').waypoint(function() {
				$('.progress .progress-bar').each(function() {
					$(this).css("width", $(this).attr("aria-valuenow") + '%');
				});
			}, {
				offset: '80%'
			});

			// Portfolio details carousel
			$(".portfolio-details-carousel").owlCarousel({
				autoplay: true,
				dots: true,
				loop: true,
				items: 1
			});
			setTimeout(function(){
				$('#portfolio-flters li:first-child').click();
			},200);
		}
	}
	xhr.send();
}

window.addEventListener('load', getImageList);
