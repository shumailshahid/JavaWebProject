<%-- 
    Document   : QuestionJSP
    Created on : Jan 23, 2017, 5:40:21 AM
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
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>QuestionJSP</title>
    </head>
    <body>
        <%
            String question = request.getParameter("textArea");
            String status = request.getParameter("sendAnonymously");
            //String status2 = request.getParameter("sendNormally");
            String receiverLgn = (String) session.getAttribute("searchedLoginname");
             String senderLgn = (String) session.getAttribute("loginname");
                        
            // out.println(question);
            //out.println(status);
            //out.println(status2);
            //out.println(receiverLgn);
            //out.println(senderLgn);
             DBHandler db = new DBHandler();
           if (status.equals("unAnonymously"))
            {
                        
                       out.println(status);
                        boolean flag = db.sendQuestions(question,receiverLgn,senderLgn);%>
                        <div class="w3-container">
                      <%if(flag == true)
                        {%>
                        
                            <div class="alert alert-success alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                            <strong>Success!</strong> Message sent.
                          </div>
                         <%        RequestDispatcher rd= request.getRequestDispatcher("QuestionsAnsweredJSP.jsp");
                    rd.forward(request, response);  %>
  
                       
                      
                        <%}
                        else
                        {%>
                              <div class="alert alert-danger alert-dismissable">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                                <strong>Failure!</strong> Message sending failed.
                              </div>
                               <%        RequestDispatcher rd= request.getRequestDispatcher("QuestionsAnsweredJSP.jsp");
                    rd.forward(request, response);  %>
                            <%}
                      
                        
                
            }
           else if(status.equalsIgnoreCase("anonymously"))
            {
                
                
               
                 boolean flag = db.sendAnonymousQuestion(question,receiverLgn);
                        
                if(flag == true)
                {%>
                        
                            <div class="alert alert-success alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                            <strong>Success!</strong> Message sent.
                            <%        RequestDispatcher rd= request.getRequestDispatcher("QuestionsAnsweredJSP.jsp");
                    rd.forward(request, response);  %>
                          </div>
                       
                      
                <%}
                        else
                        {%>
                              <div class="alert alert-danger alert-dismissable">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                                <strong>Failure!</strong> Message sending failed.
                              </div>
                               <%        RequestDispatcher rd= request.getRequestDispatcher("QuestionsAnsweredJSP.jsp");
                    rd.forward(request, response);  %>
                        <%}
                }
           
            %> 
             </div>
                
        
    </body>
</html>
