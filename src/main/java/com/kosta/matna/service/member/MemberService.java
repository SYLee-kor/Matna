package com.kosta.matna.service.member;

import java.util.List;

import com.kosta.matna.domain.member.MemberVO;

public interface MemberService {
	public void insertMember(MemberVO member)throws Exception;
	public List<MemberVO> listAll()throws Exception;
	public List<MemberVO> selectNickname(String nickname)throws Exception;
	public MemberVO selectID(String id)throws Exception;
	public MemberVO selectNo(int no)throws Exception;
	public void update(MemberVO member) throws Exception;
	public void delete(int no) throws Exception;
	public boolean checkID(String id)throws Exception;
	public boolean checkNickname(String id)throws Exception;
	public MemberVO selectIsMember(String id, String pw)throws Exception;
	public int selectAllCount()throws Exception;
	public List<MemberVO> selectAllPage(int start, int end)throws Exception;
	public List<MemberVO> selectSearchList(String nickname, int start, int end)throws Exception;
	public int selectSearchCount(String nickname)throws Exception;
	
}