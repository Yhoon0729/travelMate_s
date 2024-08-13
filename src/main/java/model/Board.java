package model;

import java.util.Date;

public class Board {
	private int boardNum;
	private String userId;
	private String boardSub;
	private String boardCon;
	private Date boardDate;
	private int boardCnt;
	private String boardId;
	private String boardFile;
	
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
	public String getBoardSub() {
		return boardSub;
	}
	public void setBoardSub(String boardSub) {
		this.boardSub = boardSub;
	}
	public String getBoardCon() {
		return boardCon;
	}
	public void setBoardCon(String boardCon) {
		this.boardCon = boardCon;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public String getBoardFile() {
		return boardFile;
	}
	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}
	@Override
	public String toString() {
		return "Board [boardNum=" + boardNum + ", userId=" + userId + ", boardSub=" + boardSub + ", boardCon="
				+ boardCon + ", boardDate=" + boardDate + ", boardCnt=" + boardCnt + ", boardId=" + boardId
				+ ", boardFile=" + boardFile + "]";
	}
	
	
}
