package aop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.AdmActLog;

@Component
public class LogAOP  extends HttpServlet {
	@Autowired
	SqlSessionTemplate session;
	
    private static final long serialVersionUID = 1L;

    String user;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {        
            // 세션 객체 가져오기
            HttpSession session = request.getSession();

            // 세션에서 사용자 정보 읽기
            user = (String) session.getAttribute("user");
    }
    
    // AOP 적용으로 사용자 및 활동 자동 기록
	public void logPrint( String returning ){
		
		if( user == null ) {
			user = "비회원";
		}
		
		System.out.println( "user : " + user + " 실행 : " + returning);
		
		AdmActLog admActLog = new AdmActLog();
		
		admActLog.setUserId(user);
		admActLog.setAct(returning);
		
		System.out.println( admActLog );
		
		int num = session.insert( "admin.insertActLog", admActLog );
		
		System.out.println( num );
		
	}
	
	
		
	
	
}// class
