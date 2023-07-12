<%-- 
    Document   : viewapplication
    Created on : Apr 27, 2023, 2:33:01 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <title>view Page</title>
    </head>
    <body>
      
        <%
                Statement st=null;
                Connection c1=null;
                String q="",reason="",name="",year="",branch="",leavefrom="",leaveto="",email="";
                long contact=0;
                try
                {
                  Class.forName("com.mysql.jdbc.Driver"); 
                  c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
                  //out.println("Database Connected Succesfully");

                  int appid=Integer.parseInt(request.getParameter("appid"));
                  st=c1.createStatement();
                  q="select * from leaveapplications where applicationid="+appid;

                  ResultSet r =st.executeQuery(q);
                  if(r.next())
                  {
                      reason=r.getString("reason");
                      name=r.getString("name");
                      //year=r.getString("year");
                      branch=r.getString("branch");
                      leavefrom=r.getString("leavefrom");
                      leaveto=r.getString("leaveto");
                      contact=r.getLong("contact");
                      email=r.getString("email");
                  }
                  
        %>
        <div class="container">
            <br><br><br>
            <center>
            <h3>Leave Application</h3>
            </center>
            <br><br>
            <pre>
            To Principle/HOD,
            Collage of Engineering Ambajogai 431517,
            
                Subject :- Wanted leave from <b><%= leavefrom %></b> to <b><%= leaveto %></b>
                
                Respected sir/Madam,

                        I am Student <b><%= name%></b> pursuing in branch <b><%= branch%></b> due to following Reason <b><%= reason %></b> i want leave 
                    from <b><%= leavefrom %></b> to <b><%= leaveto %></b>,Day After<b> <%= leaveto %></b> i will continue my Class.
                        This is kindly request to you,i hope you will accept my Leave.

                                
                                                                                                                    Yours faithfully
                                                                                                                   <b><%= name %>
                                                                                                                    <%= contact %>
                                                                                                                   <%= email %></b>
            </pre>
        </div>
        
        <%          
                  st.close();
                }
                catch(Exception e)
                {
                    out.println("Student Exception"+e);
                }
            
        %>
    </body>
</html>
