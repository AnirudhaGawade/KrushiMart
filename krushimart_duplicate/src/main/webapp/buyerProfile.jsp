<%@page import="krushimart.Post"%>
<%@page import="java.util.List"%>
<%@page import="krushimart.PostCRUD"%>
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
<%int id = Integer.parseInt(request.getParameter("id")); 
		UserCRUD userCRUD = new UserCRUD();
		User user =userCRUD.fetchUserObject(id);
		PostCRUD postCRUD = new PostCRUD();
		List<Post> list = postCRUD.getPostByFarmerId(id);
		
	%>
	<h1>Buyer Profile page</h1>
	
	<br>
	<br>
	<div>
		<ul id="menu">
			<li><a href="buyerHomePage.jsp?id=<%=id%>">Home</a></li>

			<li><a href="#">Profile</a></li>

			<li><a href="buyerAbout.jsp?id=<%=id%>">About</a></li>

			<li><a href="buyerContact.jsp?id=<%=id%>">Contact</a></li>
		</ul>
	</div>
<div id="profile">
      <div id="profileImage">Image</div>
      <div id="details">
        <h6>Name: <%= (user.getFirst_name()+" "+user.getLast_name()) %></h6>
        <h6>Email: <%= user.getEmail() %></h6>
        <h6>Phone: <%=user.getPhone()%></h6>
        <h6>Address: <%=user.getAddress()%></h6>
      </div>
    </div>
    <a href="editProfile.jsp?role=buyer&id=<%=id%>"><button>Edit profile</button></a>
    <a href="logout?role=buyer"><button>Logout</button></a>

</body>
</html>