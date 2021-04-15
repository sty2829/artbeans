/**
 * 
 */



function save(){
	//console.log(editor);
	console.log(editor.getData());
	var eiContent = editor.getData();
	document.querySelector('#eiContent').innerHTML = eiContent;
	console.log(document.querySelector('#eiContent'));
}