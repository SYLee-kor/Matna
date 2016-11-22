package com.kosta.matna.validator;

import java.util.HashMap;
import java.util.Map;

import com.kosta.matna.domain.community.BoardVO;
import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.domain.recipe.RecipeVO;
import com.kosta.matna.domain.review.PreviewVO;
import com.kosta.matna.domain.review.ReviewVO;

public class MatnaValidator {

	private static Map<String,String> errMsgs;

	public static boolean isValid(Object vo, String voName) {
		errMsgs = new HashMap<>();
		// # �Է� ���� voName ���� ���� ��ȿ�� �˻� ������ ������ �ش� �˻� �۾� ���� ��
		// errMsgs(�����޼���) �� �������ش�.
		System.out.println("Validator ����  - "+voName);
		switch (voName) {
		case "ReviewVO": // # ReviewVO : title, content
			ReviewVO rVO = (ReviewVO) vo;
			if( isNullOrEmpty(rVO.getTitle()) ) errMsgs.put("e_title","������ �Է����ּ���.");
			if( isNullOrEmpty(rVO.getContent())) errMsgs.put("e_content", "������ �Է����ּ���.");
			break;
		case "PreviewVO" : // # PreviewVO : recommend, gu, dong, addr, phone
			PreviewVO pVO = (PreviewVO) vo;
			if( isNullOrEmpty(pVO.getRecommend()) ) errMsgs.put("e_recommend", "��õ �޴��� �Է����ּ���.");
			if( pVO.getGu().equals("��") ) errMsgs.put("e_gu", "���� ������ �ּ���.");
			if( pVO.getDong().equals("��") ) errMsgs.put("e_dong", "���� ������ �ּ���.");
			if( isNullOrEmpty(pVO.getAddr()) ) errMsgs.put("e_addr", "���ּҸ� �Է����ּ���.");
			if( isNullOrEmpty(pVO.getPhone()) ) errMsgs.put("e_phone", "��ȭ��ȣ�� �Է����ּ���.");
			if( pVO.getMenu()== null || pVO.getMenu().equals("menu"))
				errMsgs.put("e_menu", "�޴��� �������ּ���.");
			if( pVO.getPrice()==null || pVO.getPrice().equals("0,0"))
				errMsgs.put("e_price", "������ �������ּ���.");
			break;
		case "MemberVO" : // # MemberVO : id, pw, name, nickname, birth, email, phone, post, addr
			MemberVO mVO = (MemberVO) vo;
			if( mVO.getId()== null || !mVO.getId().matches("[a-zA-Z]{1}[a-zA-Z0-9]{4,9}") ) 
				errMsgs.put("e_id", "���̵�� 5~10�ڸ��� ���� �� ������ �����̾�� �մϴ�.");
			if( mVO.getPw()== null || !mVO.getPw().matches("[a-zA-Z0-9!@#$%^&*()]{5,10}") )
				errMsgs.put("e_pw", "��й�ȣ�� 5~10�ڸ��� ����,����,Ư�������� �����̾�� �մϴ�.");
			if( mVO.getName()==null || !mVO.getName().matches("[a-zA-Z��-�R]{2,6}"))
				errMsgs.put("e_name", "�̸��� �ѱ� �Ǵ� �������� �ּ� 2~6 ���ڷ� �Է� ���ּ���.");
			if( mVO.getNickname()==null || !mVO.getNickname().matches("[a-zA-Z��-�R0-9]{2,8}"))
				errMsgs.put("e_nickname", "�г����� �ѱ�,����,���� �������� 2~8 ���� �̾�� �մϴ�.");
			if( mVO.getBirth()==null || !mVO.getBirth().matches("[0-9]{6}"))
				errMsgs.put("e_birth", "��������� 6�ڸ� ���ڷθ� �Է°����մϴ�.");
			if( mVO.getEmail()==null || !mVO.getEmail().matches("[a-zA-Z][a-zA-Z0-9!@#$%^&*()_+-=]{0,12}[@][a-zA-Z]{1,8}[.][a-zA-Z]{1,5}"))
				errMsgs.put("e_email", "�̸����� ����, ������ �������� �ݵ�� @�� �����ؾ� �մϴ�. ����) matna@kosta.com");
			if( mVO.getPhone()==null || !mVO.getPhone().matches("[0-9]{9,12}"))
				errMsgs.put("e_phone", "����ó�� 9~12 �ڸ��� ���ڸ� �Է°��� �մϴ�. ����)02-213-3535");
			if( mVO.getPost()==null || !mVO.getPost().matches("[0-9]{5}"))
				errMsgs.put("e_post", "�����ȣ�� ���� 5�ڸ��� �Է°����մϴ�.");
			if( isNullOrEmpty(mVO.getAddr()) ) errMsgs.put("e_addr", "�ּҸ� �Է����ּ���.");
			break;
		case "BoardVO" : // # BoardVO : title, content
			BoardVO board = (BoardVO) vo;
			if( isNullOrEmpty(board.getTitle()) ) errMsgs.put("e_title", "������ �Է����ּ���.");
			if( isNullOrEmpty(board.getContent()) ) errMsgs.put("e_content", "������ �Է����ּ���.");
			break;
		
		case "RecipeVO" : // # RecipeVO : ingredient, foodname, price, time, title, content
			RecipeVO recipe = (RecipeVO) vo;
			if( isNullOrEmpty(recipe.getIngredient()) ) errMsgs.put("e_ingredient", "��Ḧ �Է����ּ���.");
			if( isNullOrEmpty(recipe.getFoodName()) ) errMsgs.put("e_foodName", "���ĸ��� �Է����ּ���.");
			if( isNullOrEmpty(recipe.getPrice()) || !recipe.getPrice().matches("[0-9]+") ) 
				errMsgs.put("e_price", "������ ���ڸ� �Է� �����մϴ�.");
			if( isNullOrEmpty(recipe.getTime()) || !recipe.getTime().matches("[0-9]+") ) 
				errMsgs.put("e_time", "�丮�ð��� ���ڸ� �Է� �����մϴ�.");
			if( isNullOrEmpty(recipe.getTitle()) ) errMsgs.put("e_title", "������ �Է� ���ּ���.");
			if( isNullOrEmpty(recipe.getContent()) ) errMsgs.put("e_content", "������ �Է� ���ּ���.");
			break;
		}
		
		// @ errMsgs ���� ���� �ƴҋ�.. ( �� ��ȿ�� �˻翡 �ɸ� ���� �ִٸ� ) false ����.
		System.out.println("Validator_isEmpty  : "+errMsgs.isEmpty());
		if ( !errMsgs.isEmpty() ) {
			errMsgs.put("isValid", "invalid"); 
			return false; 
		}else{
			errMsgs.put("isValid", "valid"); 
			return true;
		}
	}
	
	// # �� �Ǵ� �� üũ���ִ� �޼ҵ�
	private static boolean isNullOrEmpty(String value){
		if(value==null || value.trim().length()==0) return true;
		return false;
	}
	
	public static Map<String,String> getErrMsgs(){
		System.out.println("errMsgs = "+errMsgs.keySet());
		System.out.println("errMsgs[val] = "+errMsgs.values());
		return errMsgs;
	}
}
