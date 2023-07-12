<%-- 
    Document   : collagelogin
    Created on : 6 May, 2023, 1:19:53 PM
    Author     : Dell 5310
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
            
            String collageid=request.getParameter("cllgid");
            String password=request.getParameter("cllgpwd");
            try
            {
              Class.forName("com.mysql.jdbc.Driver"); 
              c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
              //out.println("Database Connected Succesfully");
              
              //out.println("Database Connected Succesfully"+collageid+"<br>Pass :"+password);             
              st=c1.createStatement();
              q="select collageid,password from collage where collageid='"+collageid+"' and password='"+password+"'";
              ResultSet r=st.executeQuery(q);
            
            
              if(r.next())
              {  
                response.sendRedirect("registerhod.html");      
              }
              else
              {
                  //out.println("Invalid Id or Password");
                  
              }
              
              st.close();
            }
            catch(Exception e)
            {
                out.println("Student Exception"+e);
            }        
        
        %>
    </body>
</html>
