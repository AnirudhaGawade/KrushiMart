package krushimart;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatePassword")
public class UpdatePasswordController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email =req.getParameter("email");
		String newPassword = req.getParameter("newPassword");
		String confirmPassword = req.getParameter("confirmPassword");
		String oldPassword = req.getParameter("oldPassword");
		
		UserCRUD userCRUD = new UserCRUD();
		try {
			String[] arr=userCRUD.fetchUser(email);
			if(arr[0]!=null) {
				
				if(oldPassword.equals(arr[0]) && newPassword.equals(confirmPassword) && userCRUD.updatePassword(email,newPassword)!=0) {
					
					if(arr[1].equals("buyer")) {
						req.setAttribute("updatePassword", "Password Updated Successfully!!! Please Login");
						RequestDispatcher dispatcher = req.getRequestDispatcher("buyerLogin.jsp");
						dispatcher.forward(req, resp);
					}
					else {
						req.setAttribute("updatePassword", "Password Updated Successfully!!! Please Login");
						RequestDispatcher dispatcher = req.getRequestDispatcher("farmerLogin.jsp");
						dispatcher.forward(req, resp);
					}
				}
				else {
					req.setAttribute("updatePassword", "Invalid Credentials");
					RequestDispatcher dispatcher = req.getRequestDispatcher("changePassword.jsp");
					dispatcher.forward(req, resp);
				}
			}
			else {
				req.setAttribute("updatePassword", "Please enter valid email!!!");
				RequestDispatcher dispatcher = req.getRequestDispatcher("changePassword.jsp");
				dispatcher.forward(req, resp);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
