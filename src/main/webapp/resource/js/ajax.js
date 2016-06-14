//  js/ajax.js
var xhr=null;    

function getXMLHttpRequest(){//XMLHttpRequest객체생성
    	if(window.ActiveXObject){//IE10 이하
    		//브라우저가 ActiveXObject객체를 지원한다면 : IE라면
    	   //alert("당신의 브라우저는 IE입니다!!");
          try{ 
           return new ActiveXObject("Msxml2.XMLHTTP"); //IE6이상	 
          }catch(e){
            return new ActiveXObject("Microsoft.XMLHTTP"); //IE5이하
          }
    	}else if(window.XMLHttpRequest){//IE11, 비IE
    	   //alert("당신의 브라우저는 IE가 아닙니다!!");	
            return new XMLHttpRequest();
    	}else{
    		return null;
    	}         
}//getXMLHttpRequest


function sendRequest(url,params,callback,method){
	xhr = getXMLHttpRequest();
	var httpMethod = method ? method : 'GET'; //전달된 요청방식이 있으면 저장.
	//(조건식) ? A : B  ==> 조건식 결과가 참이면 A, 거짓이면 B리턴
	if(httpMethod != 'GET' && httpMethod !='POST'){
		httpMethod = 'GET';
	}
	
	var httpParams = (params==null || params=='') ? null : params;
	//전달된 파라미터 저장.
	
	var httpUrl = url;
	if(httpMethod=='Get' && httpParams!=null){
		httpUrl = httpUrl+"?"+httpParams; //"GET"방식 hello.jsp?name=홍길동
	}
	
	xhr.onreadystatechange=callback;
	
	xhr.open(httpMethod,httpUrl,true)
	xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	            //보낼데이터의 타입을 설정
	xhr.send(httpMethod=='POST' ? httpParams : null);
	
}//sendRequest


