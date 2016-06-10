//  js/ajax2.js

/*
   클래스명=function(파라미터){
   this.필드명1=데이터;
   this.필드명2=데이터;
   }
   
   클래스명.prototype.함수명1=function(파라미터){
   
   }
   클래스명.prototype.함수명2=function(파라미터){
   
   }
   
   클래스명.prototyle={
      함수명1:function(파라미터){}
      함수명2:function(파라미터){}
  }
   
 */

var ajax={};
    ajax.xhr={}; //ajax.xhr패키지 정의
    
ajax.xhr.Request = function(url,params,callback,method){
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send();
}
//사용법 new ajax.xhr.Request("요청URL","파라미터","콜백함수명,"요청방식");

//Request클래스의 함수정의
ajax.xhr.Request.prototype={
		getXMLHttpRequest:function(){
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
		},
		send:function(){
			this.xhr = this.getXMLHttpRequest();
			var httpMethod = this.method ? this.method : 'GET'; //전달된 요청방식이 있으면 저장.
			//(조건식) ? A : B  ==> 조건식 결과가 참이면 A, 거짓이면 B리턴
			if(httpMethod != 'GET' && httpMethod !='POST'){
				httpMethod = 'GET';
			}
			
			var httpParams = (this.params==null || this.params=='') ? null : this.params;
			//전달된 파라미터 저장.
			
			var httpUrl = this.url;
			if(httpMethod=='Get' && httpParams!=null){
				httpUrl = httpUrl+"?"+httpParams; //"GET"방식 hello.jsp?name=홍길동
			}
			
			var request = this; //Request클래스의 레퍼런스 request생성
			this.xhr.onreadystatechange=function(){
				request.onStateChange.call(request);
			}
				
			this.xhr.open(httpMethod,httpUrl,true)
			this.xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			                   //보낼데이터의 타입을 설정
			this.xhr.send(httpMethod=='POST' ? httpParams : null);
		},
		onStateChange:function(){
			this.callback(this.xhr);
			//클래스에 정의되어 있는 속성 callback에 명시된 함수를 호출하면서
			//XMLHttpRequest객체를 파라미터를 통해 전달.
		}
}



