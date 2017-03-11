<%-- 
    Document   : AnswerJSP
    Created on : Feb 8, 2017, 2:34:09 AM
    Author     : SHUMAIL
--%>

<%@page import="BeanClasses.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BeanClasses.DBHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>AnswerJSP</title>
        <style type="text/css">
	#content
	{
		height: auto;
	
	
			background-image: url('contentImage.jpg');
			background-repeat: no-repeat;
			background-position: top center;

	}
        #QuesDiv
        {
            height: auto;
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
                   
                </div>
                <ul class="nav navbar-nav">
                    <%--<li ><a href="HomePageJSP.jsp">Home</a></li>--%>
                    <li ><a href="QuestionsAnsweredJSP.jsp">Profile</a></li>
                    <li class="active"><a href="QuestionsReceived.jsp">Questions</a></li>
                    
                </ul>
                   
              <div class="navbar navbar-right">
                    
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="dropBtn">
                            <span class="caret"></span></button>
                                 <ul class="dropdown-menu">
                                    <li><a href="#">Settings</a></li>
                                     <li><a href="#">Log Out</a></li>

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
   
    
        
        <div>
            <%
                    session = request.getSession(false);   
                    String lgn = (String) session.getAttribute("loginname");
                        
                        DBHandler db = new DBHandler();
                        
                        ArrayList<Question> list = db.getQuestionsReceivedForUser(lgn);
                        int size = list.size();
                        String btnIndex = (String) request.getParameter("answer");
                        int i = Integer.parseInt(btnIndex);
                       // out.println(i);
                       String ques =  list.get(i).getQuestion();
                       session.setAttribute("question", ques);
                       %>
                       <hr>
                       <strong><%=ques%></strong>
                       <hr>
                       <p></p>
                    
               
            <form action="SaveAnswerJSP.jsp">
           <textarea class="form-control" rows="5" id="textarea" name="textArea" placeholder="What is your reply?"></textarea>
                  
               
          
                   
           <input type="submit" value="Answer">
                   
            </from>
            
            
        </div>
                       
        
    </body>
</html>
