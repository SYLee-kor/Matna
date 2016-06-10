//log.js

function log(msg){
	var console = document.getElementById("console");
	//console : Element  
	
	console.innerHTML += msg+"<br>"; //내부에 정의될 HTML값을 넣어주는 거니까 HTML포함 돼
}