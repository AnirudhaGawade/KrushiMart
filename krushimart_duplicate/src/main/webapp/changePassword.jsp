<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String updatePassword = (String)request.getAttribute("updatePassword"); 
		if(updatePassword!=null){
	%>
	<%= updatePassword %>
	<%} %>
	
	<%
	String redirect=null;
		if(request.getParameter("id")==null)
		{
			String role = request.getParameter("role");
			
					if("buyer".equals(role))
						redirect = "buyerLogin.jsp";
					else
						redirect = "farmerLogin.jsp";	
		}
		else{
			int id = Integer.parseInt(request.getParameter("id"));
			redirect = "farmerProfile.jsp?id="+id;
		}
		
		
	%>
	<div align="center">
        <form  action="updatePassword" method="post">
            <fieldset style="width: 500px; height: 350px;">                
     
          <h1>Change Password</h1>
        <label> Enter Your Email_ID:</label>
        <br>
        <input type="email" name="email" id="" placeholder="Enter Your Email_ID" required>
  
        <br><br>
        <label> Old Password:</label>
        <br>
        <input type="password" name="oldPassword" id=""placeholder="Enter Your Old Password" required>
        <br><br>    
        <label> New Password:</label>
        <br>
        <input type="password" name="newPassword" id=""placeholder="Enter Your New Password" required>
        <br><br>    
        <label>  Confirm New Password:</label>
        <br>
        <input type="password" name="confirmPassword" id=""placeholder="Enter Confirm New Password" required>
        <br><br>
        <button align="center"><b>UPDATE</b></button> `
         <button> <a href=<%=redirect %>>CANCEL</a> </button>
    </fieldset>
    

       </form>

    </div>
</body>
</html>