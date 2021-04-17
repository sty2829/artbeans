/**
 * 
 */
window.onload = get;
function get(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list?size=11&sort=giNum,asc&page='+ count); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res.data){				
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">';
				html += '</div>';
				html += '<h2 class="entry-title">';
				html += '<a>' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div style="display:none" class="read-more">';
				html += '<input type="checkbox" onclick="sideMap()">';
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
			}
			document.querySelector('#galleryList').innerHTML += html;
		}		
	}
	xhr.send();
}

function areaAsc(){
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list?size=11&sort=giAddress,asc&page='+ count); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res.data){				
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">';
				html += '</div>';
				html += '<h2 class="entry-title">';
				html += '<a>' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div style="display:none" class="read-more">';
				html += '<input type="checkbox" onclick="sideMap()">';
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
			}
			document.querySelector('#galleryList').innerHTML = html;
		}		
	}
	xhr.send();
}

function areaDesc(){
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list?size=11&sort=giAddress,Desc&page='+ count); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res.data){				
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">';
				html += '</div>';
				html += '<h2 class="entry-title">';
				html += '<a>' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div style="display:none" class="read-more">';
				html += '<input type="checkbox" onclick="sideMap()">';
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
			}
			document.querySelector('#galleryList').innerHTML = html;
		}		
	}
	xhr.send();
}

function nameAsc(){
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list?size=11&sort=giName,asc&page='+ count); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res.data){				
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">';
				html += '</div>';
				html += '<h2 class="entry-title">';
				html += '<a>' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div style="display:none" class="read-more">';
				html += '<input type="checkbox" onclick="sideMap()">';
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
			}
			document.querySelector('#galleryList').innerHTML = html;
		}		
	}
	xhr.send();
}

function nameDesc(){
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list?size=11&sort=giName,desc&page='+ count); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res.data){				
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">';
				html += '</div>';
				html += '<h2 class="entry-title">';
				html += '<a>' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div style="display:none" class="read-more">';
				html += '<input type="checkbox" onclick="sideMap()">';
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
			}
			document.querySelector('#galleryList').innerHTML = html;
		}		
	}
	xhr.send();
}