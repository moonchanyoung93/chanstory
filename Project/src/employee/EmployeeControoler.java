package employee;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/employee_servlet/*")
public class EmployeeControoler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		EmployeeDAO dao=new EmployeeDAO();
		if(uri.indexOf("list.do")!=-1) {
			Map<String, Object> map= new HashMap<>();
			List<EmployeeDTO> list=dao.employeeList();
			map.put("list", list);
			map.put("count", list.size());
			
			request.setAttribute("map", map);
			String page="/Project19_12_10/employee_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(uri.indexOf("join.do")!=-1){//회원등록
			String no=request.getParameter("no");
			String password=request.getParameter("password");
			String name=request.getParameter("name");
			String gender=request.getParameter("gender");
			String hp=request.getParameter("hp");
			String address=request.getParameter("address");
			String team=request.getParameter("team");
			String join_date=request.getParameter("join_date");
			EmployeeDTO dto=new EmployeeDTO();
			dto.setNo(no);
			dto.setPassword(password);
			dto.setName(name);
			dto.setGender(gender);
			dto.setHp(hp);
			dto.setAddress(address);
			dto.setTeam(team);
			dto.setJoin_date(join_date);
			dao.insert(dto);
			response.sendRedirect(context+"/Project19_12_10/employee_list.html");
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
