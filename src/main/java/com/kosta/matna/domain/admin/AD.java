package com.kosta.matna.domain.admin;

public class AD {

	private int no;
	private String photo;
	private String title;
	private String comments;
	private String link;
	
	@Override
	public String toString() {
		return "[no : "+ no + ",photo : " +photo + ",title : "+ title + ",comments : " + comments + ",link : " + link +"]";
	}
	
	public AD() {
	}

	public AD(int no, String photo, String title, String comments, String link) {
		this.no = no;
		this.photo = photo;
		this.title = title;
		this.comments = comments;
		this.link = link;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
}
