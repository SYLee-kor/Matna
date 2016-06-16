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
    	String content = name+"�Բ��� �����Ͻ� "+id+"������ �ӽ� ��й�ȣ �Դϴ�.\r\n"
    					+"���� "+id+"������ �ӽ� ��й�ȣ "+pw+"�� ���� �Ǿ� ������ �α��� �ϼż�\r\n"
    					+"������������ ���� ������ ���Ͽ� ��й�ȣ�� ���� �Ͽ� �ֽñ� �ٶ��ϴ�."
    					+"�����մϴ�.";
    	return content;
    }
}  