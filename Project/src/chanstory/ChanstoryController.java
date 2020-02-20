package chanstory;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chanstory_servlet/*")
public class ChanstoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		MemberDAO dao=new MemberDAO();
		if(uri.indexOf("login.do")!=-1) {
			String userid=request.getParameter("userid");
			String password=request.getParameter("password");
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPassword(password);
			String result=dao.login(dto);
			request.setAttribute("result", result);
			String page="/Project20_02/main_login.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("join.do")!=-1){//회원등록
			String personal_corporate=request.getParameter("personal_corporate");
			String userid=request.getParameter("userid2");
			String password=request.getParameter("password2");
			String name=request.getParameter("name");
			String address=request.getParameter("address");
			String tel=request.getParameter("tel");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			String birthday = request.getParameter("birthday");
			String region=request.getParameter("region");
			String return_name=request.getParameter("return_name");
			String return_bank=request.getParameter("return_bank");
			String return_account=request.getParameter("return_account");
			MemberDTO dto=new MemberDTO();
			dto.setPersonal_corporate(personal_corporate);
			dto.setUserid(userid);
			dto.setPassword(password);
			dto.setName(name);
			dto.setAddress(address);
			dto.setTel(tel);
			dto.setPhone(phone);
			dto.setEmail(email);
			dto.setBirthday(birthday);
			dto.setRegion(region);
			dto.setReturn_name(return_name);
			dto.setReturn_bank(return_bank);
			dto.setReturn_account(return_account);
			dao.insert(dto);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
