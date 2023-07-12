<%-- 
    Document   : inboxview
    Created on : Apr 23, 2023, 4:25:55 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
            Statement st=null;
            Connection c1=null;
            String q="";
            try
            {
              Class.forName("com.mysql.jdbc.Driver"); 
              c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
              out.println("Database Connected Succesfully");
              
                           
              st=c1.createStatement();
              
              
              
              st.close();
            }
            catch(Exception e)
            {
                out.println("Student Exception"+e);
            }


%>
    </body>
</html>
