<%-- 
    Document   : HomePageJSP
    Created on : Jan 22, 2017, 7:17:26 PM
    Author     : SHUMAIL
--%>

<%@page import="BeanClasses.DBHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>HomePageJSP</title>
<style type="text/css">
	#content
	{
		height: 500px;
	
	
			background-image: url('contentImage.jpg');
			background-repeat: no-repeat;
			background-position: top center;

	}

	.transbox {
  margin: 30px;
  background-color: #ffffff;
  border: 1px solid black;
  opacity: 0.6;
  filter: alpha(opacity=60); /* For IE8 and earlier */
}

.transbox li a {
  margin: 5%;
  font-weight: bold;
  color: black;
}
.transbox p  {
  margin: 5%;
  font-weight: bold;
  color: black;
}
	.dropdown
	{
		float: right;
	}
	#user
	{
		background-color: black;
		color : white;

   		 border: none;
    
	    padding: 15px 32px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	    border-radius: 12px;
	    align-self: center;
	}
	#user:hover
	{
	background-color: #404040;
	}
	.col-sm-8 li a
	{

		text-decoration: none;
		color: black;
		font-size: 20px;
                .transbox a {
  margin: 5%;
  font-weight: bold;
  color: black;
}
	}
	.col-sm-8 ul
	{
		margin: 20px 0px;
	}
        .glyphicon-cog
        {
            margin-top: 10px;
            color: white;
            
        }
        #dropBtn
        {
            background-color: black;
            border-color: black;
            
        }

</style>
</head>
<body>
    <nav class="navbar navbar-inverse">
         <div class="container-fluid">
            <div class="navbar-header">
                 
            </div>
            <ul class="nav navbar-nav">
                <%--<li class="active"><a href="HomePageJSP.jsp">Home</a></li> --%>
              <li><a href="QuestionsAnsweredJSP.jsp">Profile</a></li>
              <li><a href="QuestionsReceived.jsp">Questions</a></li>
            </ul>
             <div class="navbar navbar-right">
                 <span class="glyphicon glyphicon-cog"></span>
              <div class="dropdown">
                  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="dropBtn">
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">Settings</a></li>
                  <li><a href="LogoutJSP.jsp">Log Out</a></li>
                  
                </ul>
              </div>
                        
         </div>
                        <form class="navbar-form navbar-left" action="HomePageJSP.jsp">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" name="searchedLoginname" >
                <div class="input-group-btn">
                    <button class="btn btn-default"  type="submit" name="searchButton">
                    <i class="glyphicon glyphicon-search"></i>
                  </button>
                </div>
              </div>
            </form>
</div>
            
            
        
    </nav>
	<div class="container-fluid">
	
  		
               
	  	<div class="row" id="content">
	  		

                    <div class="col-sm-2"></div>

		  		<div class="col-sm-8">
		  			<div class="background">
						  <div class="transbox">
						    <p>  <%
                          String user1 = request.getParameter("searchedLoginname");
                              //session.setAttribute("loginname", u.getLoginname());
                              
                                       
                                         DBHandler db = new DBHandler();
                              String searchedUser = db.SearchAccountFromTableForUser(user1);
                              session.setAttribute("searchedLoginname", searchedUser);
                              if(searchedUser!= null)
                              {%>
                              <br>
                              <a href ="SearchedProfileJSP.jsp"><%= searchedUser %></a>
                              <%}
                              
                              else 
                              {
                                  out.println("not found");
                              }
                              %></p>
						  </div>
					</div>
		  		</div>
                                <div class="col-sm-2"></div>
	  		</div>
	  	</div>
	  		
	 
</body>

</html>
