<%-- 
    Document   : apply
    Created on : Apr 23, 2023, 4:02:23 PM
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
            
            int applicationid=Integer.parseInt(request.getParameter("applicationid"));
            String name = request.getParameter("sname");
            int prn=Integer.parseInt(request.getParameter("prn"));
            String branch=request.getParameter("branch");
            long contact = Long.parseLong(request.getParameter("contact"));
            String email = request.getParameter("semail");
            String leavefrom=request.getParameter("leavefrom");
            String leaveto=request.getParameter("leaveto");
            String reason = request.getParameter("reason");
               
            //out.print(leavefrom+""+leaveto);
            try
            {
              Class.forName("com.mysql.jdbc.Driver"); 
              c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
              //out.println("Database Connected Succesfully");
              
                           
              st=c1.createStatement();
              q="insert into leaveapplications values("+applicationid+",'"+name+"',"+prn+",'"+branch+"',"+contact+",'"+email+"','"+leavefrom+"','"+leaveto+"','"+reason+"','')";
              int r=st.executeUpdate(q);
              if(r>0)
              {
                  out.print("added");
              }
              else
              {
                     out.print("not added");
              }
              
              st.close();
            }
            catch(Exception e)
            {
                out.println("Student Exception"+e);
            }
        
        
        %>
        <script type='text/javascript'>
            alert("Leave Application send Successfully..");
            location="studentpannel.html";
        </script>
    </body>
</html>
