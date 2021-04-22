/**
 * 
 */

var count = 0;

window.onscroll = function(e) {
    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
    //할것
        count++;
        get();
    }
};



/*
window.addEventListener("scroll",  function(e) {
    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        count++;
        get();
    }
});*/
