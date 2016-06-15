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

		@Override
		public boolean checkNickname(String nickname) throws Exception {
			return memberDAO.checkNickname(nickname);
		}

		@Override
		public MemberVO selectIsMember(String id, String pw) throws Exception {
			return memberDAO.selectIsMember(id, pw);
		}

		@Override
		public MemberVO selectNo(int no) throws Exception {
			return memberDAO.selectNo(no);
		}

		@Override
		public List<MemberVO> selectNickname(String nickname) throws Exception {
			return memberDAO.selectNickname(nickname);
		}

		@Override
		public int selectAllCount() throws Exception {
			return memberDAO.selectAllCount();
		}

		@Override
		public List<MemberVO> selectAllPage(int start, int end) throws Exception {
			return memberDAO.selectAllPage(start, end);
		}
	
}