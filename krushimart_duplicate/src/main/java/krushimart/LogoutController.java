package krushimart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

@WebServlet("/logout")
public class LogoutController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String role = req.getParameter("role");
		
		HttpSession httpSession = req.getSession();
		httpSession.invalidate();
		
		if(role.equals("farmer"))
			resp.sendRedirect("farmerLogin.jsp");
		else
			resp.sendRedirect("buyerLogin.jsp");
	}
}
