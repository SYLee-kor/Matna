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

		@Override
		public List<MemberVO> selectSearchList(String nickname, int start, int end) throws Exception {
			return memberDAO.selectSearchList(nickname, start, end);
		}

		@Override
		public int selectSearchCount(String nickname) throws Exception {
			return memberDAO.selectSearchCount(nickname);
		}

		@Override
		public String findPw(String id, String email, String name) throws Exception {
			return memberDAO.findPw(id, email, name);
		}

		@Override
		public String findId(String email, String name) throws Exception {
			return memberDAO.findId(email, name);
		}

		@Override
		public void updatePW(String id, String email, String pw) throws Exception {
			memberDAO.updatePW(id, email, pw);
		}

		@Override
		public List<String> selectGbGender(int rno) throws Exception {
			return memberDAO.selectGbGender(rno);
		}

		@Override
		public boolean updatePoint(int userNo, int point) throws Exception {
			return memberDAO.updatePoint(userNo, point);
		}

		@Override
		public boolean updateAllPoint(int userNo, int point) throws Exception {
			return memberDAO.updateAllPoint(userNo, point);
		}

		@Override
		public boolean updateGrade(int userNo, int grade) throws Exception {
			return memberDAO.updateGrade(userNo, grade);
		}

		@Override
		public boolean duplEmail(String email) throws Exception {
			return memberDAO.duplEmail(email);
		}
	
}