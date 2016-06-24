package com.kosta.matna.domain.member;

public class MemberVO {
	private int no;
	private String id; 
	private String pw; 
	private String name; 
	private String nickname; 
	private String birth;
	private String gender;
	private String email; 
	private String phone; 
	private String post;
	private String addr; 
	private int point;
    private String regdate;
    private int grade;
    private int allpoint;
    
    public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String id, String pw, String name,String nickname, String email, String gender, String birth, String phone,
			String addr, String post, String regdate, int no, int point) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.phone = phone;
		this.addr = addr;
		this.post = post;
		this.regdate = regdate;
		this.no = no;
		this.point = point;
		this.nickname = nickname;
	}

	public int getAllpoint() {
		return allpoint;
	}

	public void setAllpoint(int allpoint) {
		this.allpoint = allpoint;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
    

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
}