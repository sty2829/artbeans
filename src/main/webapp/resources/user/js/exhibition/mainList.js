/**
 * 
 */


 var html = '';
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-list?size=9&sort=eiStartDate,asc'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){			
			var res = JSON.parse(xhr.responseText);
			// exhibition.eiStatus=0 수락전
			for(var exhibition of res.data){
				if(exhibition.eiStatus==0){
					html += '<div class="col-lg-4 col-md-6 portfolio-item filter-app">';					
					html += '<div alt="" class="portfolio-wrap" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '<img src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" >';
					html += '<div class="portfolio-info">';
					html += '<h4>' + exhibition.eiName + '</h4>';
					html += '<p>' + exhibition.eiArtist + '</p>';					
					html += '</div></div></div>';
					html += '<div class="col-lg-4 col-md-6 portfolio-item filter-card">';
					html += '<div class="portfolio-wrap" onclick="location.href=\'/views/gallery/views?giNum=' + exhibition.galleryInfo.giNum + '\'">';
					html += '<img src=\'/resources/assets/img/gallery/' + exhibition.galleryInfo.fileInfo.fiPath + '\'" class="img-fluid" >';
					html += '<div class="portfolio-info">';
					html += '<h4>' + exhibition.galleryInfo.giName + '</h4>';
					html += '<p>' + exhibition.galleryInfo.giAddress + '</p>';					
					html += '</div></div></div>';
				}
			}
			
			document.querySelector('#exhibitionList').innerHTML = html;
		}		
	}
	xhr.send();