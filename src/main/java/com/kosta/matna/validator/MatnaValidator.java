package com.kosta.matna.validator;

import java.util.HashMap;
import java.util.Map;

import com.kosta.matna.domain.community.BoardVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.recipe.RecipeVO;
import com.kosta.matna.domain.review.PreviewVO;
import com.kosta.matna.domain.review.ReplyVO;
import com.kosta.matna.domain.review.ReviewVO;

public class MatnaValidator {

	private static Map<String,String> errMsgs;

	public static boolean isValid(Object vo, String voName) {
		errMsgs = new HashMap<>();
		// # 입력 받은 voName 값을 통해 유효성 검사 영역을 나누고 해당 검사 작업 실행 후
		// errMsgs(에러메세지) 를 리턴해준다.
		System.out.println("Validator 실행  - "+voName);
		switch (voName) {
		case "ReviewVO": // # ReviewVO : title, content
			ReviewVO rVO = (ReviewVO) vo;
			if( isNullOrEmpty(rVO.getTitle()) ) errMsgs.put("e_title","제목을 입력해주세요.");
//			if( hasSpecialLetters(rVO.getTitle()) ) errMsgs.put("e_title", "특수문자는 사용 불가능합니다.");
			if( isNullOrEmpty(rVO.getContent())) errMsgs.put("e_content", "내용을 입력해주세요.");
			break;
		case "PreviewVO" : // # PreviewVO : recommend, gu, dong, addr, phone
			PreviewVO pVO = (PreviewVO) vo;
			if( isNullOrEmpty(pVO.getRecommend()) ) errMsgs.put("e_recommend", "추천 메뉴를 입력해주세요.");
			if( pVO.getGu().equals("구") ) errMsgs.put("e_gu", "구를 선택해 주세요.");
			if( pVO.getDong().equals("동") ) errMsgs.put("e_dong", "동을 선택해 주세요.");
			if( !pVO.getAddr().matches("[0-9ㄱ-ㅎ가-�R-]+") ) errMsgs.put("e_addr", "알맞은 상세주소를 입력해주세요.");
			if( !pVO.getPhone().matches("[0-9-]+") ) errMsgs.put("e_phone", "알맞은 전화번호를 입력해주세요.");
			if( pVO.getMenu()== null || pVO.getMenu().equals("menu"))
				errMsgs.put("e_menu", "메뉴를 선택해주세요.");
			if( pVO.getPrice()==null || pVO.getPrice().equals("0,0"))
				errMsgs.put("e_price", "가격을 선택해주세요.");
			break;
		case "MemberVO" : // # MemberVO : id, pw, name, nickname, birth, email, phone, post, addr
			MemberVO mVO = (MemberVO) vo;
			if( mVO.getId()== null || !mVO.getId().matches("[a-zA-Z]{1}[a-zA-Z0-9]{4,9}") ) 
				errMsgs.put("e_id", "아이디는 5~10자리의 영문 및 숫자의 조합이어야 합니다.");
			if( mVO.getPw()== null || !mVO.getPw().matches("[a-zA-Z0-9!@#$%^&*()]{5,10}") )
				errMsgs.put("e_pw", "비밀번호는 5~10자리의 영문,숫자,특수문자의 조합이어야 합니다.");
			if( mVO.getName()==null || !mVO.getName().matches("[a-zA-Zㄱ-�R]{2,6}"))
				errMsgs.put("e_name", "이름은 한글 또는 영문으로 최소 2~6 글자로 입력 해주세요.");
			if( mVO.getNickname()==null || !mVO.getNickname().matches("[a-zA-Zㄱ-�R0-9]{2,8}"))
				errMsgs.put("e_nickname", "닉네임은 한글,영문,숫자 조합으로 2~8 글자 이어야 합니다.");
			if( mVO.getBirth()==null || !mVO.getBirth().matches("[0-9]{6}"))
				errMsgs.put("e_birth", "생년월일은 6자리 숫자로만 입력가능합니다.");
			if( mVO.getEmail()==null || !mVO.getEmail().matches("[a-zA-Z][a-zA-Z0-9!@#$%^&*()_+-=]{0,12}[@][a-zA-Z]{1,8}[.][a-zA-Z]{1,5}"))
				errMsgs.put("e_email", "이메일은 영문, 숫자의 조합으로 반드시 @를 포함해야 합니다. 예시) matna@kosta.com");
			if( mVO.getPhone()==null || !mVO.getPhone().matches("[0-9]{9,12}"))
				errMsgs.put("e_phone", "연락처는 9~12 자리의 숫자만 입력가능 합니다. 예시)02-213-3535");
			if( mVO.getPost()==null || !mVO.getPost().matches("[0-9]{5}"))
				errMsgs.put("e_post", "우편번호는 숫자 5자리만 입력가능합니다.");
			if( isNullOrEmpty(mVO.getAddr()) ) errMsgs.put("e_addr", "주소를 입력해주세요.");
			break;
		case "BoardVO" : // # BoardVO : title, content
			BoardVO board = (BoardVO) vo;
			if( isNullOrEmpty(board.getTitle()) ) errMsgs.put("e_title", "제목을 입력해주세요.");
//			if( hasSpecialLetters(board.getTitle()) ) errMsgs.put("e_title", "특수문자는 사용불가능합니다.");
			if( isNullOrEmpty(board.getContent()) ) errMsgs.put("e_content", "내용을 입력해주세요.");
			break;
		
		case "RecipeVO" : // # RecipeVO : ingredient, foodname, price, time, title, content
			RecipeVO recipe = (RecipeVO) vo;
			if( isNullOrEmpty(recipe.getIngredient()) ) errMsgs.put("e_ingredient", "재료를 입력해주세요.");
			if( hasSpecialLetters(recipe.getIngredient()) ) errMsgs.put("e_ingredient", "특수문자는 사용불가능합니다.");
			if( isNullOrEmpty(recipe.getFoodName()) ) errMsgs.put("e_foodName", "음식명을 입력해주세요.");
			if( hasSpecialLetters(recipe.getFoodName()) ) errMsgs.put("e_foodName", "특수문자는 사용불가능합니다.");
			if( isNullOrEmpty(recipe.getPrice()) || !recipe.getPrice().matches("[0-9]+") ) 
				errMsgs.put("e_price", "가격은 숫자만 입력 가능합니다.");
			if( isNullOrEmpty(recipe.getTime()) || !recipe.getTime().matches("[0-9]+") ) 
				errMsgs.put("e_time", "요리시간은 숫자만 입력 가능합니다.");
			if( isNullOrEmpty(recipe.getTitle()) ) errMsgs.put("e_title", "제목을 입력 해주세요.");
//			if( hasSpecialLetters(recipe.getTitle()) ) errMsgs.put("e_title", "특수문자는 사용불가능합니다.");
			if( isNullOrEmpty(recipe.getContent()) ) errMsgs.put("e_content", "내용을 입력 해주세요.");
			break;
		}
		
		// @ errMsgs 맵이 빈값이 아닐��.. ( 즉 유효성 검사에 걸린 값이 있다면 ) false 리턴.
		System.out.println("Validator_isEmpty  : "+errMsgs.isEmpty());
		if ( !errMsgs.isEmpty() ) {
			errMsgs.put("isValid", "invalid"); 
			return false; 
		}else{
			errMsgs.put("isValid", "valid"); 
			return true;
		}
	}
	
	// # 널 또는 빈값 체크해주는 메소드
	private static boolean isNullOrEmpty(String value){
		if(value==null || value.trim().length()==0) return true;
		return false;
	}
	
	// # 특수문자입력 방지해주는 메소드
	private static boolean hasSpecialLetters(String value){
		if( !value.matches("[a-zA-Zㄱ-ㅎ가-�R0-9 ]+") ) return true;
		else return false;
	}
	
	public static Map<String,String> getErrMsgs(){
		System.out.println("errMsgs = "+errMsgs.keySet());
		System.out.println("errMsgs[val] = "+errMsgs.values());
		return errMsgs;
	}
}
