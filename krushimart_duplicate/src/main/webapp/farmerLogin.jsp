<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmer Login</title>
<link rel="stylesheet" href="farmerLogin.css">
</head>
<body>
	

	<div class="maindiv">
		<div id="subdiv">

			<div>
				<h2 id="message">
					<%
					String message = (String) request.getAttribute("signUpSuccess");
					if (message != null) {
					%>
					<%=message%>
					<%
					}
					%>

					<%
					String loginMsg = (String) request.getAttribute("loginFailed");
					if (loginMsg != null) {
					%>
					<%=loginMsg%>
					<%
					}
					%>

					<%
					String updatePassword = (String) request.getAttribute("updatePassword");
					if (updatePassword != null) {
					%>
					<%=updatePassword%>
					<%
					}
					%>
				</h2>
			</div>

			<div class="formdiv">
				<h2>Farmer Login</h2>
				<form action="farmerLogin" method="post">

					<br> <input type="email" placeholder="Email" name="email"
						required class="inp"> <br> <br> <input
						type="password" placeholder="Password" name="password" required
						class="inp"> <br> <br>
					<button class="btn">LOGIN</button>
					<br> <br>

					<button class="btn">
						<a href="changePassword.jsp?role=farmer">Forgot PassWord</a>
					</button>
					<br> <br>
					<button class="btn">
						<a href="registration.jsp?role=farmer">Create Account</a>
					</button>

				</form>
			</div>
		</div>
	</div>

</body>
</html>