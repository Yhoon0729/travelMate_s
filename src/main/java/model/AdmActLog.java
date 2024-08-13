package model;

import java.sql.Date;

public class AdmActLog {
	
	int no;
	String userId;
	String act;
	Date logDate;
	
	public AdmActLog() {}

	public AdmActLog(int no, String userId, String act, Date logDate) {
		super();
		this.no = no;
		this.userId = userId;
		this.act = act;
		this.logDate = logDate;
	}

	@Override
	public String toString() {
		return "AdmActLog [no=" + no + ", userId=" + userId + ", act=" + act + ", logDate=" + logDate + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAct() {
		return act;
	}

	public void setAct(String act) {
		this.act = act;
	}

	public Date getLogDate() {
		return logDate;
	}

	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}
	
	
	

}
