package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Car;
import model.CarHis;

public interface RentAnno {
	@Select("select countryCode from festival where code = #{festivalCode}")
	public String countryCode(String festivalCode);
	
	@Select("select *  from car_rental_car_${value}  ")
	List<Car> getCars(String countryCode);
	
	@Select("select carDailyFee fee from car_rental_car_${countryCode} where carId = #{carId}")
	public int fee(Map map);
	
	@Select("select * from car_rental_car_${countryCode} where carId = #{carId}")
	Car selectCar(Map map);
	
	@Insert("insert into car_rental_history values(car_his.nextval, #{carId}, #{carName}, #{totFee}, #{carStartDate}, #{carEndDate}, #{carCom})")
	public int carHis(Map map);
	
	@Select("select * from car_rental_history where carId = #{carId} and "
			+ "	carHistoryId = #{carHistoryId}")
	CarHis rent(Map map);
	
	@Select("select carHistoryId, carId,"
			+ "	to_char(carStartDate, 'yyyy-mm-dd hh24:mi') carStartDate,"
			+ "	to_char(carEndDate, 'yyyy-mm-dd hh24:mi') carEndDate "
			+ "	from car_rental_history")
	List<CarHis> rentCarList();
	
	@Select("select max(carHistoryId) from car_rental_history")
	public int carHistoryId();
}
