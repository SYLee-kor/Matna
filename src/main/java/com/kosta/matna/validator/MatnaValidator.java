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
		// # ÀÔ·Â ¹ŞÀº voName °ªÀ» ÅëÇØ À¯È¿¼º °Ë»ç ¿µ¿ªÀ» ³ª´©°í ÇØ´ç °Ë»ç ÀÛ¾÷ ½ÇÇà ÈÄ
		// errMsgs(¿¡·¯¸Ş¼¼Áö) ¸¦ ¸®ÅÏÇØÁØ´Ù.
		System.out.println("Validator ½ÇÇà  - "+voName);
		switch (voName) {
		case "ReviewVO": // # ReviewVO : title, content
			ReviewVO rVO = (ReviewVO) vo;
			if( isNullOrEmpty(rVO.getTitle()) ) errMsgs.put("e_title","Á¦¸ñÀ» ÀÔ·ÂÇØÁÖ¼¼¿ä.");
			if( isNullOrEmpty(rVO.getContent())) errMsgs.put("e_content", "³»¿ëÀ» ÀÔ·ÂÇØÁÖ¼¼¿ä.");
			break;
		case "PreviewVO" : // # PreviewVO : recommend, gu, dong, addr, phone
			PreviewVO pVO = (PreviewVO) vo;
			if( isNullOrEmpty(pVO.getRecommend()) ) errMsgs.put("e_recommend", "ÃßÃµ ¸Ş´º¸¦ ÀÔ·ÂÇØÁÖ¼¼¿ä.");
			if( pVO.getGu().equals("±¸") ) errMsgs.put("e_gu", "±¸¸¦ ¼±ÅÃÇØ ÁÖ¼¼¿ä.");
			if( pVO.getDong().equals("µ¿") ) errMsgs.put("e_dong", "µ¿À» ¼±ÅÃÇØ ÁÖ¼¼¿ä.");
			if( isNullOrEmpty(pVO.getAddr()) ) errMsgs.put("e_addr", "»ó¼¼ÁÖ¼Ò¸¦ ÀÔ·ÂÇØÁÖ¼¼¿ä.");
			if( isNullOrEmpty(pVO.getPhone()) ) errMsgs.put("e_phone", "ÀüÈ­¹øÈ£¸¦ ÀÔ·ÂÇØÁÖ¼¼¿ä.");
			if( pVO.getMenu()== null || pVO.getMenu().equals("menu"))
				errMsgs.put("e_menu", "¸Ş´º¸¦ ¼±ÅÃÇØÁÖ¼¼¿ä.");
			if( pVO.getPrice()==null || pVO.getPrice().equals("0,0"))
				errMsgs.put("e_price", "°¡°İÀ» ¼±ÅÃÇØÁÖ¼¼¿ä.");
			break;
		case "MemberVO" : // # MemberVO : id, pw, name, nickname, birth, email, phone, post, addr
			MemberVO mVO = (MemberVO) vo;
			if( mVO.getId()== null || !mVO.getId().matches("[a-zA-Z]{1}[a-zA-Z0-9]{4,9}") ) 
				errMsgs.put("e_id", "¾ÆÀÌµğ´Â 5~10ÀÚ¸®ÀÇ ¿µ¹® ¹× ¼ıÀÚÀÇ Á¶ÇÕÀÌ¾î¾ß ÇÕ´Ï´Ù.");
			if( mVO.getPw()== null || !mVO.getPw().matches("[a-zA-Z0-9!@#$%^&*()]{5,10}") )
				errMsgs.put("e_pw", "ºñ¹Ğ¹øÈ£´Â 5~10ÀÚ¸®ÀÇ ¿µ¹®,¼ıÀÚ,Æ¯¼ö¹®ÀÚÀÇ Á¶ÇÕÀÌ¾î¾ß ÇÕ´Ï´Ù.");
			if( mVO.getName()==null || !mVO.getName().matches("[a-zA-Z¤¡-ÆR]{2,6}"))
				errMsgs.put("e_name", "ÀÌ¸§Àº ÇÑ±Û ¶Ç´Â ¿µ¹®À¸·Î ÃÖ¼Ò 2~6 ±ÛÀÚ·Î ÀÔ·Â ÇØÁÖ¼¼¿ä.");
			if( mVO.getNickname()==null || !mVO.getNickname().matches("[a-zA-Z¤¡-ÆR0-9]{2,8}"))
				errMsgs.put("e_nickname", "´Ğ³×ÀÓÀº ÇÑ±Û,¿µ¹®,¼ıÀÚ Á¶ÇÕÀ¸·Î 2~8 ±ÛÀÚ ÀÌ¾î¾ß ÇÕ´Ï´Ù.");
			if( mVO.getBirth()==null || !mVO.getBirth().matches("[0-9]{6}"))
				errMsgs.put("e_birth", "»ı³â¿ùÀÏÀº 6ÀÚ¸® ¼ıÀÚ·Î¸¸ ÀÔ·Â°¡´ÉÇÕ´Ï´Ù.");
			if( mVO.getEmail()==null || !mVO.getEmail().matches("[a-zA-Z][a-zA-Z0-9!@#$%^&*()_+-=]{0,12}[@][a-zA-Z]{1,8}[.][a-zA-Z]{1,5}"))
				errMsgs.put("e_email", "ÀÌ¸ŞÀÏÀº ¿µ¹®, ¼ıÀÚÀÇ Á¶ÇÕÀ¸·Î ¹İµå½Ã @¸¦ Æ÷ÇÔÇØ¾ß ÇÕ´Ï´Ù. ¿¹½Ã) matna@kosta.com");
			if( mVO.getPhone()==null || !mVO.getPhone().matches("[0-9]{9,12}"))
				errMsgs.put("e_phone", "¿¬¶ôÃ³´Â 9~12 ÀÚ¸®ÀÇ ¼ıÀÚ¸¸ ÀÔ·Â°¡´É ÇÕ´Ï´Ù. ¿¹½Ã)02-213-3535");
			if( mVO.getPost()==null || !mVO.getPost().matches("[0-9]{5}"))
				errMsgs.put("e_post", "¿ìÆí¹øÈ£´Â ¼ıÀÚ 5ÀÚ¸®¸¸ ÀÔ·Â°¡´ÉÇÕ´Ï´Ù.");
			if( isNullOrEmpty(mVO.getAddr()) ) errMsgs.put("e_addr", "ÁÖ¼Ò¸¦ ÀÔ·ÂÇØÁÖ¼¼¿ä.");
			break;
		case "BoardVO" : // # BoardVO : title, content
			BoardVO board = (BoardVO) vo;
			if( isNullOrEmpty(board.getTitle()) ) errMsgs.put("e_title", "Á¦¸ñÀ» ÀÔ·ÂÇØÁÖ¼¼¿ä.");
			if( isNullOrEmpty(board.getContent()) ) errMsgs.put("e_content", "³»¿ëÀ» ÀÔ·ÂÇØÁÖ¼¼¿ä.");
			break;
		
		case "RecipeVO" : // # RecipeVO : ingredient, foodname, price, time, title, content
			RecipeVO recipe = (RecipeVO) vo;
			if( isNullOrEmpty(recipe.getIngredient()) ) errMsgs.put("e_ingredient", "Àç·á¸¦ ÀÔ·ÂÇØÁÖ¼¼¿ä.");
			if( isNullOrEmpty(recipe.getFoodName()) ) errMsgs.put("e_foodName", "À½½Ä¸íÀ» ÀÔ·ÂÇØÁÖ¼¼¿ä.");
			if( isNullOrEmpty(recipe.getPrice()) || !recipe.getPrice().matches("[0-9]+") ) 
				errMsgs.put("e_price", "°¡°İÀº ¼ıÀÚ¸¸ ÀÔ·Â °¡´ÉÇÕ´Ï´Ù.");
			if( isNullOrEmpty(recipe.getTime()) || !recipe.getTime().matches("[0-9]+") ) 
				errMsgs.put("e_time", "¿ä¸®½Ã°£Àº ¼ıÀÚ¸¸ ÀÔ·Â °¡´ÉÇÕ´Ï´Ù.");
			if( isNullOrEmpty(recipe.getTitle()) ) errMsgs.put("e_title", "Á¦¸ñÀ» ÀÔ·Â ÇØÁÖ¼¼¿ä.");
			if( isNullOrEmpty(recipe.getContent()) ) errMsgs.put("e_content", "³»¿ëÀ» ÀÔ·Â ÇØÁÖ¼¼¿ä.");
			break;
		}
		
		// @ errMsgs ¸ÊÀÌ ºó°ªÀÌ ¾Æ´Ò‹š.. ( Áï À¯È¿¼º °Ë»ç¿¡ °É¸° °ªÀÌ ÀÖ´Ù¸é ) false ¸®ÅÏ.
		System.out.println("Validator_isEmpty  : "+errMsgs.isEmpty());
		if ( !errMsgs.isEmpty() ) {
			errMsgs.put("isValid", "invalid"); 
			return false; 
		}else{
			errMsgs.put("isValid", "valid"); 
			return true;
		}
	}
	
	// # ³Î ¶Ç´Â ºó°ª Ã¼Å©ÇØÁÖ´Â ¸Ş¼Òµå
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
