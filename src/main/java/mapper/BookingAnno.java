package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.AirBooking;
import model.AirInfo;
import model.CarHis;
import model.Festival;
import model.HotelBooking;

public interface BookingAnno {
	// 가장 최근의 항공기 예약 번호
	@Select("select max(airBookingId) from airBooking")
	public String airBookingId();
	
	// 가장 최근의 호텔 예약 번호
	@Select("select max(htlBookingId) from hotel_booking")
	public int htlBookingId();
	
	// 가장 최근의 렌트카 예약 번호
	@Select("select max(carHistoryId) from car_rental_history")
	public int carHistoryId();
	
	@Insert("insert into booking values(bookingseq.nextval, #{code}, #{airBookingId}, "
			+ "  ${htlBookingId}, ${carHistoryId}, 1, 1)")
	public int insertBooking(Map map);
	
	@Select("select festivalName, country, info1 from festival where code = #{code}")
	List<Festival> getFestival(String code);
	
	// 항공권 예약 정보
	@Select("select * from airbooking where airBookingId = #{airBookingId}")
	public AirBooking airBooking(String airBookingId);
	
	// 출국 정보
	@Select("select * from airinfo where flightcode = #{outFlightCode} and day = #{depDate}")
	List<AirInfo> outflight(Map map);
	
	// 입국 정보
	@Select("select * from airinfo where flightcode = #{inFlightCode} and day = #{rtnDate}")
	List<AirInfo> inFlight(Map map);
	
	// 호텔 정보
	@Select("select * from hotel_booking where htlBookingid = ${value}")
	List<HotelBooking> hotelBooking(int htlBookingid);
	
	// 렌트카 정보
	@Select("select * from car_rental_history where carHistoryId = ${value}")
	List<CarHis> carRent(int carHistoryId);
}
