package com.kosta.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matna.domain.community.boardVO;
import com.kosta.matna.persistence.community.BoardTypeDAO;
import com.kosta.matna.persistence.community.FreeBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

	@Inject
	private FreeBoardDAO dao;

//	@Test
//	public void testInsert() throws Exception {
//		boardVO vo = new boardVO();
//		vo.setType("free".trim());
//		vo.setTitle("Matna Test2");
//		vo.setContent("test2");
//		vo.setWriter("admin");
//		dao.create(vo);
//	}
/*	@Test
	public void testUpdate() throws Exception{
		boardVO vo = new boardVO();
		vo.setNo(1);
		vo.setType("free".trim());
		vo.setTitle("Matna Test update");
		vo.setContent("test2");
		vo.setWriter("admin");
		dao.update(vo);
	}*/
	
	@Test
	public void testDelete() throws Exception{
		   dao.delete(1, new BoardTypeDAO("free"));
	}

	@Test
	public void testSelect() throws Exception {
		// List<BoardVO> list = dao.testSelect();
		List<boardVO> list = dao.listAll(new BoardTypeDAO("free"));
		System.out.println("첫번째 데이터:" + list.get(0).getNo());
		System.out.println("list의 사이즈:" + list.size());
	}
	
	

}
