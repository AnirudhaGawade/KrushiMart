<%@page import="krushimart.UserCRUD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<link rel="stylesheet" href="register.css">
</head>
<body>
	<%
	String message = (String) request.getAttribute("accountNotFound");
	String userPresent = (String) request.getAttribute("userPresent");
	if (message != null) {
	%>
	<%=message%>
	<%
	}
	%>
	<%
	String role = request.getParameter("role");
	if (userPresent != null) {
	%>
	<%=userPresent%>
	<%
	}
	UserCRUD crud = new UserCRUD();
	int count = crud.getRecordCount();
	%>
	<div class="maindiv">
		<div id="subdiv">
			<div id="img_div">
			
			<img alt="farmer icon" src="image/common.jpg" id="farmer_icon">
			
			</div>
			
			<div id="form_div">


				<div id="form_content_div">
					<h4>Sign up</h4>
					<form action="registration" method="POST">
						<div>

							<input type="hidden" name="id" placeholder="Enter your id"
								value=<%=(++count)%>><br>
							<input type="text" name="first_name"
								placeholder="Enter your first name" required class="inp"><br>
							 <input type="text" name="last_name"
								placeholder="Enter your last name" required class="inp"><br>
							 <input type="tel" name="phone"
								placeholder="XXX-XXX-XXXX" required class="inp" pattern="[6789][0-9]{9}"><br>
							 <input type="text" name="address"
								placeholder="Enter your address" required class="inp"><br>
							 <input type="email" name="email"
								placeholder="Enter your email" required class="inp"><br>
							<input type="password" name="password"
								placeholder="Enter your password" required class="inp"><br>
							

							<%
							if ("farmer".equals(role)) {
							%>
							<input type="radio" name="role" value="farmer" checked class="radio">
							<input type="radio" name="role" value="buyer" disabled class="radio">
							<%
							} else {
							%>
							<input type="radio" name="role" value="farmer" disabled class="radio">
							<input type="radio" name="role" value="buyer" checked class="radio">
							<%
							}
							%>
						</div>
						<div class="btns">
							<button type="submit" class="btn">Submit</button>							
						</div>

					</form>
					<h5>Already a member? <a href="farmerLogin.jsp">Sign in</a></h5>
				</div>


			</div>
		</div>
	</div>
</body>
</html>