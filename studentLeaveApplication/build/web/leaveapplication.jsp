<%-- 
    Document   : leaveapplication
    Created on : Apr 23, 2023, 3:33:54 PM
    Author     : hp
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
            if(session.getAttribute("prn")==null)
            {
        %>
            <h2>Your Not Logged In</h2> 
            <a href="studentlogin.html">Please Login</a>
            
            <%  }
            else
            {
                int prn = (int)session.getAttribute("prn");
                String email=(String)session.getAttribute("email");

                Statement st;
                Connection c1=null;
                String q="";
                
                String name="",branch="";
                long contact=0;
                int rollno=0;
                String year="";
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
                    rollno=r.getInt("rollno");
                    prn=r.getInt("prn");
                    name=r.getString("name");
                    contact=r.getLong("contact");
                    branch=r.getString("branch");
                    year=r.getString("year");
                    //email=r.getString("semail");
                  }
                  q="select max(applicationid) from leaveapplications";
                  r=st.executeQuery(q);
                  if(r.next())
                  {
                    // String applicationid=r.getString("applicationid");
                     //out.print(""+applicationid);
                   //applicationid;  
                  }
%>
            <div class="container">
                <h1>Apply for Leave</h1><br><br>
                <hr>
        
            <form action="apply.jsp" method="post">
        
            
                <label for="applicationid"> Application Id:</label> 
                <input type="text" name="applicationid"  ><br><br>
    
                <label for="sname"> Your Name :</label> 
                <input type="text" name="sname" value="<%= name%>" readonly="true"><br><br>
                
                <label for="rollno"> Your PRN :</label> 
                <input type="number" name="prn" value="<%= prn%>" readonly="true"><br><br>
                
                <label for="branch"> Branch :</label> 
                <input type="text" name="branch" value="<%= branch%>" readonly="true"><br><br>
                
                
                <label for="contact"> Contact :</label> 
                <input type="tel" name="contact" value="<%= contact%>" readonly="true"><br><br>
                
                <label for="rollno"> You Email :</label> 
                <input type="email" name="semail" value="<%= email%>" readonly="true"><br><br>
                
                <label for="leavefrom"> leave from :</label> 
                <input type="date" name="leavefrom" ><br><br>
                
                <label for="leaveto"> leave to :</label> 
                <input type="date" name="leaveto" ><br><br>
                
                <label for="reason"> Reason For Leave:</label> 
                <textarea name="reason" rows="5" cols="30"></textarea>

                <br><hr>
                <input class="btn btn-secondary" type="submit" Value="Apply">
                <input class="btn btn-secondary" type="reset" value="clear">

            </form>

            </div>
        
            
            <%

                  st.close();
                }
                catch(Exception e)
                {
                    out.println("Student Exception"+e);
                }
                
            }
        
            
        
        %>
        

            
        <!---->
    </body>
</html>
