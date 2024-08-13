package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Hotel;
import model.HotelBooking;

@Component
public class HotelMybatis {
	
	@Autowired
	SqlSessionTemplate session;
	
	String namespace = "xml.hotel.";
	
	public List<Hotel> hotelList() {
		List<Hotel> li = session.selectList(namespace + "hotelList");
		return li;
	}
	
	public List<String> hotellocList() {
		List<String> li = session.selectList(namespace + "hotellocList");
		return li;
	}
	
	public Hotel getHotel(int id) {
		Hotel h = session.selectOne(namespace + "getHotel", id);
		return h;
	}
	
	public int hotelBookingInsert(HotelBooking hotelbooking) {
		int num = session.insert(namespace + "hotelBookingInsert", hotelbooking);
		return num;
	}
	
	public HotelBooking getHotelBooking(int id) {
		HotelBooking hb = session.selectOne(namespace + "getHotelBooking", id);
		return hb;
	}

	public int getHotelPrice(int hotelId) {
        int num = session.selectOne(namespace + "getHotelPrice", hotelId);
        return num;
    }
}
