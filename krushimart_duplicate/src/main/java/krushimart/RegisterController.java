package krushimart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/registration")
public class RegisterController extends HttpServlet{
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		int id=Integer.parseInt(req.getParameter("id"));
		String first_name=req.getParameter("first_name");
		String last_name=req.getParameter("last_name");
		long phone=Long.parseLong(req.getParameter("phone"));
		String address=req.getParameter("address");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String role=req.getParameter("role");
		
		
		User user=new User();
		user.setId(id);
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setPhone(phone);
		user.setAddress(address);
		user.setEmail(email);
		user.setPassword(password);
		user.setRole(role);
		
		UserCRUD userCRUD=new UserCRUD();
		try {
			
			String[] arr = userCRUD.fetchUser(email);
			if(arr[0]==null) {
				int count = userCRUD.registerUser(user);
				//validations
				if(count!=0) {
					if(role.equalsIgnoreCase("farmer")) {
						req.setAttribute("signUpSuccess", "Farmer SignUp Successful!!!");
						RequestDispatcher dispatcher = req.getRequestDispatcher("farmerLogin.jsp");
						dispatcher.forward(req, resp);
					}
					else {
						req.setAttribute("signUpSuccess", "Buyer SignUp Successful!!!");
						RequestDispatcher dispatcher = req.getRequestDispatcher("buyerLogin.jsp");
						dispatcher.forward(req, resp);
					}
				}
			}
			else {
				req.setAttribute("userPresent", "User Already Present, Please Login!!!");
				RequestDispatcher dispatcher = req.getRequestDispatcher("registration.jsp");
				dispatcher.forward(req, resp);
			}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
