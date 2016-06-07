package com.kosta.matna.persistence.member;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.kosta.matna.domain.member.MemberVO;

@Component
public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "id.empty", "�̸��� �Է��ϼ���.");
		  
		  MemberVO member = (MemberVO)target;
		  
		  if (member.getId() == null || "".equals(member.getId()))
			   errors.rejectValue("id", "invalid.id", "�̸��� �Է��ϼ���");


		  /*if(member.getPw().length() > 6){

		   errors.rejectValue("password", "password.long", "���̰� �ʹ� ��ϴ�.");

		  }else if(member.getPw().length() < 8){

		   errors.rejectValue("password", "password.short", "���̰� �ʹ� ª���ϴ�.");

		  }*/

	}

}
