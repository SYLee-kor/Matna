package com.kosta.matna.service.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matna.domain.member.MemberVO;
import com.kosta.matna.persistence.member.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberVO member) throws Exception {
		memberDAO.insertMember(member);
	}

	@Override
	public List<MemberVO> listAll() throws Exception {
		return memberDAO.selectMember();
	}

	@Override
	public MemberVO selectID(String id) throws Exception {
		return memberDAO.selectID(id);
	}

	@Override
	public void update(MemberVO member) throws Exception {
		memberDAO.update(member);
	}

	@Override
	public void delete(int no) throws Exception {
		memberDAO.delete(no);
	}

	@Override
	public boolean checkID(String id) throws Exception {
		return memberDAO.checkID(id);
	}

}
