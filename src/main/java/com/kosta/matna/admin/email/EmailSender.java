package com.kosta.matna.admin.email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.kosta.matna.domain.admin.Email;
   
    public class EmailSender  {
         
        @Autowired
        protected JavaMailSenderImpl  mailSender;
        public void SendEmail(Email email) throws Exception {
             
            MimeMessage msg = mailSender.createMimeMessage();
            try {
                msg.setSubject(email.getSubject());
                msg.setText(email.getContent());
                msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
                
            }catch(MessagingException e) {
                System.out.println("MessagingException");
                e.printStackTrace();
            }
            try {
            	System.out.println("전달 이름:"+mailSender.getUsername());
            	System.out.println("전달 패스워드 : " +mailSender.getPassword());
                mailSender.send(msg);
                
            }catch(MailException e) {
                System.out.println("MailException발생");
                e.printStackTrace();
            }
        }
}
