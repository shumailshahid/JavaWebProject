<%-- 
    Document   : QuestionsAnsweredJSP
    Created on : Jan 23, 2017, 2:04:12 AM
    Author     : SHUMAIL
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="BeanClasses.DBHandler, BeanClasses.QuestionsAnswered"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>QuestionsAnsweredJSP</title>
        <style type="text/css">
	#content
	{
		height: auto;
	
	
			background-image: url('contentImage.jpg');
			background-repeat: repeat-y;
			background-position: top center;

	}
        #QuesDiv
        {
            height: 500px;
            background-color: white;
        }
        .jumbotron
        {
           text-align: center;
        }
          .glyphicon-cog
        {
            margin-top: 0px;
            
            color: white;
            
        }
        #dropBtn
        {
            background-color: black;
            border-color: black;
            
        }
        .checkbox
        {
            float: left;
        }
        #sendRaven
        {
            float: right;
        }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                     <%--<a class="navbar-brand" href="#">Raven</a> --%>
                </div>
                <ul class="nav navbar-nav">
                    <%--<li ><a href="HomePageJSP.jsp">Home</a></li>--%>
                    <li class="active"><a href="QuestionsAnsweredJSP.jsp">Profile</a></li>
                    <li><a href="QuestionsReceived.jsp">Questions</a></li>
                    
                </ul>
                   
              <div class="navbar navbar-right">
                    
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
                <div class="col-sm-8" id="QuesDiv"> 
                     <div class="jumbotron">
                         <%
                           session = request.getSession(false);
                                   
                           String username = (String)request.getSession().getAttribute("loginname");
                       
                           DBHandler db = new DBHandler();
                           String fullName = db.SearchUsersFullName(username);
                         %>
                        <h2>
                            <%=fullName %><br>
                            
                        </h2>
                            <italic><%=username %></italic><br>
                
                    </div>  
                    
                    <%
                        String lgn = (String) session.getAttribute("loginname");
                        
                        
                        
                        ArrayList<QuestionsAnswered> list = db.getQuestionsAnsweredForUser(lgn);
                        int size = list.size();
                        %>
                         <h2>Questions Answered
                            <span class="badge"><%=size %></span><br>
                         </h2>
                        <%    
                        for(int i = 0 ; i<list.size(); i++) 
                        {%>
                        
                        
                        <div class="col-sm-2 "> </div>
                        <%--<div class="col-sm-8" id="Q_A">--%>
                            
                        <div class="panel panel-default">
                            <div class="panel-body"> 
                                <strong><%=list.get(i).getQuestion()%> </strong>
                                 <br>
                                 <%= list.get(i).getAnswer()%>
                                 <br>
                            </div>     
                        <%--</div>--%>
                        </div>
                         <div class="col-sm-2"></div>
                              
                
                      <%}
                    %>    
                    
                </div>
                <div class="col-sm-2"></div>
            </div>              
        </div>   
              
    </body>
</html>
