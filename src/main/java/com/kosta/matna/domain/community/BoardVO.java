package com.kosta.matna.domain.community;

import java.sql.Date;

public class BoardVO {
	private String type;
	private int no;
	private String title;
	private int writer;
	private String content;
	private int viewCnt;
	private int replyCnt;
	private Date regDate;
	private String nickName;
	private int mGrade;

	public BoardVO() {
	}

	public BoardVO(String type, int no, String title, int writer, String content, int viewCnt, int replyCnt,
			Date regDate, String nickName, int mGrade) {
		this.type = type;
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.replyCnt = replyCnt;
		this.regDate = regDate;
		this.nickName = nickName;
		this.mGrade = mGrade;
	}
	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public int getmGrade() {
		return mGrade;
	}


	public void setmGrade(int mGrade) {
		this.mGrade = mGrade;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	@Override
	public String toString() {
		return "[boardVO no : " + no + ", type : " + type + ", title : " + title + ", content : " + content
				+ ", writer : " + writer + "]";
	}

}
