<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.util.Collections"%>
<%@page import="krushimart.Post"%>
<%@page import="java.util.List"%>
<%@page import="krushimart.PostCRUD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
      #card {
        height: 175px;
        width: 500px;
        background-color: sienna;
        display: flex;
        flex-direction: row;
        margin:10px; 
      }
      #img {
        background-color: aquamarine;
        height: 100%;
        width: 40%;
      }
      #desc {
        background-color: rgb(127, 129, 255);
        height: 100%;
        width: 60%;
      }
    </style>
<body>
	<%
	int id = 0;
	if ((String) request.getAttribute("buyerId") == null) {
		id = Integer.parseInt(request.getParameter("id"));
	} else {
		id = Integer.parseInt((String)request.getAttribute("buyerId"));
	}
	PostCRUD postCRUD = new PostCRUD();
	List<Post> list = postCRUD.getAllPosts();
	Collections.reverse(list);
	%>
	<h2>Buyer home page</h2>
	<br>
	<br>
	<div>
		<ul id="menu">
			<li><a href="#">Home</a></li>

			<li><a href="buyerProfile.jsp?id=<%=id%>">Profile</a></li>

			<li><a href="buyerAbout.jsp?id=<%=id%>">About</a></li>

			<li><a href="buyerContact.jsp?id=<%=id%>">Contact</a></li>
		</ul>
	</div>
	<% if(list!=null)
	{
		for(Post p : list){
			
			byte[] img = p.getPostImage();

 			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				
				outputStream.write(img);

			
				byte[] imageBytes = outputStream.toByteArray();
				
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);
				
				outputStream.close();
		%>
	<div id="card">
      	<img alt="dd" src="data:image/jpg;base64,<%=base64Image%>" id="postImage">
      <div id="desc">
        <h6>Product Name :<%=p.getProductName() %></h6>
        <h6>Product Quantity :<%=p.getProductQuantity() %></h6>
        <h6>Product Price :<%=p.getProductPrice()%></h6>
        <h6>Product Description :<%=p.getProductDescription() %></h6>
      </div>
    </div>
	<%}} %>
</body>
</html>