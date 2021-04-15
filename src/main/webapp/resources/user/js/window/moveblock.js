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
   //event.returnValue = true;
   event.returnValue = "";
   
   if(event.returnValue){
		console.log('delete');
		//여기서 파일 지우면 되는데.. 확인버튼 누르면 지우게 바꾸기
	}
};