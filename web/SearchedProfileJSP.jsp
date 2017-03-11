<%-- 
    Document   : SearchedProfileJSP
    Created on : Jan 23, 2017, 4:07:45 AM
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
        <title>SearchedProfileJSP</title>
        <style type="text/css">
	#content
	{
		height: 500px;
	
	
			background-image: url('contentImage.jpg');
			background-repeat: no-repeat;
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
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                     
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
                    <%--
                           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                     <span class="glyphicon glyphicon-cog"></span>
                    --%>
                </form>
            </div>
        </nav>
        <div class="container-fluid">
           
            <div class="row" id="content">
                <div class="col-sm-2"></div>
                <div class="col-sm-8" id="QuesDiv"> 
                     <div class="jumbotron">
                         <%
                           String sLgn = (String)request.getSession().getAttribute("searchedLoginname"); 
                           DBHandler db = new DBHandler();
                           String fullName = db.SearchUsersFullName(sLgn);
                         %>
                        <h2>
                            <%=fullName %>
                              <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Question?Question!</button>


                        </h2>
                        
                    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Question?Question!</h4>
        </div>
        <div class="modal-body">
            <form action="QuestionJSP.jsp">
    <div class="form-group">
      
      <textarea class="form-control" rows="5" id="textarea" name="textArea"></textarea>
    </div>
        <div class="checkbox">
           <%-- <label><input type="checkbox" value="anonymously" name="sendAnonymously">Send Anonymously </label>--%>
           <label>Send Messege: </label>
           <input type="radio" value="anonymously" name="sendAnonymously"> Anonymously
<label><input type="radio" value="unAnonymously" name="sendAnonymously"> UnAnon</label>

        </div>      
                <button type="submit" class="btn btn-default" id="sendRaven">Send</button>
                 <br>
                  <br>
      
  </form>
        </div>
        <div class="modal-footer">
           
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
                    </div>  
                    
             
                    
                    <%
                        String lgn = (String) session.getAttribute("loginname");

                        
                        
                        
                        ArrayList<QuestionsAnswered> list = db.getQuestionsAnsweredForUser(sLgn);
                        int size = list.size();
                        %>
                         <h2>Questions Answered
                            <span class="badge"><%=size %></span><br>
                         </h2>
                        <%    
                        if(size == 0)
                        {%>
                            <div class="col-sm-2 "> </div>
                            <%--<div class="col-sm-8" id="Q_A">--%>

                            <div class="panel panel-default">
                                <div class="panel-body"> 
                                    <strong>No Questions to Display!</strong>
                                     <br>
                                     
                                     <br>
                                </div>     
                            <%--</div>--%>
                            </div>
                             <div class="col-sm-2"></div>
                      <% }
                        else
                        {
                            for(int i = 0 ; i<list.size(); i++) 
                            {

                            %>


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
                        }
                    %>    
                    
                </div>
                <div class="col-sm-2"></div>
            </div>              
        </div>   
              
    </body>
</html>