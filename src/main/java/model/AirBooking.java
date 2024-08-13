package model;

public class AirBooking {

	String airBookingId;
	
	String outFlightCode;
	String depDate;
	String depDay;

	String inFlightCode;
	String rtnDate;
	String rtnDay;

	int adult;
	int child;
	int baby;
	
	public AirBooking() {}
	
	public AirBooking(String airBookingId, String outFlightCode, String depDate, String depDay, String inFlightCode,
			String rtnDate, String rtnDay, int adult, int child, int baby) {
		super();
		this.airBookingId = airBookingId;
		this.outFlightCode = outFlightCode;
		this.depDate = depDate;
		this.depDay = depDay;
		this.inFlightCode = inFlightCode;
		this.rtnDate = rtnDate;
		this.rtnDay = rtnDay;
		this.adult = adult;
		this.child = child;
		this.baby = baby;
	}
	
	@Override
	public String toString() {
		return "AirBooking [airBookingId=" + airBookingId + ", outFlightCode=" + outFlightCode + ", depDate=" + depDate
				+ ", depDay=" + depDay + ", inFlightCode=" + inFlightCode + ", rtnDate=" + rtnDate + ", rtnDay="
				+ rtnDay + ", adult=" + adult + ", child=" + child + ", baby=" + baby + "]";
	}
	
	public String getAirBookingId() {
		return airBookingId;
	}
	public void setAirBookingId(String airBookingId) {
		this.airBookingId = airBookingId;
	}
	public String getOutFlightCode() {
		return outFlightCode;
	}
	public void setOutFlightCode(String outFlightCode) {
		this.outFlightCode = outFlightCode;
	}
	public String getDepDate() {
		return depDate;
	}
	public void setDepDate(String depDate) {
		this.depDate = depDate;
	}
	public String getDepDay() {
		return depDay;
	}
	public void setDepDay(String depDay) {
		this.depDay = depDay;
	}
	public String getInFlightCode() {
		return inFlightCode;
	}
	public void setInFlightCode(String inFlightCode) {
		this.inFlightCode = inFlightCode;
	}
	public String getRtnDate() {
		return rtnDate;
	}
	public void setRtnDate(String rtnDate) {
		this.rtnDate = rtnDate;
	}
	public String getRtnDay() {
		return rtnDay;
	}
	public void setRtnDay(String rtnDay) {
		this.rtnDay = rtnDay;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public int getBaby() {
		return baby;
	}
	public void setBaby(int baby) {
		this.baby = baby;
	}
	
	
	
	
	
}// class
