package com.kosta.matna.persistence.member;

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
		System.out.println("MemberDAOImpl생성자!!");
	}
	
	@Override
	public boolean insertMember(MemberVO member)throws Exception {
		if(member.getGender().equals(",남"))
			member.setGender("남");
		else if(member.getGender().equals(",여"))
			member.setGender("여");
		
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
		//System.out.println(check);
		if(check==null)
			return false;
		else
			return true;
	}

	/*public int selectCnt(String id, String pass) {
		int cnt = 0;
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		try {
			cnt = (int) smc.queryForObject("member.selectCnt", map);
			System.out.println(cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}

	public int selectPoint(String id) {
		int point = 0;
		try {
			point = (int) smc.queryForObject("member.selectPoint", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return point;
	}

	public String findID(String name, String email) {
		String result = name; // # name,id,result 세 가지 정보
		try {
			HashMap<String, String> map = new HashMap<>();
			map.put("name", name);
			map.put("email", email);

			String id = (String) smc.queryForObject("member.findID", map); // #
																			// 결과값이
																			// 하나이므로
																			// queryForObject

			if (id != null) // # 일치하는 아이디가 있다면..
				result += "," + id + ",success";
			else // # 일치하는 아이디가 없다면..
				result += ",,fail";

		} catch (SQLException e) {
			e.printStackTrace();
			result += ",,fail";
		}
		return result;
	}

	public MemberInfo select(String id) {
		MemberInfo member = null;

		try {
			member = (MemberInfo) smc.queryForObject("member.select", id);
			member.setId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return member;
	}

	public boolean update(MemberInfo member) {
		try {
			smc.update("member.update", member);
			System.out.println("수정");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	public String findPass(String name, String id, String email) {
		String result = name;
		try {
			HashMap<String, String> map = new HashMap<>();
			map.put("name", name);
			map.put("id", id);
			map.put("email", email);
			System.out.println("findpassDAO : " + name + "," + id + "," + email);
			String pass = (String) smc.queryForObject("member.findPass", map);
			System.out.println("name : "+name);
			System.out.println("id : "+id);
			System.out.println("email : "+email);
			if (pass != null && pass.length()!=0)
				result += "," + pass + ",success";
			else
				result += ",,fail";
			System.out.println("result : "+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean delete(String id) {
		try {
			smc.delete("adminMember.delete2", id);
			int t = smc.delete("member.delete", id);
			if (t == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<OrderUser> oselectFind(String id) {
		List<OrderUser> user = null;

		try {
			user = smc.queryForList("member.oselectFind", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
	
	public int selectprice(int idx) {
		int price=0;
		try {
			price = (int) smc.queryForObject("member.selectprice", idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return price;
	}
	
	
	public Items selectItem(int idx) {
		Items item = null;
		
		try {
			item = (Items)smc.queryForObject("member.selectItem", idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return item;
	}
	


	public boolean updateItem(Items item) {
		try {
			smc.update("member.updateItem", item);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	
	}
	

	public boolean updatePoint(String id, int point) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("point", point);
		int t = 0;
		try {
			t = smc.update("member.updatePoint",map);
			if (t == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean checkID(String id){
		int t = 0;
		try {
			t = (int) smc.queryForObject("member.selectID", id);
			if(t == 1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}*/
}
