package krushimart;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteFarmerPost")
public class DeleteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int postId = Integer.parseInt(req.getParameter("postId"));
		int farmerId = Integer.parseInt(req.getParameter("farmerId"));
		
		System.out.println(postId);
		
		PostCRUD postCRUD = new PostCRUD();
		try {
			if(postCRUD.deletePost(postId)!=0) {
				
				req.setAttribute("deletePostStatus", "post deleted successfully");
				RequestDispatcher dispatcher = req.getRequestDispatcher("deletePost.jsp?id="+farmerId);
				dispatcher.forward(req, resp); 
			}
			else {
				System.out.println("Delete Failed");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
