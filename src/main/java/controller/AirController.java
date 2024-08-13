package controller;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AirDAO;
import model.AirBooking;
import model.AirInfo;
import model.Festival;

//최상위 경로 지정
// controller 선언
@Controller
@RequestMapping("/air/")
public class AirController {

	// 전체에서 사용될 dao 객체 주입
	@Autowired
	AirDAO airDAO = new AirDAO();

	/* web 과의 연동을 위한 기본 설정 */
	/* 모든 매소드에서 사용되는 최상위 매소드 */
	HttpSession session;
	HttpServletRequest request;
	Model model;

	@ModelAttribute
	protected void service(HttpServletRequest request,
			Model model) throws ServletException, IOException {
		this.request = request;
		this.model = model;
		session = request.getSession();
		
		// 세션에서 사용자 정보 읽기
	    String user = (String) session.getAttribute("user");
	    
	    if(  user == null ) {
	    	session.setAttribute("user", "비회원");
	    }
	}	
	
	// 축제에서 선택된 국가의 공항 선택
	@RequestMapping("airindex")
	public String airindex(Model model)
			throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 이전 선택에서 남아 있는 항공권관련 session 모두 초기화
	session.setAttribute("depAir", null);
	session.setAttribute("arrAir", null);
	
	session.setAttribute("depDate", null);
	session.setAttribute("depDay", null);
	session.setAttribute("outFlightCode", null);
	
	session.setAttribute("rtnDate", null);
	session.setAttribute("rtnDay", null);
	session.setAttribute("inFlightCode", null);
	
	session.setAttribute("adult", null);
	session.setAttribute("child", null);
	session.setAttribute("baby", null);
	
	// 국내 출발 공항리스트
	List<String> list = airDAO.getDepartureAirportListAll();
	
	model.addAttribute("airList", list);
	
		
	// 연결 설정
	return "air/AirSelect";
	}
	
	
	// 출발 공항 선택 완료 도착 공항 리스트 보여주기
	@RequestMapping("depAir")
	public String depAir(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 파라메터값 가져오기
	String depAir = request.getParameter("depAir");
		
	session.setAttribute("depAir", depAir);
		
	// 도착 공항리스트
	Festival festivalInfo = (Festival) session.getAttribute("list"); 
	
	String country = festivalInfo.getCountry();
		
	List<String> list = airDAO.getArrivalAirportListAll( country, depAir );
	
	model.addAttribute("airList", list);
		
	// 연결 설정
	return "../util/AirArrAirportList";
	}
	

	// 도착 공항 선택 완료 일정 선택 보여주기
	@RequestMapping("arrAir")
	public String arrAir(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 파라메터값 가져오기
	String arrAir = request.getParameter("arrAir");
	
	session.setAttribute("arrAir", arrAir);
	
		
	// 연결 설정
	return "../util/AirText";
	}
	
	
	
	// text 활용 : 변경 또는 삭제 금지
	@RequestMapping("airText")
	public String airText(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 파라메터값 가져오기
	String text = request.getParameter("text");
	
	model.addAttribute("text", text);
		
	// 연결 설정
	return "../util/AirText";
	}
	
	
	
	
	// 출국 날짜 선택
	@RequestMapping("airDepDate")
	public String airDepDate(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 파라메터값 가져오기
	String date = request.getParameter("date");
	session.setAttribute("depDay", date);
	
	// 연결 설정
	return "../util/AirText";	
	}

	
	
	// 오는 날짜 선택
	@RequestMapping("airRtnDate")
	public String airRtnDate(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 파라메터값 가져오기
	String date = request.getParameter("date");
	session.setAttribute("rtnDay", date);
		    		
	// 연결 설정
	return "../util/AirText";
	}
	
	// 출국 항공편 선택
	@RequestMapping("airFlightSelect")
	public String airFlightSelect(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 파라메터값 가져오기
	String adult = request.getParameter("adult");
	String child = request.getParameter("child");
	String baby = request.getParameter("baby");
	
	session.setAttribute("adult", adult);
	session.setAttribute("child", child);
	session.setAttribute("baby", baby);
	
	// 출발 날짜 유효성 검사 (Date : 요일, Day : 날짜)
	String depDay = (String) session.getAttribute("depDay");

	// 날짜 문자열을 LocalDate로 변환
    String date="";
	LocalDate localDate = LocalDate.parse(depDay);
    
    
    // 날짜의 요일을 가져옴
    DayOfWeek dayOfWeek = localDate.getDayOfWeek();
    
    // 요일을 출력 (한글로 변환)
    switch (dayOfWeek) {
    case MONDAY: date="월"; break;
    case TUESDAY: date="화"; break;
    case WEDNESDAY: date="수"; break;
    case THURSDAY: date="목"; break;
    case FRIDAY: date="금"; break;
    case SATURDAY: date="토"; break;
    case SUNDAY: date="일"; break;
    }
    
    session.setAttribute("depDate", date);
    
    String depDate = (String) session.getAttribute("depDate");
    String depAir = (String) session.getAttribute("depAir");
	
	
    // 입국 날짜 문자열을 LocalDate로 변환
    String rtnDay = (String) session.getAttribute("rtnDay");
        
    date="";
	localDate = LocalDate.parse(rtnDay);
    
    
    // 날짜의 요일을 가져옴
    dayOfWeek = localDate.getDayOfWeek();
    
    // 요일을 출력 (한글로 변환)
    switch (dayOfWeek) {
    case MONDAY: date="월"; break;
    case TUESDAY: date="화"; break;
    case WEDNESDAY: date="수"; break;
    case THURSDAY: date="목"; break;
    case FRIDAY: date="금"; break;
    case SATURDAY: date="토"; break;
    case SUNDAY: date="일"; break;
    }
    
    session.setAttribute("rtnDate", date);
    
	String rtnDate = (String) session.getAttribute("rtnDate");
	
	String arrAir = (String) session.getAttribute("arrAir");
	
    List<AirInfo> deplist = airDAO.getAirInfoList( depAir, arrAir, depDate );
    model.addAttribute("airListDep", deplist);

    List<AirInfo> rtnlist = airDAO.getAirInfoList( arrAir, depAir, rtnDate );
    model.addAttribute("airListRtn", rtnlist);
	
    // 연결 설정
	return "air/AirFlightSelect";
	}
	
	
	// 출국 항공권 선택
	@RequestMapping("airOutFlight")
	public String airOutFlight(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 파라메터 가져오기
	String flightCode = request.getParameter("flightCode");
	
	session.setAttribute("outFlightCode", flightCode);
	
	// 연결 설정
	return "../util/AirText";
	}


	// 입국 항공권 선택
	@RequestMapping("airInFlight")
	public String airInFlight(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 파라메터 가져오기
	String flightCode = request.getParameter("flightCode");
	
	session.setAttribute("inFlightCode", flightCode);
	
	// 연결 설정
	return "../util/AirText";
	}

	
	
	// 항공권 선택 완료
	@RequestMapping("airConfirm")
	public String airConfirm(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 파라메터값 가져오기
	
	// 유효성 검사
	String depDate = (String) session.getAttribute("depDate");
	String depDay = (String) session.getAttribute("depDay");
	String outFlightCode = (String) session.getAttribute("outFlightCode");
	
	String rtnDate = (String) session.getAttribute("rtnDate");
	String rtnDay = (String) session.getAttribute("rtnDay");
	String inFlightCode = (String) session.getAttribute("inFlightCode");
	
	String adult = (String) session.getAttribute("adult");
	String child = (String) session.getAttribute("child");
	String baby = (String) session.getAttribute("baby");
	
	// 유효성 검사 처리
	String msg ;
	String url ;

	System.out.println( rtnDate + rtnDay + inFlightCode );
	
	if( depDate == null || depDay == null || outFlightCode == null ) {
		msg = "출국 선택에 오류가 있습니다. 날짜와 항공편이 선택되었는지 확인하세요.";
		url = "air/airindex";
	}else if( rtnDate == null || rtnDay == null || inFlightCode == null ) {
		msg = "입국 선택에 오류가 있습니다. 날짜와 항공편이 선택되었는지 확인하세요.";
		url = "air/airindex";
	}else {
		msg = "";
		
		// 항공권 선택 내용 화면 표시
		url = "hotel/hotelList";
		
		// 항공권 선택 내용 DB에 입력
		// AirBooking 에 예약 사항 입력
		AirBooking airBooking = new AirBooking();
		
		airBooking.setOutFlightCode(outFlightCode);
		airBooking.setDepDate(depDate);
		airBooking.setDepDay(depDay);
		
		airBooking.setInFlightCode(inFlightCode);
		airBooking.setRtnDate(rtnDate);
		airBooking.setRtnDay(rtnDay);
		
		airBooking.setAdult(Integer.parseInt(adult));
		airBooking.setChild(Integer.parseInt(child));
		airBooking.setBaby(Integer.parseInt(baby));
		
		System.out.println( airBooking );
		
		// DB 입력
		airDAO.insertAirBooking( airBooking );
	}
	
	model.addAttribute("msg", msg);
	model.addAttribute("url", url);
	
	// 연결 설정
	return "../util/alert";
	}
	
	
	// 항공권 선택 완료
		@RequestMapping("airConfirmPrint")
		public String airConfirmPrint(HttpServletRequest request, Model model, HttpSession session)
				throws ServletException, IOException {
			
		// post 방식의 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		
		// 연결 설정
		return "air/AirConfirm";
		}
	

	
}// class
