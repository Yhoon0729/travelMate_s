package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.FestivalDAO;

import model.Festival;

@Controller
@RequestMapping("/tra/")
public class FestivalController {
	
	@Autowired
	FestivalDAO festivalDAO = new FestivalDAO();
	
	/* web 과의 연동을 위한 기본 설정 */
	HttpSession session;
	HttpServletRequest request;
	Model model;
	
	// 우선 실행되어야 하니까
	@ModelAttribute
	protected void service(HttpServletRequest request, 
			Model model) throws ServletException, 
	IOException {
		this.request = request;
		this.model = model;
		session=request.getSession();
	}
	
	
	/* 축제 선택 리스트 메인 화면*/
	@RequestMapping("traindex")
	public String index(HttpServletRequest request, HttpSession session)
			throws ServletException, IOException {
		
		// post 방식의 한글 깨짐 방지 
		request.setCharacterEncoding("UTF-8");
		
		// 계절별 상품 리스트 가져오기
		List<Festival> result = new ArrayList<>(); 
		result = festivalDAO.getFestivalListAll();
		
		session.setAttribute("list", result);
				
	// 연결 설정
	return "travel/TraMain";
	}
	
	/* 축제 정보 화면*/
	@RequestMapping("festivalInfo")
	public String festivalInfo(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
		// post 방식의 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		// parameter 처리
		String festivalCode = request.getParameter("code");
		session.setAttribute("festivalCode", festivalCode);
		
		// 페스티벌 정보 가져오기
		Festival result = festivalDAO.getFestivalInfo( festivalCode );
		
		session.setAttribute("list", result);
		
		model.addAttribute("msg", "");
		model.addAttribute("url", "/air/airindex");
						
	// 연결 설정
	return "../util/alert";
	}

	
	/* 축제 정보 입력 화면*/
	@RequestMapping("inputFestival")
	public String inputFestival(HttpServletRequest request, Model model, HttpSession session)
			throws ServletException, IOException {
		
		// post 방식의 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		return "travel/TraFestivalInput";
	}
	
	
	
	/* 축제 정보 화면*/
	@RequestMapping("searchCountry")
	public String searchCountry(HttpServletRequest request,
			Model model, HttpSession session)
			throws ServletException, IOException {
		
		// post 방식의 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		// parameter 처리
		String country = request.getParameter("country");
		
		String countryCode = festivalDAO.getCountry( country );
		model.addAttribute("text", countryCode);
						
	// 연결 설정
	return "../util/AirText";
	}	
	
	/* 축제 정보 입력 완료*/
	@RequestMapping("festivalConfirm")
	public String festivalInput(HttpServletRequest request,
			Model model, HttpSession session, Festival festival)
			throws ServletException, IOException {
		
		// post 방식의 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		// 입력 처리
		festivalDAO.insertFestival( festival );

		model.addAttribute("text", "festivalList");
						
	// 연결 설정
	return "../util/AirText";
	}

	
	/* 축제 정보 리스트 */
	@RequestMapping("festivalList")
	public String festivalList(HttpServletRequest request,
			Model model, HttpSession session, Festival festival)
			throws ServletException, IOException {
		
		// post 방식의 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		// 입력 처리
		List<Festival> festivalList = festivalDAO.getFestivalList( );
		
		model.addAttribute("festivalList", festivalList);
						
	// 연결 설정
	return "travel/TraFestivalList";
	}


	/* 축제 정보 변경 */
	@RequestMapping("festivalUpdate")
	public String festivalUpdate(HttpServletRequest request,
			Model model, HttpSession session, Festival festival)
			throws ServletException, IOException {
		
		// post 방식의 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		// 파라메터값 가져오기
		String code = request.getParameter("code");
		
		// 입력 처리
		Festival festivalInfo = festivalDAO.getFestivalInfo( code );
		
		model.addAttribute("list", festivalInfo);
						
	// 연결 설정
	return "travel/TrafestivalUpdate";
	}

	/* 축제 정보 변경 실행 */
	@RequestMapping("festivalUpdatePro")
	public String festivalUpdatePro(HttpServletRequest request,
			Model model, HttpSession session, Festival festival)
			throws ServletException, IOException {
		
		// post 방식의 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
	
		// 변경 처리
		festivalDAO.festivalUpdate( festival );

		model.addAttribute("text", "festivalList");
		
	// 연결 설정
	return "../util/AirText";
	}


	/* 축제 삭제 실행 */
	@RequestMapping("festivalDeletePro")
	public String festivalDeletePro(HttpServletRequest request,
			Model model, HttpSession session, Festival festival)
			throws ServletException, IOException {
		
		// post 방식의 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
			
		// 변경 처리
		String code = request.getParameter("code");
		
		festivalDAO.festivalDelete( code );
		
		String msg = "삭제 완료";
		String url = "tra/festivalList";
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
	// 연결 설정
	return "../util/alert";
	}

	
	
}//class
