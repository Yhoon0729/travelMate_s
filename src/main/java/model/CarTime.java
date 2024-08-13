package model;

public class CarTime {
	
	private String carId;
	private String sRentDate;
	private String sRentTime;
	private String eRentDate;
	private String eRentTime;
	
	
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getsRentDate() {
		return sRentDate;
	}
	public void setsRentDate(String sRentDate) {
		this.sRentDate = sRentDate;
	}
	public String getsRentTime() {
		return sRentTime;
	}
	public void setsRentTime(String sRentTime) {
		this.sRentTime = sRentTime;
	}
	public String geteRentDate() {
		return eRentDate;
	}
	public void seteRentDate(String eRentDate) {
		this.eRentDate = eRentDate;
	}
	public String geteRentTime() {
		return eRentTime;
	}
	public void seteRentTime(String eRentTime) {
		this.eRentTime = eRentTime;
	}
	@Override
	public String toString() {
		return "CarTime [carId=" + carId + ", sRentDate=" + sRentDate + ", sRentTime=" + sRentTime + ", eRentDate="
				+ eRentDate + ", eRentTime=" + eRentTime + "]";
	}

}
