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

import dao.UserMybatis;
import model.User;

@Controller
@RequestMapping("/user/")
public class UserController {
	Model m;
	HttpSession session;
	HttpServletRequest request;

	@Autowired
	UserMybatis userdao = new UserMybatis();

	@ModelAttribute
	public void service(HttpServletRequest request, Model m) throws ServletException, IOException {
		this.request = request;
		this.m = m;
		session = request.getSession();
	}

	@RequestMapping("index")
	public String index() throws ServletException, IOException {

		return "index";
	}

	// 회원가입
	@RequestMapping("join")
	public String join() throws ServletException, IOException {

		return "user/join";
	}

	@RequestMapping("joinPro")
	public String joinPro(User user) throws ServletException, IOException {
		System.out.println(user);
		int num = userdao.userInsert(user);

		String msg = "";
		String url = "";

		if (num > 0) {
			msg = user.getUserName() + "님의 회원가입이 완료 되었습니다";
			url = "user/login";
		} else {
			msg = "회원가입이 실패 하였습니다";
			url = "user/join";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("joinInfo")
	public String joinInfo() throws ServletException, IOException {

		String userId = (String) session.getAttribute("userId");
		User user = userdao.getUser(userId);

		request.setAttribute("user", user);

		return "user/joinInfo";
	}

	@RequestMapping("login")
	public String login() throws ServletException, IOException {

		return "user/login";
	}

	@RequestMapping("loginPro")
	public String loginPro(String userId, String userPass) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String msg = userId + "님이 로그인 하셨습니다";
		String url = "";
		User user = userdao.getUser(userId);
		System.out.println("입력한 유저 정보" + user);

		if (user != null) {
			if (userPass.equals(user.getUserPass())) {
				session.setAttribute("userId", userId);
			} else {
				msg = "비밀번호가 맞지 않습니다";
				url = "user/login";
			}
		} else {
			msg = "id를 확인 하세요";
			url = "user/login";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("logout")
	public String logout() throws ServletException, IOException {

		session.invalidate();
		request.setAttribute("msg", "로그아웃 되었습니다");
		request.setAttribute("url", "");

		return "alert";
	}

	@RequestMapping("userUpdate")
	public String userUpdate() throws ServletException, IOException {

		String userId = (String) session.getAttribute("userId");
		User user = userdao.getUser(userId);

		request.setAttribute("user", user);

		return "user/userUpdate";
	}

	@RequestMapping("userUpdatePro")
	public String userUpdatePro(User user) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String userId = (String) session.getAttribute("userId");

		User userdb = userdao.getUser(userId);

		user.setUserId(userId);
		String msg = "";
		String url = "user/userUpdate";

		if (userdb != null) {
			if (userdb.getUserPass().equals(user.getUserPass())) {
				msg = "수정 하였습니다";
				userdao.userUpdate(user);
				url = "user/joinInfo";
			} else {
				msg = "비밀번호가 틀렸습니다";
			}
		} else {
			msg = "수정 할 수 없습니다";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	// 회원 탈퇴
	@RequestMapping("userDelete")
	public String userDelete() throws ServletException, IOException {

		return "user/userDelete";
	}

	@RequestMapping("userDeletePro")
	public String userDeletePro(String userPass) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String userId = (String) session.getAttribute("userId");

		User userdb = userdao.getUser(userId);

		String msg = "";
		String url = "user/userDelete";

		if (userdb != null) {
			if (userdb.getUserPass().equals(userPass)) {
				msg = "탈퇴 하였습니다";
				session.invalidate();
				userdao.userDelete(userId);
				url = "user/login";
			} else {
				msg = "비밀번호가 틀렸습니다";
			}
		} else {
			msg = "탈퇴 할 수 없습니다";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("userList")
	public String userList() throws ServletException, IOException {

		List<User> li = userdao.userList();
		request.setAttribute("li", li);

		return "user/userList";
	}

	// 비밀번호 변경
	@RequestMapping("userPass")
	public String userPass() throws ServletException, IOException {

		String userId = (String) session.getAttribute("userId");
//			UserDAO dao = new UserDAO();
		User user = userdao.getUser(userId);

		request.setAttribute("user", user);

		return "user/userPass";
	}

	@RequestMapping("userPassPro")
	public String userPassPro(String userPass, String chgpass) throws ServletException, IOException {

		String userId = (String) session.getAttribute("userId");

		User userdb = userdao.getUser(userId);

		String msg = "";
		String url = "user/userPass";
		if (userdb != null) {
			if (userdb.getUserPass().equals(userPass)) {
				msg = "비밀번호를 수정 하였습니다";
				session.invalidate();
				userdao.chgPassUser(userId, chgpass);
				url = "user/login";
			} else {
				msg = "비밀번호가 틀렸습니다";
			}
		} else {
			msg = "비밀번호를 수정 할 수 없습니다";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "alert";
	}
}
