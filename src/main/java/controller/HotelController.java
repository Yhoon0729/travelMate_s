package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.HotelMybatis;
import model.Hotel;
import model.HotelBooking;

@Controller
@RequestMapping("/hotel/")
public class HotelController {
	
	HttpSession session;
	HttpServletRequest request;
	
	@Autowired
    HotelMybatis mybatisdao = new HotelMybatis();

	@ModelAttribute
	public void service(HttpServletRequest request) throws ServletException, 
	IOException {
		this.request = request;
		session=request.getSession();
	}

    @RequestMapping("hotelList")
    public String hotelList()
            throws ServletException, IOException {

        List<Hotel> li = mybatisdao.hotelList();
        List<String> locli = mybatisdao.hotellocList();
        
        request.setAttribute("li", li);
        request.setAttribute("locli", locli);
        System.out.println(li);
        return "hotel/hotelList";
    }

    @RequestMapping("hotelbooking")
    public String hotelbooking(int htlId, String htlCheckin, String htlCheckout, int adult, int child, int rooms)
            throws ServletException, IOException {

        HotelBooking booking = new HotelBooking();
        booking.setHtlId(htlId);
        booking.setHtlCheckin(htlCheckin);
        booking.setHtlCheckout(htlCheckout);
        booking.setHtlAdult(adult);
        booking.setHtlChild(child);
        booking.setHtlRooms(rooms);
        booking.setHtlTotalprice(rooms * mybatisdao.getHotelPrice(htlId));

        session.setAttribute("booking", booking);
        
        HotelBooking hb = (HotelBooking) session.getAttribute("booking");
        int num = mybatisdao.hotelBookingInsert(hb);
        System.out.println("세션 확인" + hb);
        
        String msg = "호텔예약 등록 성공";

        if (num == 0) {
            msg = "호텔예약 등록 실패";
        }
        request.setAttribute("msg", msg);

        return "hotel/hotelBooking";
    }
}
