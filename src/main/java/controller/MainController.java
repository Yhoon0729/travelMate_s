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
@RequestMapping("/")
public class MainController {
	HttpSession session;
	HttpServletRequest request;
	Model model;
	
	@ModelAttribute
	protected void service(HttpServletRequest request, Model model) throws ServletException, IOException {
		this.request = request;
		session = request.getSession();
		this.model = model;
	}
	
	@RequestMapping("home")
	public String home() {

		return "home";
	}
}
