<%-- 
    Document   : SignUpJSP
    Created on : Jan 22, 2017, 7:53:54 PM
    Author     : SHUMAIL
--%>
<%@page import="BeanClasses.user,BeanClasses.DBHandler" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUpJSP</title>
    </head>
    <body>
       <jsp:useBean id="u" class="BeanClasses.user" scope="session"></jsp:useBean>
        <jsp:setProperty name="u" property="firstName" param="firstName"/>
        <jsp:setProperty name="u" property="lastName" param="lastName"/>
        <jsp:setProperty name="u" property="password" param="password"/>
        <jsp:setProperty name="u" property="loginname" param="loginname"/>
        <jsp:setProperty name="u" property="email" param="email"/>
        <jsp:setProperty name="u" property="mobileNumber" param="mobileNumber"/>
        <jsp:setProperty name="u" property="gender" param="gender"/>
      
        
     <% 
         session.setAttribute("loginname", u.getLoginname());
               DBHandler db = new DBHandler();
               boolean flag = db.AddAccountToTable(u);
               if(flag == true)
               {
                   out.println("Success");
                   
                    RequestDispatcher rd= request.getRequestDispatcher("QuestionsAnsweredJSP.jsp");
                    rd.forward(request, response);
               }
               else
               {
                   out.println("Failed");
                    RequestDispatcher rd= request.getRequestDispatcher("SignUpJSP.jsp");
                    rd.include(request, response);
               }
        %>
        
       
    </body>
</html>
