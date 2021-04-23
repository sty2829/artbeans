/**
 * 
 */
 
window.onload = get;
function get(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-lists?size=9&sort=giNum,asc&page='+ count); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res.data){				
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">';
				html += '</div>';				
				html += '<div class="row"><div class="col-sm-10">'
				html += '<h2 class="entry-title">';
				html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">' + galleryInfo.giName + '</a>';
				html += '</h2></div>';					
				html += '<div class="col-sm-2"><a href=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '</ul>';
			    html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime + '~' + galleryInfo.giEndTime + '</a></li>';
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
	xhr.open('GET','/Gallery-list?size=9&sort=giAddress,asc&page='+ count); //galleryController
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
				html += '<div class="row"><div class="col-sm-10">'
				html += '<h2 class="entry-title">';
				html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">' + galleryInfo.giName + '</a>';
				html += '</h2></div>';					
				html += '<div class="col-sm-2"><a href=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '</ul>';
			    html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime + '~' + galleryInfo.giEndTime + '</a></li>';
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


//테스트중
function area(obj){
	count = 0;
	//console.log(obj.value);
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-listss/'+ obj.value + '?size=9&sort=giAddress,asc&page='+ count); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res.data){	
			console.log(galleryInfo);				
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">';
				html += '</div>';
				html += '<div class="row"><div class="col-sm-10">'
				html += '<h2 class="entry-title">';
				html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">' + galleryInfo.giName + '</a>';
				html += '</h2></div>';					
				html += '<div class="col-sm-2"><a href=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '</ul>';
			    html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime + '~' + galleryInfo.giEndTime + '</a></li>';
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
			
			/*window.addEventListener("scroll",  function(e) {
            if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
                count++;
                area(obj);
               }
            });*/
		}		
	}
	xhr.send();
}

function nameAsc(){
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list?size=9&sort=giName,asc&page='+ count); //galleryController
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
				html += '<div class="row"><div class="col-sm-10">'
				html += '<h2 class="entry-title">';
				html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">' + galleryInfo.giName + '</a>';
				html += '</h2></div>';					
				html += '<div class="col-sm-2"><a href=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '</ul>';
			    html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime + '~' + galleryInfo.giEndTime + '</a></li>';
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
	xhr.open('GET','/Gallery-list?size=9&sort=giName,desc&page='+ count); //galleryController
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
				html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'">' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '</ul>';
			    html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime + '~' + galleryInfo.giEndTime + '</a></li>';
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