<%-- 
    Document   : LogoutJSP
    Created on : Jan 22, 2017, 8:57:32 PM
    Author     : SHUMAIL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LogoutJSP</title>
    </head>
    <body>
        <%
            session = request.getSession(false);
            session.invalidate();
            RequestDispatcher rd= request.getRequestDispatcher("MainPage.html");
            rd.forward(request, response);
         %>
    </body>
</html>
