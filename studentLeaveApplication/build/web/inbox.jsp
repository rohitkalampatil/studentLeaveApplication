
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <title>JSP Page</title>
        <style>
            .sidenav {
          height: 100%; /* Full-height: remove this if you want "auto" height */
          width: 160px; /* Set the width of the sidebar */
          position: fixed; /* Fixed Sidebar (stay in place on scroll) */
          z-index: 1; /* Stay on top */
          top: 0; /* Stay at the top */
          left: 0;
          background-color: #333; /* Black */
          overflow-x: hidden; /* Disable horizontal scroll */
          padding-top: 70px;
        }

        /* The navigation menu links */
        .sidenav a {
          padding: 6px 8px 6px 16px;
          text-decoration: none;
          font-size: 25px;
          color: #818181;
          display: block;
        }

        /* When you mouse over the navigation links, change their color */
        .sidenav a:hover {
          color: #f1f1f1;
        }

        /* Style page content */
        .main {
          margin-left: 160px; /* Same as the width of the sidebar */
          padding: 0px 0px;
        }

        /* On smaller screens, where height is less than 450px, change the style of the sidebar (less padding and a smaller font size) */
        @media screen and (max-height: 450px) {
          .sidenav {padding-top: 15px;}
          .sidenav a {font-size: 18px;}
        }
        </style>
    </head>
    <body>
        
        <div class="sidenav">
          <a href="acceptedapplication.jsp">Accepted</a>
          <a href="rejectedapplication.jsp">Rejected</a>
          <a href="inbox.jsp">Pending</a>
          
        </div>
        <div class="main">
        <%
            if(session.getAttribute("branch")==null)
            {
        %>
        <div class="container">
            <h2>Your Not Logged In</h2> 
            <a href="hodlogin.html">Please Login</a>
        </div>
        <%  }
            else
            {
                String branch = (String)session.getAttribute("branch");
        %>           
        
        <div class="container my-4">
            <h1>Leave Applications</h1>
        </div>    
        
    <div class="container">    
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Name</th>
                <th>PRN no</th>
                <th>contact no</th>
                <th>Email ID</th>
                <th>Application id</th>
                <th>branch</th> 
                <th></th> 
                
            </tr>
        </thead>
        <tbody>

<%
                Statement st=null;
                Connection c1=null;
                String q="";
                try
                {
                    Class.forName("com.mysql.jdbc.Driver"); 
                    c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
                    //out.println("Database Connected Succesfully");


                    st=c1.createStatement();
                    q="select * from leaveapplications where branch='"+branch+"' and status=''";
                    ResultSet r=st.executeQuery(q);
                    while(r.next())
                    {
        %>
            <tr>
                <td><%= r.getString("name")%></td>
                <td><%= r.getInt("prn") %></td>
                <td><%= r.getLong("contact") %></td>
                <td><%= r.getString("email")%></td>
                <td><%= r.getInt("applicationid") %></td>
                <td><%= r.getString("branch")%></td>
                <td><a href="viewapplication.jsp?appid=<%= r.getInt(1)%>">view</a></td>
        <%        
                      //String status="";
                      if(r.getString("status").equals(""))
                      {
        %>
                          <td><a href="applicationStatus.jsp?status=accept&&appid=<%= r.getInt(1)%>">Accept</a></td>
                         <td><a href="applicationStatus.jsp?status=reject&&appid=<%= r.getInt(1)%>">Reject</a></td>
        <%                                 
                      }
                      else if(r.getString("status").equals("accept"))
                      {
        %>
                            <%--<td><a href="applicationStatus.jsp?status=reject&&appid=<%= r.getInt(1)%>">Reject</a></td>
                            --%>
        <%
                      }
                      else
                      {
        %>
                            <%--<td><a href="applicationStatus.jsp?status=accept&&appid=<%= r.getInt(1)%>">Accept</a></td>
                            --%>
        <%
                      }      
        %>        
                
                
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
        
    </div>
        </div>
    </body>
</html>
