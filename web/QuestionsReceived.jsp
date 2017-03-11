<%-- 
    Document   : QuestionsReceived
    Created on : Feb 8, 2017, 12:23:32 AM
    Author     : SHUMAIL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BeanClasses.DBHandler, BeanClasses.QuestionsAnswered, BeanClasses.Question"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>QuestionsReceivedJSP</title>
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
                    <li><a href="QuestionsAnsweredJSP.jsp">Profile</a></li>
                    <li  class="active"><a href="QuestionsReceived.jsp">Questions</a></li>
                    
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
                  
                    
                    <%
                       session = request.getSession(false);
                        String lgn = (String) session.getAttribute("loginname");
                        
                        DBHandler db = new DBHandler();
                        
                        ArrayList<Question> list = db.getQuestionsReceivedForUser(lgn);
                        int size = list.size();
                        %>
                         <h2>Questions Received
                            <span class="badge"><%=size %></span><br>
                         </h2>
                            <%! int i; %>
                        <%    
                        
                        for(i = 0 ; i<list.size(); i++) 
                        {%>
                        
                        
                        <div class="col-sm-2 "> </div>
                        <%--<div class="col-sm-8" id="Q_A">--%>
                            
                        <div class="panel panel-default">
                            <div class="panel-body"> 
                                <%! String question = null;
                                     String sender = null;%>
                              <% question = list.get(i).getQuestion(); 
                                  sender =  list.get(i).getSenderName();
                                  String nName = null;
                                  if(sender.equals(nName))
                                  { %>
                                         <strong><%=question%> </strong>
                                
                                <%--<form action="AnswerJSP.jsp?question='<%=question%>'"> --%>
                                <form action="AnswerJSP.jsp">
                                    
                                    <%--<input type="submit" class="btn btn-default" name ="answer" value="<%=i%>" style="float:right"> --%>
                                    <button type="submit" class="btn btn-default" name="answer" value="<%=i%>" ></button>    
   
                               
                              </form>
                                    
                                  <% }
                                  else {
                              %>
                              <strong><%=question%> </strong>
                              <%--<% session.setAttribute("searchedLoginname", sender); %> --%>
                              <a href="#"> <%=sender%></a>
                                
                                <%--<form action="AnswerJSP.jsp?question='<%=question%>'"> --%>
                                <form action="AnswerJSP.jsp">
                                    
                                    <input id="ansButton" type="submit" name ="answer" value="<%=i%>" style="float:right">
                                    <%--<button type="submit" class="btn btn-default" name="answer" value="<%=i%>" ></button>    
                                                --%>
                              
                                    
                              </form>
                                    <% } %>  
                                 <br>
                                 
                                 <br>
                            </div>     
                        <%--</div>--%>
                        </div>
                         <div class="col-sm-2"></div>
                              
                
                      <%
                                  }
                    %>    
                    
                </div>
                <div class="col-sm-2"></div>
            </div>              
        </div>   
              
    </body>
</html>