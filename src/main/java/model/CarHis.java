package model;

public class CarHis {
	private int carHistoryId;
	private String carId;
	private String carName;
	private int totFee;
	private String carStartDate;
	private String carEndDate;
	private String carCom;
	
	public int getCarHistoryId() {
		return carHistoryId;
	}
	public void setCarHistoryId(int carHistoryId) {
		this.carHistoryId = carHistoryId;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public int getTotFee() {
		return totFee;
	}
	public void setTotFee(int totFee) {
		this.totFee = totFee;
	}
	public String getCarStartDate() {
		return carStartDate;
	}
	public void setCarStartDate(String carStartDate) {
		this.carStartDate = carStartDate;
	}
	public String getCarEndDate() {
		return carEndDate;
	}
	public void setCarEndDate(String carEndDate) {
		this.carEndDate = carEndDate;
	}
	public String getCarCom() {
		return carCom;
	}
	public void setCarCom(String carCom) {
		this.carCom = carCom;
	}
	
	@Override
	public String toString() {
		return "CarHis [carHistoryId=" + carHistoryId + ", carId=" + carId + ", carName=" + carName + ", totFee="
				+ totFee + ", carStartDate=" + carStartDate + ", carEndDate=" + carEndDate + ", carCom=" + carCom + "]";
	}

}
