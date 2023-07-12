<%-- 
    Document   : allstudents
    Created on : 20 Apr, 2023, 3:54:20 PM
    Author     : Dell 5310
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("branch")==null)
            {
        %>
            <h2>Your Not LoggedIn</h2> 
            <a href="index.html">Please Login</a>
        <%  }
            else
            {
                String branch = (String)session.getAttribute("branch");
        %>           
           
            
            
            
            
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">roll no</th>
                <th scope="col">PRN no</th>
                <th scope="col">contact no</th>
                <th scope="col">Email ID</th>
                <th scope="col">branch</th>
                <th>Year</th>
                <th></th>

            </tr>
        </thead>
        <tbody>

        <%
            Statement st=null;
            Connection c1=null;
            String q="";
            
            String sname="",stdbranch="";
            int rollno=0;
            long contact=0;
            try
            {
              Class.forName("com.mysql.jdbc.Driver"); 
              c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
              //out.println("Database Connected Succesfully");
                      
              st=c1.createStatement();
              
              q="select * from student where branch='"+branch+"'";
              ResultSet r=st.executeQuery(q);
              while(r.next())
              {
        %>
            <tr>
                <td><%= sname=r.getString("name")%></td>
                <td><%= rollno=r.getInt("rollno") %></td>
                <td><%= r.getInt("prn") %></td>
                <td><%= contact=r.getLong("contact") %></td>
                <td><%= r.getString("semail") %></td>
                <td><%= stdbranch=r.getString("branch") %></td>
                <td><%= r.getString("year") %></td>
                <td><a href="update.jsp?update=<%= r.getInt(3)%>">update</a></td>
            </tr>
        <%
              }
              
              st.close();
            }
            catch(Exception e)
            {
                out.println("Student Exception"+e);
            }
}
        %>
        </tbody>
    </table>    
    </body>
</html>
