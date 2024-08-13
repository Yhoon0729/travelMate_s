package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import dao.BookingMybatis;
import model.AirBooking;
import model.AirInfo;
import model.CarHis;
import model.Festival;
import model.HotelBooking;

@Controller
@RequestMapping("/booking/")
public class BookingController {
	HttpSession session;
	HttpServletRequest request;
	Model model;
	
	@Autowired
	BookingMybatis dao = new BookingMybatis();
	
	@ModelAttribute
	protected void service(HttpServletRequest request, Model model) throws ServletException, IOException {
		this.request = request;
		session = request.getSession();
		this.model = model;
	}
	
	@RequestMapping("userBooking")
	public String userBooking(Model model) {
		String code = (String) session.getAttribute("festivalCode");
		
		String airBookingId = dao.airBookingId();
		int htlBookingId = dao.htlBookingId();
		int carHistoryId = dao.carHistoryId();
		
		int num = dao.insertBooking(code, airBookingId, htlBookingId, carHistoryId);
		
		System.out.println();
		
		List<Festival> festival = dao.getFestival(code);
		
		// 항공권 예약 정보
		AirBooking airBooking = dao.airBooking(airBookingId);
		System.out.println("airBooking = " + airBooking);
		
		// 출국 비행기 코드 및 요일
		String outFlightCode = airBooking.getOutFlightCode();
		String depDate = airBooking.getDepDate();
		
		// 입국 비행기 코드 및 요일
		String inFlightCode = airBooking.getInFlightCode();
		String rtnDate = airBooking.getRtnDate();
		
		// 출국 비행기 정보
		List<AirInfo> outflight = dao.outflight(outFlightCode, depDate);
		List<AirInfo> inflight = dao.inFlight(inFlightCode, rtnDate);
		
		System.out.println("outflight="+outflight);
		
		// 호텔 정보
		List<HotelBooking> hotelBooking = dao.hotelBooking(htlBookingId);
		
		// 렌트카 정보
		List<CarHis> carRent = dao.carRent(carHistoryId);
		
		model.addAttribute("festival", festival);
		model.addAttribute("outflight", outflight);
		model.addAttribute("inflight", inflight);
		model.addAttribute("hotelBooking", hotelBooking);
		model.addAttribute("carRent", carRent);
		return "booking/userBooking";
	}
}
