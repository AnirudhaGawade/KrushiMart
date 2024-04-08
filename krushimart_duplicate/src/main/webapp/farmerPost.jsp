<%@page import="krushimart.PostCRUD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="farmerPost.css">
</head>
<body>
	<%int id = Integer.parseInt(request.getParameter("id")); %>
	<% 
		PostCRUD crud = new PostCRUD();
		int count=crud.getPostCount();
	%>
	<div class="listdiv">
		<ul id="menu">
			<li class="listitem"><a href="farmerHomePage.jsp?id=<%=id%>">Home</a></li>

			<li class="listitem"><a href="#">Post</a></li>

			<li class="listitem"><a href="farmerProfile.jsp?id=<%=id%>">Profile</a></li>

			<li class="listitem"><a href="farmerAbout.jsp?id=<%=id%>">About</a></li>

			<li class="listitem"><a href="farmerContact.jsp?id=<%=id%>">Contact</a></li>
		</ul>
	</div>
	
		
			<div class="">
			
				<form action="farmerPost?id=<%=id %>" method="post" enctype="multipart/form-data">

					<div align="center">
						<h1>Post Page</h1>
						<div>
							<input type="hidden" placeholder="Post Id" name="postId" value=<%=(++count) %> class="inp">
							<input type="text" id="productName" name="productName"
								 placeholder="Product Name" size="51px"
								 required class="inp"><br> <br>
							
							<input type="text" id="productQuantity" name="productQuantity"
									 placeholder="Product Quantity" size="35.4px" required class="inp">
						
							
							<br> <input type="text" id="productPrice"
								name="productPrice"  placeholder="Product Price"
								size="51px" required class="inp"><span>&#8377;</span><br> <br> <input type="text"
								id="productDescription" name="ProductDescription"
								placeholder="Product Description" size="51px" required class="inp"><br>
							<br>
							<input type="file" name="postImage" required >
						</div>
						<br>
						<input type="submit" value="Post" class="btn"> 
						<br>
						<br>
						<br>
						<button align="center" class="btn"><b> <a href="farmerHomePage.jsp?id=<%=id%>">Cancel</a> </b></button>
					</div>

					


				</form>
			</div>
		
	
</body>
</html>