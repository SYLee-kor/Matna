package com.kosta.matna.persistence.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.recipe.RecipeVO;

@Repository
public class RecipeDAOImpl implements RecipeDAO {

	@Inject
	SqlSession session;
	
	@Override
	public boolean insertRecipe(RecipeVO vo) throws Exception {
		if(session.insert("recipe.insert", vo)==1) return true;
		return false;
	}

	@Override
	public boolean insertPrecipe(RecipeVO vo) throws Exception {
		if(session.insert("precipe.insert",vo)==1)return true;
		return false;
	}

	@Override
	public boolean updateRecipe(RecipeVO vo) throws Exception {
		if(session.update("recipe.update", vo)==1)return true;
		return false;
	}

	@Override
	public boolean updatePrecipe(RecipeVO vo) throws Exception {
		if(session.update("precipe.update", vo)==1)return true;
		return false;
	}

	@Override
	public boolean viewCntUp(int no) throws Exception {
		if(session.update("recipe.viewCntUp", no)==1)return true;
		return false;
	}
	
	@Override
	public boolean replyCntUp(int no) throws Exception {
		if(session.update("recipe.replyCntUp",no)==1) return true;
		return false;
	}

	
	@Override
	public boolean deleteRecipe(int no) throws Exception {
		if(session.delete("recipe.delete", no)==1)return true;
		return false;
	}

	@Override
	public boolean deletePrecipe(int no) throws Exception {
		if(session.delete("precipe.delete", no)==1)return true;
		return false;
	}

	@Override
	public List<RecipeVO> readList(Map<String,Object> map, RowBounds rowBounds) throws Exception {
		System.out.println("searchKey : "+map.get("searchKey"));
		System.out.println("keyword : "+map.get("keyword"));
		return session.selectList("recipe.selectList", map, rowBounds);
	}

	@Override
	public RecipeVO readRecipe(int no) throws Exception {
		return session.selectOne("recipe.selectOne", no);
	}

	@Override
	public int getTotalCount() throws Exception {
		return session.selectOne("recipe.totalCount");
	}

	@Override
	public boolean likesUp(int no) throws Exception {
		if( session.update("recipe.likesUp", no)==1 ) return true;
		return false;
	}

	@Override
	public boolean addLikes(int no, int userNo) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("no",no);
		map.put("userNo", userNo);
		if( session.insert("recipe.addLikes",map) == 1) return true;
		return false;
	}

	@Override
	public boolean removeLikes(int no, int userNo) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("no",no);
		map.put("userNo", userNo);
		if(session.delete("recipe.removeLikes", map) ==1 )return true;
		return false;
	}

	@Override
	public boolean findLikes(int no, int userNo) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("no",no);
		map.put("userNo", userNo);
		if( (int)session.selectOne("recipe.findLikes", map) > 0 ) return true;
		return false;
	}

	@Override
	public boolean removeAllLikes(int no) throws Exception {
		if(session.delete("recipe.removeAllLikes", no) >=0 )return true;
		return false;
	}

	@Override
	public List<Integer> getLikeRecipies(int userNo) throws Exception {
		return session.selectList("recipe.getLikeRecipies", userNo);
	}
}
