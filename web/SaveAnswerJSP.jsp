<%-- 
    Document   : SaveAnswerJSP
    Created on : Feb 9, 2017, 1:46:54 AM
    Author     : SHUMAIL
--%>

<%@page import="BeanClasses.DBHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SaveAnswerJSP</title>
    </head>
    <body>
        <%
                //session = request.getSession(false);
               // String q = (String) session.getAttribute("ques");
               // out.println(q);
            session = request.getSession(false);   
                    String lgn = (String) session.getAttribute("loginname");
                    String ques = (String) session.getAttribute("question");
                        DBHandler db = new DBHandler();
                //String answer = (String) request.getParameter("replay");
                String answer= (String) request.getParameter("textArea");
                out.println(ques);
                out.println(answer);
                // out.println(answer2);
      
       
                boolean flagg1 = db.saveAnsweredQuestions(ques,answer,lgn);
                boolean flagg2 = db.saveAnsweredQuestions(ques,lgn);
                if(flagg1)
               {
                    out.println("success flag1");
                      RequestDispatcher rd= request.getRequestDispatcher("QuestionsReceived.jsp");
                    rd.forward(request, response);
                }
                else if (flagg2)
                {
                    out.println("success flag2");
                    RequestDispatcher rd= request.getRequestDispatcher("QuestionsReceived.jsp");
                    rd.forward(request, response);
                    
                }
                else
                {
                    out.println("Failed");
                }
                
                
            %>
    </body>
</html>
