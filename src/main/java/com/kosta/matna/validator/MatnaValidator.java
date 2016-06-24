package com.kosta.matna.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.kosta.matna.domain.member.MemberVO;

public class MatnaValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors e) {
//		ValidationUtils.rejectIfEmptyOrWhitespace(e, "", "", ""[], "");
	}

}
