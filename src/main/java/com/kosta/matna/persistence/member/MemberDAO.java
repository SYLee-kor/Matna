package com.kosta.matna.persistence.member;

import java.util.List;

import com.kosta.matna.domain.member.MemberVO;

public interface MemberDAO {
	public boolean insertMember(MemberVO member)throws Exception;
	public List<MemberVO> selectMember()throws Exception;
	public List<MemberVO> selectNickname(String nickname)throws Exception;
	public MemberVO selectID(String id)throws Exception;
	public MemberVO selectNo(int no)throws Exception;
	public void update(MemberVO member)throws Exception;
	public void delete(int no)throws Exception;
	public boolean checkID(String id)throws Exception;
	public boolean checkNickname(String nickname) throws Exception;
	public MemberVO selectIsMember(String id, String pw)throws Exception;
}
