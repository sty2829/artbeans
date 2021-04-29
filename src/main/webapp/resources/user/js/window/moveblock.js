/**
 * 
 */

//윈도우 새로고침 막기
function noEvent() {
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}
document.onkeydown = noEvent;

//페이지 이동시 막기
window.onbeforeunload = function(event) {
   event.returnValue = "";
   
   if(event.returnValue){
	}
};