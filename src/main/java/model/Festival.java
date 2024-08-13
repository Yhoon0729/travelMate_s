package model;

import java.sql.Date;

public class Festival {

	private String code;
	
	private String season;
	private String countryCode;
	private String country;
	
	private String festivalName;
	private Date startDay;
	private Date endDay;
	
	private String info1;
	private String info2;
	private String info3;
	
	private String url1;
	private String url2;
	private String url3;
	
	Festival(){}

	public Festival(String code, String season, String countryCode, String country, String festivalName, Date startDay,
			Date endDay, String info1, String info2, String info3, String url1, String url2, String url3) {
		super();
		this.code = code;
		this.season = season;
		this.countryCode = countryCode;
		this.country = country;
		this.festivalName = festivalName;
		this.startDay = startDay;
		this.endDay = endDay;
		this.info1 = info1;
		this.info2 = info2;
		this.info3 = info3;
		this.url1 = url1;
		this.url2 = url2;
		this.url3 = url3;
	}

	@Override
	public String toString() {
		return "Festival [code=" + code + ", season=" + season + ", countryCode=" + countryCode + ", country=" + country
				+ ", festivalName=" + festivalName + ", startDay=" + startDay + ", endDay=" + endDay + ", info1="
				+ info1 + ", info2=" + info2 + ", info3=" + info3 + ", url1=" + url1 + ", url2=" + url2 + ", url3="
				+ url3 + "]";
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getFestivalName() {
		return festivalName;
	}

	public void setFestivalName(String festivalName) {
		this.festivalName = festivalName;
	}

	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public Date getEndDay() {
		return endDay;
	}

	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}

	public String getInfo1() {
		return info1;
	}

	public void setInfo1(String info1) {
		this.info1 = info1;
	}

	public String getInfo2() {
		return info2;
	}

	public void setInfo2(String info2) {
		this.info2 = info2;
	}

	public String getInfo3() {
		return info3;
	}

	public void setInfo3(String info3) {
		this.info3 = info3;
	}

	public String getUrl1() {
		return url1;
	}

	public void setUrl1(String url1) {
		this.url1 = url1;
	}

	public String getUrl2() {
		return url2;
	}

	public void setUrl2(String url2) {
		this.url2 = url2;
	}

	public String getUrl3() {
		return url3;
	}

	public void setUrl3(String url3) {
		this.url3 = url3;
	}

	
	
}
