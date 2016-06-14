package com.kosta.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matna.admin.email.EmailSender;
import com.kosta.matna.domain.admin.Email;
import com.kosta.matna.domain.community.BoardTypeVO;
import com.kosta.matna.domain.community.BoardVO;
import com.kosta.matna.persistence.community.CommunityDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

	@Inject
	private CommunityDAO dao;
	
	 @Autowired
	   private EmailSender emailSender;
	   @Autowired
	   private Email email;

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
	
//	@Test
//	public void testDelete() throws Exception{
//		   dao.delete(1, new BoardTypeVO("free"));
//	}

//	@Test
//	public void testSelect() throws Exception {
//		// List<BoardVO> list = dao.testSelect();
//		List<BoardVO> list = dao.listAll(new BoardTypeVO("free"));
//		System.out.println("첫번째 데이터:" + list.get(0).getNo());
//		System.out.println("list의 사이즈:" + list.size());
//		System.out.println("1번의 본문:" + list.get(0).getContent());
//	}
	
	@Test
	public void testEmail() throws Exception{
		email.setContent("테스트는 완벽하지");
        email.setReceiver("hsj1172@gmail.com");
        email.setSubject("mail Test");
        emailSender.SendEmail(email);
	}

}
