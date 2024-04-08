package krushimart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/farmerLogin")
public class FarmerLoginController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String farmerEmail = req.getParameter("email");
		String farmerPass = req.getParameter("password");

		UserCRUD crud = new UserCRUD();
		try {
			String[] arr = crud.fetchUser(farmerEmail);
			String dbPass = arr[0];
			String role = arr[1];
			if (dbPass != null) {
				if (dbPass.equals(farmerPass) && role.equals("farmer")) {
					// home page
					
					HttpSession httpSession=req.getSession();
					httpSession.setAttribute("farmerSession", farmerEmail);
					
					req.setAttribute("farmerId", arr[2]);
					req.setAttribute("status", "Login Success");
					RequestDispatcher dispatcher = req.getRequestDispatcher("farmerHomePage.jsp");
					dispatcher.forward(req, resp);
				} else {
					// login page
					req.setAttribute("loginFailed", "Invalid Password");
					RequestDispatcher dispatcher = req.getRequestDispatcher("farmerLogin.jsp");
					dispatcher.forward(req, resp);
				}
			} else {
				// sign up
				req.setAttribute("accountNotFound", "Please SignUp First!!!");
				RequestDispatcher dispatcher = req.getRequestDispatcher("registration.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
