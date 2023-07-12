<%-- 
    Document   : hodlogin
    Created on : 19 Apr, 2023, 6:26:27 PM
    Author     : Dell 5310
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <p>
            <%@ page import="java.sql.*"  %>
            Statement st=null;
            Connection c1=null;
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
       
        <script type='text/javascript'>
            alert("Invalid Admin");
            location="alogin.html";
                </script></p>
    </body>
</html>
