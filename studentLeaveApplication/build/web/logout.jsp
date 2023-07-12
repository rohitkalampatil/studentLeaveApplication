<%-- 
    Document   : logout
    Created on : Apr 23, 2023, 5:19:17 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
        HttpSession s1 = request.getSession(false);
        s1.setAttribute("rollno",null);
        s1.setAttribute("branch",null);
        s1.invalidate();
        s1.getMaxInactiveInterval();
       response.sendRedirect("index.html");
       %>
    </body>
</html>
