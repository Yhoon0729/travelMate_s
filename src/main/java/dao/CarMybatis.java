package dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.RentAnno;
import model.Car;
import model.CarHis;

@Component
public class CarMybatis {
	
	@Autowired
	SqlSessionTemplate session;
	
	public String countryCode(String festivalCode) {
		String countryCode = session.getMapper(RentAnno.class).countryCode(festivalCode);
		return countryCode;
	}
	
	public List<Car> carList(String countryCode) {
		List<Car> carList = session.getMapper(RentAnno.class).getCars(countryCode);
		System.out.println("+++++"+carList);
		return carList;
	}
	
	public int fee(String countryCode, String carId) {
		Map map = new HashMap();
		map.put("countryCode", countryCode);
		map.put("carId", carId);
		int hourFee = session.getMapper(RentAnno.class).fee(map);
		return hourFee;
	}
	
	public Car selectCar(String countryCode, String carId) {
		Map map = new HashMap();
		map.put("countryCode", countryCode);
		map.put("carId", carId);
		Car selectCar = session.getMapper(RentAnno.class).selectCar(map);
		return selectCar;
	}
	
	public int carHis(String carId, String carName, int totFee, 
			Date carStartDate, Date carEndDate, String carCom) {
		Map map = new HashMap();
		map.put("carId", carId);
		map.put("carName", carName);
		map.put("totFee", totFee);
		map.put("carStartDate", carStartDate);
		map.put("carEndDate", carEndDate);
		map.put("carCom", carCom);
		
		int num = session.getMapper(RentAnno.class).carHis(map);
		
		return num;
	}
	
	public CarHis rent(String carId, int carHistoryId) {
		Map map = new HashMap();
		map.put("carId", carId);
		map.put("carHistoryId", carHistoryId);
		CarHis rent = session.getMapper(RentAnno.class).rent(map);
		return rent;
	}
	
	public int carHistoryId() {
		int carHistoryId = session.getMapper(RentAnno.class).carHistoryId();
		return carHistoryId;
	};

	
	public List<CarHis> rentCarList() {
		List<CarHis> rentCarList = session.getMapper(RentAnno.class).rentCarList();
		
		return rentCarList;
	}
	
	
} // end of class carMybatis
