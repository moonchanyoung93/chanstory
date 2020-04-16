package chanstory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/chansession_servlet/*")
public class ChanSessionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		MemberDAO dao=new MemberDAO();
		if(uri.indexOf("login.do") !=-1) {
			String userid=request.getParameter("userid");
			String password=request.getParameter("password");
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPassword(password);
			String result=dao.login(dto);
			System.out.println(result);
			String page="/Project20_02/main_login.jsp";
			if(!result.equals("아이디 또는 비밀번호가 존재하지 않습니다.")) {
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page="/Project20_02/main_login.jsp";
				response.sendRedirect(request.getContextPath()+page);
			}else {
				response.sendRedirect(request.getContextPath()+page+"?message=error");
			}
		}else if(uri.indexOf("logout.do") != -1) {
			HttpSession session=request.getSession();
			//세션 비우기
			session.invalidate();
			String page=request.getContextPath()+"/Project20_02/main.jsp?message=logout";
			response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
