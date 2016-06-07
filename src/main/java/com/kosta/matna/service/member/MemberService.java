package com.kosta.matna.service.member;

import java.util.List;

import com.kosta.matna.domain.member.MemberVO;

public interface MemberService {
	public void insertMember(MemberVO member)throws Exception;
	public List<MemberVO> listAll()throws Exception;
	public MemberVO selectID(String id)throws Exception;
	public void update(MemberVO member) throws Exception;
	public void delete(int no) throws Exception;
	public boolean checkID(String id)throws Exception;
}
