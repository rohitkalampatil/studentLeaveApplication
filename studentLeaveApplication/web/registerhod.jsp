<%-- 
    Document   : registerhod
    Created on : Apr 23, 2023, 2:11:25 PM
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
            Statement st;
            Connection c1=null;
            String q="";
            
            String hodname=request.getParameter("hodname");
            String branch=request.getParameter("branch");
            String userid=request.getParameter("userid");
            String password=request.getParameter("pwd");
            //out.print(""+hodname+"<br>"+userid+"<br>"+password);
            try
            {
              Class.forName("com.mysql.jdbc.Driver"); 
              c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
              out.println("Database Connected Succesfully");
                      
              st=c1.createStatement();
              q="insert into hod values('"+hodname+"','"+userid+"','"+password+"','"+branch+"')";
              int r=st.executeUpdate(q);
              if(r>0)
              {
                  //out.print("hod added");
              }
              else
              {
                  //out.print("Not added");
              }
              st.close();
            }
            catch(Exception e)
            {
                out.println("Student Exception"+e);
            }
        
        %>
        <script type='text/javascript'>
                    alert("HOD Added Successfully..");
                    location="hodlogin.html";
        </script>
    </body>
</html>
