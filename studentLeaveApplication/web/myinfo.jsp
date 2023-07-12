<%-- 
    Document   : myinfo
    Created on : Apr 23, 2023, 2:37:44 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <title>MYinfo Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("prn")==null)
            {
        %>
        <div class="container">
            <h2>Your Not LoggedIn</h2> 
            <a href="studentlogin.html">Please Login</a>
        </div>
        <%  }
            else
            {
                String email = (String)session.getAttribute("email");
                int prn = (int)session.getAttribute("prn");
                
                //out.print("<br><h2>Hello!,"+rollno);
                //

                Statement st;
                Connection c1=null;
                String q="";
                try
                {
                  Class.forName("com.mysql.jdbc.Driver"); 
                  c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
                  //out.println("Database Connected Succesfully");


                  st=c1.createStatement();
                  q="select * from student where prn="+prn;
                  ResultSet r=st.executeQuery(q);
                  if(r.next())
                  {
        %>
        <div class="container">
            <pre>
             <h4>Welcome <%= r.getString("name")%></h4>
<strong>
                Roll no :<%= r.getInt("rollno") %>
                PRN no :<%= r.getInt("prn") %>
                Contact No :<%= r.getLong("contact") %>
                My Email :<%= email %>
                Branch :<%= r.getString("branch") %>
                Year :<%= r.getString("year") %>
             </strong>
             </pre>
                <a href='logout.jsp'>Logout</a>
        </div>

        
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
    </body>
</html>
