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
<title>Delete Post</title>
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
       #postImage{
      height: 100px;
      width:100px
      }
    </style>
    <link rel="stylesheet" href="deletePost.css">
</head>

<body>
	<% int id = Integer.parseInt(request.getParameter("id")); 
		PostCRUD postCRUD = new PostCRUD();
		List<Post> list =postCRUD.getPostByFarmerId(id);
		Collections.reverse(list);
	%>
	<button><a href="farmerProfile.jsp?id=<%= id %>">Go back To Farmer Profile</a></button>
	<%String deletePostStatus=(String)request.getAttribute("deletePostStatus"); %>
		<%if(deletePostStatus!=null){ %>
		<%=deletePostStatus %>
		<%} %>
	<br>
	<br>
	<div>
		<table>
			<thead>
				<tr>
					<th>Post</th>
					<th>Delete</th>		
				</tr>
			</thead>
			<tbody>
			<% for(Post post:list)
				{
				byte[] img = post.getPostImage();

	 			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					
					outputStream.write(img);

				
					byte[] imageBytes = outputStream.toByteArray();
					
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					
					outputStream.close();
				%>
			<tr>
			<td>
			<div>
				<div id="card">
			      
			      <div id="img"> <img alt="dd" src="data:image/jpg;base64,<%=base64Image%>" id="postImage"></div>
      
			      <div id="desc">
			   
			        <h6>Product Name :<%=post.getProductName() %></h6>
			        <h6>Product Quantity :<%=post.getProductQuantity() %></h6>
			        <h6>Product Price :<%=post.getProductPrice()%></h6>
			        <h6>Product Description :<%=post.getProductDescription() %></h6>
			      </div>
   			 </div>
			</div>
			</td>
			<td> <button> <a href="deleteFarmerPost?farmerId=<%=id%>&postId=<%=post.getPostId()%>">Delete</a> </button> </td>
			</tr>
			<%} %>
			</tbody>
		</table>
	</div>
		
	
	
</body>
</html>