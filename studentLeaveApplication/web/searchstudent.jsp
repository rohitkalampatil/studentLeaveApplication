<%-- 
    Document   : searchstudent
    Created on : 20 Apr, 2023, 4:19:57 PM
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
            <h2>Your Not Logged In</h2> 
            <a href="index.html">Please Login</a>
    <%      }
            else
            {
                String branch = (String)session.getAttribute("branch");
     %> 
        
        <table  class="table table-hover">
            <th>Name</th>
            <th>roll no</th>
            <th>PRN no</th>
            <th>contact no</th>
            <th>Email Id</th>
            <th>Year</th>
            <th>branch</th>
        <%
           Statement st=null;
            Connection c1=null;
            String q="",sname="",stdbranch="";
            long contact=0;
            int rollno=0;
            int prn=Integer.parseInt(request.getParameter("studentid"));
            try
            {
              Class.forName("com.mysql.jdbc.Driver"); 
              c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
              //out.println("Database Connected Succesfully");
              
                           
              st=c1.createStatement();
              q="select * from student where prn="+prn+" and branch='"+branch+"'";
              ResultSet r=st.executeQuery(q);
              if(r.next())
              {
        %>
            <tr>
            <td><%= sname=r.getString("name")%></td>
            <td><%= rollno=r.getInt("rollno") %></td>
            <td><%= prn=r.getInt("prn") %></td>
            <td><%= contact=r.getLong("contact") %></td>
            <td><%= r.getString("semail") %></td>
            <td><%= r.getString("year") %></td>
            <td><%= stdbranch=r.getString("branch") %></td>
            
           <%-- <td><a href="#">Delet Record</a></td>
            <td><a href="#">Update Record</a></td>--%>
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
        </table>
    </body>
</html>
