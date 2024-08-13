package model;

public class User {
	private String userId; 
	private String userPass; 
	private String userName;
	private String userTel;
	private int userAge; 
	private int userGen; 
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public int getUserGen() {
		return userGen;
	}
	public void setUserGen(int userGen) {
		this.userGen = userGen;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPass=" + userPass + ", userTel=" + userTel
				+ ", userName=" + userName + ", userAge=" + userAge + ", userGen=" + userGen + "]";
	}
	
}
