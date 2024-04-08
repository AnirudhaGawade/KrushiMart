<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.util.Collections"%>
<%@page import="krushimart.Post"%>
<%@page import="krushimart.PostCRUD"%>
<%@page import="java.util.List"%>
<%@page import="krushimart.User"%>
<%@page import="krushimart.UserCRUD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="farmerProfile.css">

</head>
<body>
	<%
	
	UserCRUD userCRUD = new UserCRUD();

	int id = Integer.parseInt(request.getParameter("id"));

	User user = userCRUD.fetchUserObject(id);
	PostCRUD postCRUD = new PostCRUD();
	List<Post> list = postCRUD.getPostByFarmerId(id);
	Collections.reverse(list);
	%>
	<h1>Farmer Profile page</h1>

	<br>
	<br>
	<div class="listdiv">
		<ul id="menu">
			<li class="listitem"><a href="farmerHomePage.jsp?id=<%=id%>">Home</a></li>

			<li class="listitem"><a href="farmerPost.jsp?id=<%=id%>">Post</a></li>

			<li class="listitem"><a href="#">Profile</a></li>

			<li class="listitem"><a href="farmerAbout.jsp?id=<%=id%>">About</a></li>

			<li class="listitem"><a href="farmerContact.jsp?id=<%=id%>">Contact</a></li>
		</ul>
	</div>


	<div id="profile">
		<%String editStatus=(String)request.getAttribute("editStatus"); %>
		<%if(editStatus!=null){ %>
		<%=editStatus %>
		<%} %>
		<div id="details">
			<h6>
				Name:
				<%=(user.getFirst_name() + " " + user.getLast_name())%></h6>
			<h6>
				Email:
				<%=user.getEmail()%></h6>
			<h6>
				Phone:
				<%=user.getPhone()%></h6>
			<h6>
				Address:
				<%=user.getAddress()%></h6>
		</div>
	</div>
	<a href="editProfile.jsp?role=farmer&id=<%=id%>"><button class="btn">Edit profile</button></a>
	<a href="changePassword.jsp?id=<%=id%>"><button class="btn">Change
			Password</button></a>
	<a href="farmerPost.jsp?id=<%=id%>"><button class="btn">Add Post</button></a>
	<a href="deletePost.jsp?id=<%=id%>"><button class="btn">Delete Post</button></a>
	<a href="logout?role=farmer"><button class="btn">Logout</button></a>

	<div class="subdiv">
		<%
	if (list != null) {
		for (Post p : list) {
		
				byte[] img = p.getPostImage();

	 			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					
					outputStream.write(img);

				
					byte[] imageBytes = outputStream.toByteArray();
					
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					
					outputStream.close();
			
	%>
	<div id="card">
		<div id="img">
			<img alt="dd" src="data:image/jpg;base64,<%=base64Image%>" id="postImage"> 
		</div>
	      
		<div id="desc">

			<h6>
				Product Name :<%=p.getProductName()%></h6>
			<h6>
				Product Quantity :<%=p.getProductQuantity()%></h6>
			<h6>
				Product Price :<%=p.getProductPrice()%></h6>
			<h6>
				Product Description :<%=p.getProductDescription()%></h6>
		</div>
	</div>
	<%
	}
	}
	%>
	</div>
</body>
</html>