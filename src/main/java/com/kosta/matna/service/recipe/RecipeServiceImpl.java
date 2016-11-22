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
	public List<RecipeVO> readList(Map<String,Object> map, RowBounds rowBounds) throws Exception {
		return dao.readList(map, rowBounds);
	}

	@Override
	public int getTotalCount() throws Exception {
		return dao.getTotalCount();
	}

	@Override
	public String likesUp(int no, int writer) throws Exception {
		if( !dao.findLikes(no, writer) ){ // # ���ƿ並 ���� ������ �ϱ�!
			if(dao.addLikes(no, writer) && dao.likesUp(no)) return "add_success";
			else return "add_fail";
		}else{ // # �̹� �ߴٸ� �ٽ� ���!!
			if(dao.removeLikes(no, writer) && dao.likesUp(no)) return "remove_success";
			else return "remove_fail";
		}
	}

	@Override
	public String getLikeRecipies(int userNo) throws Exception {
		List<Integer> likesList = dao.getLikeRecipies(userNo);
		String likeNums ="";
		for (int i = 0; i < likesList.size(); i++) {
			likeNums += likesList.get(i);
			if( i < likesList.size()-1 ) likeNums+=",";
		}
		return likeNums;
	}
	
	
}
