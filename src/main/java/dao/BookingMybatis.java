package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.BookingAnno;
import model.AirBooking;
import model.AirInfo;
import model.CarHis;
import model.Festival;
import model.HotelBooking;

@Component
public class BookingMybatis {

	@Autowired
	SqlSessionTemplate session;
	
	public String airBookingId() {
		String airBookingId = session.getMapper(BookingAnno.class).airBookingId();
		return airBookingId;
	}
	
	public int htlBookingId() {
		int htlBookingId = session.getMapper(BookingAnno.class).htlBookingId();
		return htlBookingId;
	}
	
	public int carHistoryId() {
		int carHistoryId = session.getMapper(BookingAnno.class).carHistoryId();
		return carHistoryId;
	}
	
	public int insertBooking(String code, String airBookingId, int htlBookingId,
			int carHistoryId) {
		Map map = new HashMap();
		map.put("code", code);
		map.put("airBookingId", airBookingId);
		map.put("htlBookingId", htlBookingId);
		map.put("carHistoryId", carHistoryId);
		int insertBooking = session.getMapper(BookingAnno.class).insertBooking(map);
		return insertBooking;
	}
	
	public List<Festival> getFestival(String code) {
		List<Festival> getFestival = session.getMapper(BookingAnno.class).getFestival(code);
		return getFestival;
	}
	
	public AirBooking airBooking(String airBookingId) {
		AirBooking airBooking = session.getMapper(BookingAnno.class).airBooking(airBookingId);
		return airBooking;
	}
	
	public List<AirInfo> outflight(String outFlightCode, String depDate) {
		Map map = new HashMap();
		map.put("outFlightCode", outFlightCode);
		map.put("depDate", depDate);
		
		
		List<AirInfo> outflight = session.getMapper(BookingAnno.class).outflight(map);
		return outflight;
	}
	
	public List<AirInfo> inFlight(String inFlightCode, String rtnDate) {
		Map map = new HashMap();
		map.put("inFlightCode", inFlightCode);
		map.put("rtnDate", rtnDate);
		
		List<AirInfo> inFlight = session.getMapper(BookingAnno.class).inFlight(map);
		return inFlight;
	}
	
	public List<HotelBooking> hotelBooking(int htlBookingid) {
		List<HotelBooking> hotelBooking = session.getMapper(BookingAnno.class).hotelBooking(htlBookingid);
		return hotelBooking;
	}
	
	public List<CarHis> carRent(int carHistoryId) {
		List<CarHis> carRent = session.getMapper(BookingAnno.class).carRent(carHistoryId);
		return carRent;
	}
}
