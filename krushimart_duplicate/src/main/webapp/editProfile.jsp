<%@page import="krushimart.User"%>
<%@page import="krushimart.UserCRUD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	String role = request.getParameter("role");
	UserCRUD userCRUD = new UserCRUD();
	User user = userCRUD.fetchUserObject(id);
	String redirect=null;
	if(role.equals("farmer")){
		redirect="farmerProfile.jsp?id="+id;
	}
	else{
		redirect="buyerProfile.jsp?id="+id;
	}
	%>
	<h1>edit profile page</h1>
	<center>
		<form action="edit" method="POST">
			<div>
				<label style="color: rgb(187, 0, 187); font-size: 30px;"><b><u>Edit Profile
						</u></b></label><br>
				<br>
				<br> <input type="hidden" name="id" placeholder="Enter your id"
					maxlength="2" value=<%=user.getId()%> ><br>
				<br> <input type="text" name="first_name"
					placeholder="Enter your first name" maxlength="20" value=<%=user.getFirst_name() %>><br>
				<br> <input type="text" name="last_name"
					placeholder="Enter your last name" maxlength="20" value=<%=user.getLast_name() %>><br>
				<br> <input type="tel" name="phone"
					placeholder="Enter your phone" maxlength="10" value=<%=user.getPhone() %>><br>
				<br> <input type="text" name="address"
					placeholder="Enter your address" maxlength="20" value=<%=user.getAddress() %>><br>
				<br> <input type="email" name="email"
					placeholder="Enter your email" maxlength="20" value=<%=user.getEmail() %>><br>
				<br> <input type="password" name="password"
					placeholder="Enter your password" maxlength="8" value=<%=user.getPassword()%>><br>
				<br> <input type="hidden" name="role"
					placeholder="Enter your Role" maxlength="8" value=<%=user.getRole()%>>
			</div>
			<div class="btns">
				<button type="submit" class="btn">Save</button>
				<button class="btn"><a href=<%=redirect %>>Cancel</a></button>
			</div>

		</form>
	</center>
</body>
</html>