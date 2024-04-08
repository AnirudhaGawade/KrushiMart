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
	%>
	<h2>Buyer Contact page</h2>
	<br>
	<br>
	<div>
		<ul id="menu">
			<li><a href="buyerHomePage.jsp?id=<%=id%>">Home</a></li>

			<li><a href="buyerProfile.jsp?id=<%=id%>">Profile</a></li>

			<li><a href="buyerAbout.jsp?id=<%=id%>">About</a></li>

			<li><a href="#">Contact</a></li>
		</ul>
	</div>
</body>
</html>