<%-- 
    Document   : loginJSP
    Created on : Jan 22, 2017, 8:30:31 PM
    Author     : SHUMAIL
--%>
<%@page import="BeanClasses.user,BeanClasses.DBHandler" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>loginJSP</title>
    </head>
    <body>
        <jsp:useBean id="u" class="BeanClasses.user" scope="session"></jsp:useBean>
        <jsp:setProperty name="u" property="loginname"/>
        <jsp:setProperty name="u" property="password"/>
         <%
             session.setAttribute("loginname", u.getLoginname());
               DBHandler db = new DBHandler();
               boolean flag = db.SearchAccountFromTable(u);
               if(flag == true)
               {
                 /* if(u.getLoginname().equalsIgnoreCase("admin"))
                  {
                      RequestDispatcher rd= request.getRequestDispatcher("AdminJSP.jsp");
                    rd.forward(request, response);
                  }
                  else
                  {*/ 
                      RequestDispatcher rd= request.getRequestDispatcher("QuestionsAnsweredJSP.jsp");
                    rd.forward(request, response);
                    //}
               }
               else
               {
                   
                    RequestDispatcher rd= request.getRequestDispatcher("LogInPage.html");
                  
                    rd.forward(request, response);
               }
        %>
    </body>
</html>
