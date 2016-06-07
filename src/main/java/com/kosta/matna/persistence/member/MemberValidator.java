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

		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "id.empty", "이름을 입력하세요.");
		  
		  MemberVO member = (MemberVO)target;
		  
		  if (member.getId() == null || "".equals(member.getId()))
			   errors.rejectValue("id", "invalid.id", "이름을 입력하세요");


		  /*if(member.getPw().length() > 6){

		   errors.rejectValue("password", "password.long", "길이가 너무 깁니다.");

		  }else if(member.getPw().length() < 8){

		   errors.rejectValue("password", "password.short", "길이가 너무 짧습니다.");

		  }*/

	}

}
