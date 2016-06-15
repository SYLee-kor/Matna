package com.kosta.matna.persistence.member;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matna.domain.member.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession session;

	public MemberDAOImpl() {
	}
	
	@Override
	public boolean insertMember(MemberVO member)throws Exception {
		if(member.getGender().equals(",��"))
			member.setGender("��");
		else if(member.getGender().equals(",��"))
			member.setGender("��");
		
		System.out.println(member.getId() + "/" + member.getPw() + "/" + member.getName() + "/" + member.getEmail()
		+ "/" + member.getGender() + "/" + member.getBirth() + "/" + member.getPhone() + "/" + member.getAddr()
		+ "/" + member.getPost());
		
		session.insert("member.insertMember", member);
		return true;
	}// insertMember

	@Override
	public List<MemberVO> selectMember() throws Exception {
		return session.selectList("member.selectMember");
		
	}

	@Override
	public MemberVO selectID(String id) throws Exception {
		return session.selectOne("member.selectID",id);
	}

	@Override
	public MemberVO selectNo(int no) throws Exception {
		return session.selectOne("member.selectNo",no);
	}
	
	@Override
	public void update(MemberVO member) throws Exception {
		session.update("member.update", member);
	}

	@Override
	public void delete(int no) throws Exception {
		session.delete("member.delete",no);
		
	}

	@Override
	public boolean checkID(String id) throws Exception {
		Object check = session.selectOne("member.selectID", id);
		if(check==null)
			return false;
		else
			return true;
	}

	@Override
	public boolean checkNickname(String nickname) throws Exception {
		Object check = session.selectOne("member.selectNickname", nickname);
		if(check==null)
			return false;
		else
			return true;
	}

	@Override
	public MemberVO selectIsMember(String id, String pw) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		
		MemberVO member = session.selectOne("member.selectIsMember",map);
		
		return member;
	}

	@Override
	public List<MemberVO> selectNickname(String nickname) throws Exception {
		return session.selectList("member.searchNickname",nickname);
	}
}
