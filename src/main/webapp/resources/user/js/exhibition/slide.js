/**
 * 
 */
window.onload = bannerExhibition;
		function bannerExhibition() {
			var xhr = new XMLHttpRequest();
			xhr.open('GET', '/exhibition-banner');
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var res = JSON.parse(xhr.responseText);
					console.log(res);
					var html ='';
					for(var i=0;i<res.length;i++){
						if(res[i]==res[0]){
						html +='<div onclick="location.href=\'/views/exhibition/views?eiNum=' + res[i].eiNum + '\'" class="carousel-item active" style="cursor:pointer; background-image: url(resources/assets/img/exhibition/'+res[i].fileInfo.fiPath+')">';
						html +='<div class="carousel-container">';
						html += '<div class="container">';
						html +='<h2 class="animate__animated animate__fadeInDown"><span>'+res[i].eiName+'</span></h2>';
						html +=' <p class="animate__animated animate__fadeInUp"></p>';
						html +='</div>';
						html += '</div>';
						html += '</div>';
						}else{
						html +='<div onclick="location.href=\'/views/exhibition/views?eiNum=' + res[i].eiNum + '\'" class="carousel-item" style= "cursor:pointer; background-image: url(resources/assets/img/exhibition/'+res[i].fileInfo.fiPath+')">';
						html +='<div class="carousel-container">';
						html += '<div class="container">';
						html +='<h2 class="animate__animated animate__fadeInDown"><span>'+res[i].eiName+'</span></h2>';
						html +='<p class="animate__animated animate__fadeInUp"></p>';
						html +='</div>';
						html += '</div>';
						html += '</div>';
						}
					}document.querySelector('#slide').innerHTML = html;	
								
				}
			}
			xhr.send();
		}