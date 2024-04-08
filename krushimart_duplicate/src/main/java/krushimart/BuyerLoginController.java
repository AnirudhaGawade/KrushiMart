package krushimart;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/buyerLogin")
public class BuyerLoginController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String buyerEmail = req.getParameter("email");
		String buyerPass = req.getParameter("password");
		
		UserCRUD crud = new UserCRUD();
		try {
			String[] arr = crud.fetchUser(buyerEmail);
			String dbPass = arr[0];
			String role = arr[1];
			if(dbPass!=null) {
				if(dbPass.equals(buyerPass) && role.equals("buyer")) {
					//home page
					req.setAttribute("buyerId", arr[2]);
					
					HttpSession httpSession = req.getSession();
					httpSession.setAttribute("farmerEmail", buyerEmail);
					
					RequestDispatcher dispatcher = req.getRequestDispatcher("buyerHomePage.jsp");
					dispatcher.forward(req, resp);
				}
				else {
					//login page
					req.setAttribute("loginFailed", "Invalid Password");
					RequestDispatcher dispatcher = req.getRequestDispatcher("buyerLogin.jsp");
					dispatcher.forward(req, resp);
				}
			}
			else {
				//sign up
				req.setAttribute("accountNotFound", "Please SignUp First!!!");
				RequestDispatcher dispatcher = req.getRequestDispatcher("registration.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		
	}
}
