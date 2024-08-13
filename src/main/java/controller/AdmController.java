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

import dao.AdmDAO;
import model.AdmActAnal;
import model.AdmActLog;

@Controller
@RequestMapping("/adm/")
public class AdmController {

	
	// 전체에서 사용될 dao 객체 주입
	@Autowired
	AdmDAO admDAO = new AdmDAO();

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

	
	// 로그 기록 전체 리스트 보기
	@RequestMapping("logList")
	public String airindex(HttpSession session, HttpServletRequest request,
			Model model) throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	//log List 읽어 오기

	
	int pageStep = 10;
	int pageStart = 1;
	int pageEnd = pageStart + pageStep - 1;

	int totalCount = admDAO.logListCount();
	int maxPage = 0;
	
	if( ((totalCount / pageStep) * pageStep) < totalCount ) {
		maxPage = (totalCount / pageStep) + 1;
	}
	
	if( pageEnd > maxPage ) {
		pageEnd = maxPage;
	}
	
	session.setAttribute("pageStep", pageStep);
	session.setAttribute("pageStart", pageStart);
	session.setAttribute("pageEnd", pageEnd);
	
	int listStep = 10;
	int listStart = 1;
	int listEnd = listStart + listStep - 1;

	session.setAttribute("listStep", listStep);
	session.setAttribute("listStart", listStart);
	session.setAttribute("listEnd", listEnd);

	
	List<AdmActLog> log = admDAO.logList( listStart, listEnd );
	
	// Model 에 저장
	model.addAttribute("logList", log);
		
	// 연결 설정
	return "admin/AdmLogList";
	}

	
	
	// 선택된 page에 따른 리스트 재로딩
	@RequestMapping("logListPage")
	public String logListPage(HttpSession session, HttpServletRequest request,
			Model model) throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	//log List 읽어 오기
	// 전체 데이타 갯수 가져오기
	int selectPage = Integer.parseInt( request.getParameter("page") );
	
	int listStep = 10;
	int listStart = (selectPage - 1) * listStep + 1;
	int listEnd = listStart + listStep - 1;
	
	System.out.println( listStart + "  " + listEnd );
	
	List<AdmActLog> log = admDAO.logList( listStart, listEnd );
	
	// Model 에 저장
	model.addAttribute("logList", log);
		
	// 연결 설정
	return "admin/AdmLogList";
	}


	
	// 선택된 page에 따른 리스트 재로딩
	@RequestMapping("logListPagePro")
	public String logListPagePro(HttpSession session, HttpServletRequest request,
			Model model) throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	//log List 읽어 오기

	
	int pageStep = (int) session.getAttribute("pageStep");
	int pageStart = Integer.parseInt( request.getParameter("page") );
	int pageEnd = pageStart + pageStep - 1;
	
	int totalCount = admDAO.logListCount();
	int maxPage = 0;
	
	if( ((totalCount / pageStep) * pageStep) < totalCount ) {
		maxPage = (totalCount / pageStep) + 1;
	}
	
	
	if( pageEnd > maxPage ) {
		pageEnd = maxPage;
	}
	
	session.setAttribute("pageStep", pageStep);
	session.setAttribute("pageStart", pageStart);
	session.setAttribute("pageEnd", pageEnd);
	
	int listStep = 10;
	int listStart = (pageStart-1)*10 + 1;
	int listEnd = listStart + listStep - 1;
	
	System.out.println( "page : " + pageStart + " " + pageEnd );
	System.out.println( "list : " + listStart + " " + listEnd );

	session.setAttribute("listStep", listStep);
	session.setAttribute("listStart", listStart);
	session.setAttribute("listEnd", listEnd);

	
	List<AdmActLog> log = admDAO.logList( listStart, listEnd );
	
	// Model 에 저장
	model.addAttribute("logList", log);
		
	// 연결 설정
	return "admin/AdmLogList";
	}

	// log 통계 화면
	@RequestMapping("logListAnal")
	public String logListAnal(HttpSession session, HttpServletRequest request,
			Model model) throws ServletException, IOException {
		
	// post 방식의 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	//log List 읽어 오기
	List<AdmActAnal> result = admDAO.actAnalList(); 
	
	model.addAttribute("logAnal", result);
		
	// 연결 설정
	return "admin/AdmLogAnal";
	}
	
	
}// class
