package model;

public class Car {
	private String carId;
	private String countryCode;
	private String carType;
	private String carName;
	private String carImageUrl;
	private int carDailyFee;
	private String carCom;
	
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarImageUrl() {
		return carImageUrl;
	}
	public void setCarImageUrl(String carImageUrl) {
		this.carImageUrl = carImageUrl;
	}
	public int getCarDailyFee() {
		return carDailyFee;
	}
	public void setCarDailyFee(int carDailyFee) {
		this.carDailyFee = carDailyFee;
	}
	public String getCarCom() {
		return carCom;
	}
	public void setCarCom(String carCom) {
		this.carCom = carCom;
	}
	@Override
	public String toString() {
		return "Car [carId=" + carId + ", countryCode=" + countryCode + ", carType=" + carType + ", carName=" + carName
				+ ", carDailyFee=" + carDailyFee + ", carCom=" + carCom + "]";
	}
	

}
