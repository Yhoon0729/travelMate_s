package model;

public class Hotel {
	private int htlId;
	private String code;
	private String htlName;
	private double htlGrade;
	private int htlPrice;
	
	public int getHtlId() {
		return htlId;
	}
	public void setHtlId(int htlId) {
		this.htlId = htlId;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getHtlName() {
		return htlName;
	}
	public void setHtlName(String htlName) {
		this.htlName = htlName;
	}
	public double getHtlGrade() {
		return htlGrade;
	}
	public void setHtlGrade(double htlGrade) {
		this.htlGrade = htlGrade;
	}
	public int getHtlPrice() {
		return htlPrice;
	}
	public void setHtlPrice(int htlPrice) {
		this.htlPrice = htlPrice;
	}
	@Override
	public String toString() {
		return "Hotel [htlId=" + htlId + ", code=" + code + ", htlName=" + htlName + ", htlGrade=" + htlGrade
				+ ", htlPrice=" + htlPrice + "]";
	}
	
	
}
