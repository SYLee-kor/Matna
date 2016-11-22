package com.kosta.matna.service.recipe;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.recipe.RecipeVO;

public interface RecipeService {
	boolean registRecipe(RecipeVO review) throws Exception;
	boolean modifyRecipe(RecipeVO review) throws Exception;
	
	boolean viewCntUp(int no) throws Exception;
	boolean removeRecipe(int no) throws Exception;
	String getLikeRecipies(int userNo) throws Exception;
	String likesUp(int no,int writer) throws Exception;
	
	int getTotalCount() throws Exception;
	RecipeVO readRecipe(int no)throws Exception;
	List<RecipeVO> readList(Map<String,Object> map, RowBounds rowBounds) throws Exception;
}
