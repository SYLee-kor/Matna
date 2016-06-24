package com.kosta.matna.domain.message;

import java.sql.Date;

public class MessageVO {
  //no, senderno, receiverno, title,content, senddate, state
	private int no;
	private int senderNo;
	private int receiverNo;
	private String title;
	private String content;
	private Date sendDate;
	private int state;
	private String senderNickname;
	private String receiverNickname;
	private int senderDelete;
	private int receiverDelete;
	
	@Override
    public String toString() {
		return "메시지[from:"+senderNo+", to:"+
               receiverNo+", 제목:"+title+", 내용:"+content+"]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSenderNo() {
		return senderNo;
	}

	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}

	public int getReceiverNo() {
		return receiverNo;
	}

	public void setReceiverNo(int receiverNo) {
		this.receiverNo = receiverNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getSenderNickname() {
		return senderNickname;
	}

	public void setSenderNickname(String senderNickname) {
		this.senderNickname = senderNickname;
	}

	public String getReceiverNickname() {
		return receiverNickname;
	}

	public void setReceiverNickname(String receiverNickname) {
		this.receiverNickname = receiverNickname;
	}

	public int getSenderDelete() {
		return senderDelete;
	}

	public void setSenderDelete(int senderDelete) {
		this.senderDelete = senderDelete;
	}

	public int getReceiverDelete() {
		return receiverDelete;
	}

	public void setReceiverDelete(int receiverDelete) {
		this.receiverDelete = receiverDelete;
	}

	
	
	
}
