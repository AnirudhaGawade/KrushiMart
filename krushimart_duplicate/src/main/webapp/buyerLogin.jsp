<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buyer Login</title>
<link rel="stylesheet" href="farmerLogin.css">
</head>
<body>
	
	<% String message = (String)request.getAttribute("signUpSuccess"); 
		if(message!=null){
	%>
	<%= message %>
	<%} %>
	
	<% String loginMsg = (String)request.getAttribute("loginFailed"); 
		if(loginMsg!=null){
	%>
	<%= loginMsg %>
	<%} %>
	
	<% String updatePassword = (String)request.getAttribute("updatePassword"); 
		if(updatePassword!=null){
	%>
	<%= updatePassword %>
	<%} %>
	 <div class="maindiv">
	 	<div id=subdiv>
	 		<div class="formdiv">
	 		<h2>Buyer Login</h2>
			    <form action="buyerLogin" method="post">
			        
			           
			            <br>
			            <input type="email" placeholder="Email" name="email" required class="inp">
			            <br>
			            
			            <br>
			            <input type="password" placeholder="Password" name="password" required class="inp">
			            <br>
			            <br>
			            <button class="btn">LOGIN</button>
			            
			            <br><br>
			            
			            <button class="btn"> <a href="changePassword.jsp?role=buyer">Forgot Password</a> </button>
			            <br>
			            <br>
			           <button class="btn"> <a href="registration.jsp?role=buyer">Create Account</a> </button>
			      
			    </form>
   </div>
	 	</div>
	 </div>
</body>
</html>