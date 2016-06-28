package com.kosta.matna.service.recipe;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matna.domain.recipe.RecipeVO;
import com.kosta.matna.persistence.recipe.RecipeDAO;

@Transactional
@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Inject
	RecipeDAO dao;
	
	@Override
	public boolean registRecipe(RecipeVO recipe) throws Exception {
		if(dao.insertRecipe(recipe) && dao.insertPrecipe(recipe))return true;
		return false;
	}
	
	@Override
	public boolean modifyRecipe(RecipeVO recipe) throws Exception {
		if(dao.updateRecipe(recipe) && dao.updatePrecipe(recipe))return true;
		return false;
	}

	@Override
	public boolean viewCntUp(int no) throws Exception {
		return dao.viewCntUp(no);
	}

	@Override
	public boolean removeRecipe(int no) throws Exception {
		if(dao.removeAllLikes(no) && 
				dao.deletePrecipe(no) && dao.deleteRecipe(no))return true;
		return false;
	}

	@Override
	public RecipeVO readRecipe(int no) throws Exception {
		RecipeVO recipe = dao.readRecipe(no);
		dao.viewCntUp(no); //# ��ȸ�� ����
		return recipe;
	}

	@Override
	public List<RecipeVO> readList(String pageType,int userNo, RowBounds rowBounds) throws Exception {
		return dao.readList(pageType,userNo, rowBounds);
	}

	@Override
	public int getTotalCount() throws Exception {
		return dao.getTotalCount();
	}

	@Override
	public boolean likesUp(int no, int writer) throws Exception {
		if( !dao.findLikes(no, writer) ){ // # ���ƿ並 ���� ������ �ϱ�!
			if(dao.addLikes(no, writer) && dao.likesUp(no)) return true;
			else return false;
		}else{ // # �̹� �ߴٸ� �ٽ� ���!!
			if(dao.removeLikes(no, writer) && dao.likesUp(no)) return true;
			else return false;
		}
	}

	@Override
	public List<Integer> getLikeRecipies(int userNo) throws Exception {
		return dao.getLikeRecipies(userNo);
	}
	
	
}
