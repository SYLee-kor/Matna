package com.kosta.matna.domain.admin;

public class RandomPassword {  
	  
    public String randomPassword (int length) {  
        int index = 0;  
        char[] charSet = new char[] {  
                '0','1','2','3','4','5','6','7','8','9'  
                ,'A','B','C','D','E','F','G','H','I','J','K','L','M'  
                ,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'  
                ,'a','b','c','d','e','f','g','h','i','j','k','l','m'  
                ,'n','o','p','q','r','s','t','u','v','w','x','y','z'};  
          
        StringBuffer sb = new StringBuffer();  
        for (int i=0; i<length; i++) {  
            index =  (int) (charSet.length * Math.random());  
            sb.append(charSet[index]);  
        }  
          
        return sb.toString();
    }  
    
    public String makeContent(String name,String id,String pw){
    	String content = name+"님께서 문의하신 "+id+"계정의 임시 비밀번호 입니다.\r\n"
    					+"현재 "+id+"계정은 임시 비밀번호 "+pw+"로 설정 되어 있으니 로그인 하셔서\r\n"
    					+"마이페이지의 정보 수정을 통하여 비밀번호를 변경 하여 주시기 바랍니다."
    					+"감사합니다.";
    	return content;
    }
}  