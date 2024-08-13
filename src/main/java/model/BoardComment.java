package model;

import java.util.Date;

public class BoardComment {
	private int commSer;
	private int boardNum;
	private String userId;
	private String commCon;
	private Date commDate;
	public int getCommSer() {
		return commSer;
	}
	public void setCommSer(int commSer) {
		this.commSer = commSer;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommCon() {
		return commCon;
	}
	public void setCommCon(String commCon) {
		this.commCon = commCon;
	}
	public Date getCommDate() {
		return commDate;
	}
	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}
	@Override
	public String toString() {
		return "BoardComment [commSer=" + commSer + ", boardNum=" + boardNum + ", userId=" + userId + ", commCon="
				+ commCon + ", commDate=" + commDate + "]";
	}
	
	
}
