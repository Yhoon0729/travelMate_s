package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CarMybatis;
import model.Car;
import model.CarHis;
import model.CarTime;

@Controller
@RequestMapping("/car/")
public class CarController {

	HttpSession session;
	HttpServletRequest request;
	Model model;
	
	@Autowired
	CarMybatis dao = new CarMybatis();
	
	@ModelAttribute
	protected void service(HttpServletRequest request, Model model) throws ServletException, IOException {
		this.request = request;
		session = request.getSession();
		this.model = model;
	}
	
	@RequestMapping("rentCar")
	public String rentCar(Model model) throws ServletException, IOException {
		String festivalCode = (String) session.getAttribute("festivalCode");
		String countryCode = dao.countryCode(festivalCode);
		session.setAttribute("countryCode", countryCode);
		System.out.println(countryCode);
		List<Car> li = dao.carList(countryCode);
		session.setAttribute("carList", li);
		model.addAttribute("li", li);
		System.out.println(li);
		
		return "car/rentCar";
	}
	
	@RequestMapping("rentCarTime")
	public String rentCarTime(String carId) 
			throws ServletException, IOException {
        System.out.println(carId);
        request.setAttribute("carId", carId);
        return "car/rentCarTime";
	}
	
	@RequestMapping("rentCarInfo")
	public String rentCarInfo(CarTime carTime) 
			throws ServletException, IOException {
		List<Car> li = (List<Car>) session.getAttribute("carList");
		String carId = carTime.getCarId();
		
        SimpleDateFormat obj = new SimpleDateFormat("yyyy-MM-dd HH:mm");  
        
        Date carStartDate = null;
        Date carEndDate = null;
        long totTime=0;
        
        try {
        	carStartDate = obj.parse(carTime.getsRentDate()+" "+carTime.getsRentTime());
			carEndDate = obj.parse(carTime.geteRentDate()+" "+carTime.geteRentTime());
			totTime = (carEndDate.getTime() - carStartDate.getTime()) / (1000*60*60);
		} catch (ParseException e) {     
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        String countryCode = (String) session.getAttribute("countryCode");
        Car selectCar = dao.selectCar(countryCode, carId);
        
        String carName = selectCar.getCarName();
        String carCom = selectCar.getCarCom();
        int hourFee = dao.fee(countryCode, carTime.getCarId());
        int totFee = (int)(totTime * hourFee);
        int num = dao.carHis(carTime.getCarId(), carName, totFee, carStartDate, carEndDate, carCom);
        int carHistoryId = dao.carHistoryId();
        CarHis carHis = dao.rent(carTime.getCarId(), carHistoryId);
        
        session.setAttribute("carHis", carHis);
       
        request.setAttribute("carId", carTime.getCarId());
        request.setAttribute("sRentDate", carTime.getsRentDate());
        request.setAttribute("sRentTime", carTime.getsRentTime());
        request.setAttribute("eRentDate", carTime.geteRentDate());
        request.setAttribute("eRentTime", carTime.geteRentTime());  
        request.setAttribute("totTime", totTime);
        request.setAttribute("hourFee", hourFee);
        request.setAttribute("totFee", totFee);
		return "car/rentCarInfo";
	}
	/*
	
	@RequestMapping("rentCarList")
	public String rentCarList(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		List<CarHis> li = dao.rentCarList();
		request.setAttribute("li", li);
		System.out.println(li);

		return "car/rentCarList";
	}
	*/
}
