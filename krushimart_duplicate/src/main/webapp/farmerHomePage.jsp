<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Collections"%>
<%@page import="krushimart.PostCRUD"%>
<%@page import="krushimart.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="farmerHomePage.css">
</head>
<body>
	<%
		int id=0; 
		if((String)request.getAttribute("farmerId")==null){
			id = Integer.parseInt(request.getParameter("id"));
		}
		else{
			id = Integer.parseInt((String)request.getAttribute("farmerId"));
		}
	PostCRUD postCRUD = new PostCRUD();
	List<Post> list = postCRUD.getAllPosts();
	Collections.reverse(list);
	
	
	%>
	
	<h2>Farmer home page</h2>
	<br>
	<br>
	<div class="listdiv">
		<ul id="menu">
			<li class="listitem"><a href="#">Home</a></li>

			<li class="listitem"><a href="farmerPost.jsp?id=<%=id%>">Post</a></li>

			<li class="listitem"><a href="farmerProfile.jsp?id=<%=id%>">Profile</a></li>

			<li class="listitem"><a href="farmerAbout.jsp?id=<%=id%>">About</a></li>

			<li class="listitem"><a href="farmerContact.jsp?id=<%=id%>">Contact</a></li>
		</ul>
	</div>
	
	<div class="subdiv">
	<%String status =(String)request.getAttribute("status");
	if(status!=null){ %>
	<%=status %>
	<%} %>
	
	<%String postStatus =(String)request.getAttribute("postStatus");
	if(postStatus!=null){ %>
	<%=postStatus %>
	<%} %>
	
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
      <div id="img"> 
      	<img alt="dd" src="data:image/jpg;base64,<%=base64Image%>" id="postImage">
      </div>
      
      <div id="desc">
     	 
        <h6>Product Name :<%=p.getProductName() %></h6>
        <h6>Product Quantity :<%=p.getProductQuantity() %></h6>
        <h6>Product Price :<%=p.getProductPrice()%></h6>
        <h6>Product Description :<%=p.getProductDescription() %></h6>
      </div>
    </div>
	<%}} 
	//outputStream.flush();
	//outputStream.close();
	%>
	</div>
</body>
</html>