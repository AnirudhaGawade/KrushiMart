<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<link rel="stylesheet" href="home.css">
<style type="text/css">
	#loginfarmerdiv{
		background-color: black;
		height: 20px;
		width: 50px;

	}
</style>
</head>
<body>
	 <div class="maindiv" id="bgimg">
       
       <div class="submain">
	       <div class="applogo">
	        <img src="image/krmt.png" alt="logo" class="logoimg">
	       </div>
           <div id="cards">
           		 <div class="farmer_div" >
              
                   <div id="farmer_icon_div"> <img alt="farmer icon" src="image/farmer_icon.jpg" id="farmer_icon"></div>
                   <div class="farmer_button">
                   <button class="redirect_button1"> <a href="registration.jsp?role=farmer">Farmer</a></button>
                  
                   </div>
              	<button id="farmerloginbutton"> <a href="farmerLogin.jsp">Farmer Login</a> </button>
            	</div>
	            <div class="buyer_div">              
	                    <div id="buyer_icon_div">
	                        <img src="image/buyer_icon.jpg" alt="famericon" width="110px" id="buyer_icon">
	                    </div>
	                   <div class="buyer_button">
	                  	 <button class="redirect_button2"><a href="registration.jsp?role=buyer">Buyer</a></button>
	               	    
	                   </div>
	                   <button id="farmerloginbutton"> <a href="buyerLogin.jsp">Buyer Login</a> </button>
	               </div>
	            </div>
           </div>
       </div>
    </div>
</body>
</html>