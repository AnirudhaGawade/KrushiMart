package krushimart;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edit")
public class EditController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		String first_name=req.getParameter("first_name");
		String last_name=req.getParameter("last_name");
		long phone=Long.parseLong(req.getParameter("phone"));
		String address=req.getParameter("address");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String role = req.getParameter("role");
		
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
			
			if(userCRUD.updateUser(user)!=0) {
				
				if(role.equals("buyer")) {
					req.setAttribute("editStatus", "profile edited successfully");
					RequestDispatcher dispatcher = req.getRequestDispatcher("buyerProfile.jsp?id="+id);
					dispatcher.forward(req, resp);
				}
				else {
					RequestDispatcher dispatcher = req.getRequestDispatcher("farmerProfile.jsp?id="+id);
					dispatcher.forward(req, resp);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
}
