<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="staticPage.css">
</head>
<body>
	<%int id = Integer.parseInt(request.getParameter("id"));  %>
	<h2>Farmer Contact page</h2>
	<br>
	<br>
	<div class="listdiv">
		<ul id="menu">
			<li><a href="farmerHomePage.jsp?id=<%=id%>">Home</a></li>

			<li><a href="farmerPost.jsp?id=<%=id%>">Post</a></li>

			<li><a href="farmerProfile.jsp?id=<%=id%>">Profile</a></li>

			<li><a href="farmerAbout.jsp?id=<%=id%>">About</a></li>

			<li><a href="#">Contact</a></li>
		</ul>
	</div>
	<div>
		<p>Lorem Ipsum is simply dummy text of the printing and
			typesetting industry. Lorem Ipsum has been the industry's standard
			dummy text ever since the 1500s, when an unknown printer took a
			galley of type and scrambled it to make a type specimen book. It has
			survived not only five centuries, but also the leap into electronic
			typesetting, remaining essentially unchanged. It was popularised in
			the 1960s with the release of Letraset sheets containing Lorem Ipsum
			passages, and more recently with desktop publishing software like
			Aldus PageMaker including versions of Lorem Ipsum</p>

	</div>
</body>
</html>