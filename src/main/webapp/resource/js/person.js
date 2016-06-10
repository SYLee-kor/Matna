//person.js

//클래스명 = function(파라미터){}

Person=function(name,age,job){
	//Person객체의 멤버정의 : thsis.속성명
	this.name=name;
	this.age=age;
	this.job=job;
}

//메소드정의: 클래스명.prototype.메소드명=function(매개변수){}

Person.prototype.setAge=function(age){
	this.age = age;
}

Person.prototype.setJob=function(job){
	
}

//toString()정의 : 클래스의 상태(속성값)를 표현하는 메소드 정의
Person.prototype.toString=function(){
	return "[이름: "+this.name+", 나이: "+this.age+", 직업: "+this.job+"]";
}