package com.kosta.matna.persistence.recipe;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kosta.matna.domain.recipe.RecipeVO;

public interface RecipeDAO {
	boolean insertRecipe(RecipeVO vo) throws Exception;
	boolean insertPrecipe(RecipeVO vo) throws Exception;
	
	boolean updateRecipe(RecipeVO vo) throws Exception;
	boolean updatePrecipe(RecipeVO vo)throws Exception;
	
	boolean viewCntUp(int no) throws Exception;
	boolean replyCntUp(int no) throws Exception;
	
	boolean deleteRecipe(int no) throws Exception;
	boolean deletePrecipe(int no) throws Exception;
	
	int getTotalCount() throws Exception;
	
	RecipeVO readRecipe(int no)throws Exception;
	
	List<RecipeVO> readList(String pageType, RowBounds rowBounds) throws Exception;
}
